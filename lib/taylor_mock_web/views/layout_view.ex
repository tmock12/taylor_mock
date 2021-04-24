defmodule TaylorMockWeb.LayoutView do
  use TaylorMockWeb, :view

  def og_title(%{post: post}) do
    "Today I Learned: #{post.title}"
  end

  def og_title(_assigns), do: "Taylor Mock"

  def og_description(%{post: post}) do
    post.body
  end

  def og_description(_assigns), do: description()

  def og_image(_assigns) do
    TaylorMockWeb.Endpoint.static_url() <> "/images/today-i-learned-card.jpg"
  end

  def description do
    "A software developer and consultant experienced in building applications
    for various business domains. Currently writing Elixir and JavaScript."
  end
end
