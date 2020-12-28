defmodule TaylorMockWeb.PostLive.Index do
  @moduledoc """
  Index page for blog posts
  """
  use TaylorMockWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket = assign(socket, :posts, TaylorMock.Blog.list_posts())

    {:ok, socket}
  end
end
