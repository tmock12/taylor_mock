defmodule TaylorMockWeb.TilLive.Show do
  @moduledoc """
  Show page for TIL post
  """

  use TaylorMockWeb, :live_view

  @impl Phoenix.LiveView
  def handle_params(%{"slug" => slug}, _, socket) do
    {:noreply, socket |> assign(:post, TaylorMock.Til.get_post_by_slug!(slug))}
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~L"""
    <div class="max-w-5xl px-6 mx-auto">
      <h1 class="text-2xl font-semibold text-center text-gray-800">Today I Learned</h1>
      <div class="flex flex-col items-center justify-center mt-6">
        <%= live_component(@socket, TaylorMockWeb.Live.TilLive.PostComponent, post: @post) %>
      </div>
    </div>
    """
  end
end
