defmodule TaylorMock.Til do
  @moduledoc """
  Access functions for Today I Learned (TIL) posts.
  """

  @doc """
  Returns all posts, sorted by date
  """
  def all_posts, do: TaylorMock.Til.NimbleStore.all_posts()
end
