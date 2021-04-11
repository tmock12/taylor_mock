defmodule TaylorMockWeb.Live.TilLive.IndexTest do
  use TaylorMockWeb.ConnCase, async: true

  import Phoenix.LiveViewTest
  @first_til_section "[data-test='til-section']:nth-child(1) "
  @second_til_section "[data-test='til-section']:nth-child(2) "

  test "renders list of posts", %{conn: conn} do
    {:ok, live, html} = live(conn, Routes.til_index_path(conn, :index))

    assert html =~ "Today I Learned</h1>"

    [first_post, second_post] = TaylorMock.Til.all_posts()

    assert has_element?(live, @first_til_section, first_post.title)
    assert has_element?(live, @first_til_section, to_string(first_post.date))
    assert html =~ ~s/href="#{Routes.til_show_path(conn, :show, first_post.slug)}"/

    assert has_element?(live, @second_til_section, second_post.title)
    assert has_element?(live, @second_til_section, to_string(second_post.date))
    assert html =~ ~s/href="#{Routes.til_show_path(conn, :show, second_post.slug)}"/
  end
end
