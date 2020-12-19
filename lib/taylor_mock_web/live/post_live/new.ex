defmodule TaylorMockWeb.PostLive.New do
  @moduledoc """
  Authentication required form for creating a new post.
  """
  use TaylorMockWeb, :live_view

  @impl true
  def mount(_params, session, socket) do
    socket =
      socket
      |> assign(:page_title, "New Post")
      |> assign(:post, %TaylorMock.Blog.Post{})
      |> assign_new(:current_user, fn ->
        TaylorMock.Accounts.get_user_by_session_token(session["user_token"])
      end)

    {:ok, socket}
  end
end
