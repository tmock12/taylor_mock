defmodule TaylorMockWeb.MarketingController do
  use TaylorMockWeb, :controller

  def welcome(conn, _params) do
    render(conn, "welcome.html")
  end
end
