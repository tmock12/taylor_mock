defmodule TaylorMockWeb.PostLiveTest do
  use TaylorMockWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "New" do
    setup :register_and_log_in_user

    test "renders new post form", %{conn: conn} do
      {:ok, live, html} = live(conn, Routes.post_new_path(conn, :new))

      assert html =~ "New Post"

      invalid_change_html =
        live
        |> form("#post-form", post: %{title: "", body: ""})
        |> render_change()

      assert invalid_change_html =~ "post-form_title\">can&apos;t be blank"
      assert invalid_change_html =~ "post-form_body\">can&apos;t be blank"

      refute live
             |> form("#post-form", post: %{title: "A Title", body: "The Body"})
             |> render_change() =~ "can&apos;t be blank",
             "Removes errors on valid change"

      {:ok, _, html} =
        live
        |> form("#post-form", post: %{title: "A Title", body: "The Body"})
        |> render_submit()
        |> follow_redirect(conn)

      assert html =~ "Post created successfully"
    end
  end
end
