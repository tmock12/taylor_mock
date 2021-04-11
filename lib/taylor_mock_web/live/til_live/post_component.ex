defmodule TaylorMockWeb.Live.TilLive.PostComponent do
  @moduledoc """
  Shared component for viewing a single TIL
  """

  use TaylorMockWeb, :live_component

  def render(assigns) do
    ~L"""
      <div
        class="block w-full max-w-2xl mt-8 bg-white border-t-4 border-gray-300 shadow-md rounded-md"
        data-test="til-section"
        >
        <div class="flex items-center justify-between px-4 py-2">
          <h3 class="text-lg font-medium text-gray-700">
            <%= live_redirect @post.title, to: Routes.til_show_path(@socket, :show, @post.slug), class: "hover:text-blue-600" %>
          </h3>
          <span class="block text-sm font-light text-gray-600">
            <%= @post.date %>
          </span>
        </div>
        <div class="px-4 py-2 border-t-2 border-gray-100 max-w-none prose lg:prose-l">
          <%= raw(@post.body) %>
        </div>
      </div>
    """
  end
end
