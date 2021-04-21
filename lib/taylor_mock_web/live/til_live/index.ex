defmodule TaylorMockWeb.TilLive.Index do
  @moduledoc """
  Index page for TIL posts
  """

  use TaylorMockWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:posts, TaylorMock.Til.all_posts())
      |> assign(:page_title, "Today I Learned")

    {:ok, socket, temporary_assigns: [posts: []]}
  end
end
