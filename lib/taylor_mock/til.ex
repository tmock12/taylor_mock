defmodule TaylorMock.Til do
  @moduledoc """
  Access functions for Today I Learned (TIL) posts.
  """

  alias TaylorMock.Til.NimbleStore

  @doc """
  Returns all posts, sorted by date
  """
  def all_posts, do: NimbleStore.all_posts()
end
