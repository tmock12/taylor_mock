defmodule TaylorMockWeb.Router do
  use TaylorMockWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TaylorMockWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TaylorMockWeb do
    pipe_through :browser

    get "/", MarketingController, :welcome
    live "/til", TilLive.Index, :index
    live "/til/:titled_slug", TilLive.Show, :show
  end
end
