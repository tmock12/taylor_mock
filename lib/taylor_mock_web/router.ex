defmodule TaylorMockWeb.Router do
  use TaylorMockWeb, :router

  import TaylorMockWeb.UserAuth
  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TaylorMockWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TaylorMockWeb do
    pipe_through :browser

    delete "/log_out", UserSessionController, :delete
    get "/", MarketingController, :welcome
    live "/til", TilLive.Index, :index
    live "/til/:slug", TilLive.Show, :show
  end

  ## Authentication routes

  scope "/", TaylorMockWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/log_in", UserSessionController, :new
    post "/log_in", UserSessionController, :create
  end

  scope "/", TaylorMockWeb do
    pipe_through [:browser, :require_authenticated_user]

    live "/posts", PostLive.Index, :index
    live "/posts/new", PostLive.New, :new

    live_dashboard "/dashboard", metrics: TaylorMockWeb.Telemetry
  end
end
