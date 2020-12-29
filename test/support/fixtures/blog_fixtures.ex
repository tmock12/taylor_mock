defmodule TaylorMock.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TaylorMock.Blog` context.
  """
  import TaylorMock.AccountsFixtures, only: [user_fixture: 0]

  def post_fixture(attrs \\ %{}, user \\ user_fixture()) do
    attrs = Enum.into(attrs, %{body: "some body", title: "some title"})

    {:ok, post} = TaylorMock.Blog.create_post(user, attrs)
    post
  end
end
