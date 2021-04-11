defmodule TaylorMock.Til do
  @moduledoc """
  Access functions for Today I Learned (TIL) posts.
  """

  alias TaylorMock.Til.NimbleStore

  @doc """
  Returns all posts, sorted by date
  """
  def all_posts, do: NimbleStore.all_posts()

  def get_post_by_slug!(slug) do
    Enum.find(all_posts(), &(&1.slug == slug)) ||
      raise NotFoundError, "til with slug=#{slug} not found"
  end
end

defmodule NotFoundError do
  defexception [:message, plug_status: 404]
end
