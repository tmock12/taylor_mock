defmodule TaylorMock.TilTest do
  use ExUnit.Case, async: true

  alias TaylorMock.Til

  describe "all/1" do
    test "parses fields correctly" do
      [most_recent_post | _rest] = Til.all_posts()
      assert most_recent_post.title == "Test Post 2"
      assert most_recent_post.slug == "i5nd9ntnn7"
      assert most_recent_post.body =~ "<h1>\nTitle Post 2</h1>"
    end

    test "sorted by date" do
      [%{date: recent_post_date}, %{date: older_post_date}] = Til.all_posts()
      assert recent_post_date > older_post_date
    end
  end
end
