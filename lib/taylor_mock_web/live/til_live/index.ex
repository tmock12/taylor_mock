defmodule TaylorMockWeb.TilLive.Index do
  @moduledoc """
  Index page for TIL posts
  """

  use TaylorMockWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :posts, TaylorMock.Til.all_posts())
    {:ok, socket, temporary_assigns: [posts: []]}
  end
end
