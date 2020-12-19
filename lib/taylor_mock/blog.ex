defmodule TaylorMock.Blog do
  @moduledoc """
  The Blog context for handling blog posts.
  """

  import Ecto.Query, warn: false
  alias TaylorMock.Repo

  alias TaylorMock.Blog.Post
  alias TaylorMock.Accounts.User

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%User{id: 123}, %{field: value})
      {:ok, %Post{}}

      iex> create_post(%User{id: 123}, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(%User{id: user_id}, attrs \\ %{}) do
    %Post{user_id: user_id}
    |> Post.create_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end
end
