defmodule TaylorMockWeb.TilLive.Show do
  @moduledoc """
  Show page for TIL post
  """

  use TaylorMockWeb, :live_view

  @impl Phoenix.LiveView
  def handle_params(%{"titled_slug" => titled_slug}, _, socket) do
    post =
      titled_slug
      |> extracted_slug()
      |> TaylorMock.Til.get_post_by_slug!()

    socket =
      socket
      |> assign(:post, post)
      |> assign(:page_title, post.title)

    {:noreply, socket}
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~L"""
    <div class="max-w-5xl px-6 mx-auto">
      <h1 class="text-2xl font-semibold text-center text-gray-800">Today I Learned</h1>
      <div class="flex flex-col items-center justify-center mt-6">
        <%= live_component(TaylorMockWeb.Live.TilLive.PostComponent, post: @post) %>
      </div>
    </div>
    """
  end

  defp extracted_slug(<<slug::size(10)-binary, _rest::binary>>), do: slug
  defp extracted_slug(_), do: nil
end
