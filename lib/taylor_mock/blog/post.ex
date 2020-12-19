defmodule TaylorMock.Blog.Post do
  @moduledoc """
  Schema and changeset for a blog post.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :title, :string
    belongs_to :user, TaylorMock.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body, :user_id])
    |> unique_constraint(:title)
  end

  @doc false
  def create_changeset(post, attrs) do
    post
    |> changeset(attrs)
    |> validate_required(:user_id)
    |> foreign_key_constraint(:user_id)
  end
end
