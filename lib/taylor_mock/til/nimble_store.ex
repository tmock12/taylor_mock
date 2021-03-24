defmodule TaylorMock.Til.NimbleStore do
  use NimblePublisher,
    build: TaylorMock.Til.Post,
    from: Application.get_env(:taylor_mock, :nimble_store)[:til_path],
    as: :posts,
    highlighters: [:makeup_elixir]

  @moduledoc false
  @posts Enum.sort_by(@posts, & &1.date, {:desc, Date})

  def all_posts, do: @posts
end
