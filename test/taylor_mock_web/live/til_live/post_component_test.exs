defmodule TaylorMockWeb.Live.TilLive.PostComponentTest do
  @moduledoc false
  use TaylorMockWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  import TaylorMock.TilFixtures, only: [til_fixture: 1]

  alias TaylorMockWeb.Live.TilLive.PostComponent

  test "post component fields", %{conn: conn} do
    post = til_fixture(%{title: "An Elixir Post"})

    html = render_component(PostComponent, post: post)

    assert html =~ post.title
    assert html =~ post.body
    assert html =~ ~s/href="#{Routes.til_show_path(conn, :show, post.slug)}-an-elixir-post">/
  end
end
