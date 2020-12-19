defmodule TaylorMock.BlogTest do
  use TaylorMock.DataCase
  import TaylorMock.AccountsFixtures, only: [user_fixture: 0]

  alias TaylorMock.Blog

  describe "posts" do
    alias TaylorMock.Blog.Post

    @valid_attrs %{body: "some body", title: "some title"}
    @invalid_attrs %{body: nil, title: nil}

    def post_fixture(user, attrs \\ %{}) do
      attrs = Enum.into(attrs, @valid_attrs)

      {:ok, post} = Blog.create_post(user, attrs)
      post
    end

    test "create_post/2 with valid data creates a post" do
      user = user_fixture()
      assert {:ok, %Post{} = post} = Blog.create_post(user, @valid_attrs)
      assert post.body == "some body"
      assert post.title == "some title"
      assert post.user_id == user.id
    end

    test "create_post/2 with invalid user returns error changeset" do
      user = %TaylorMock.Accounts.User{id: 123}
      assert {:error, %Ecto.Changeset{errors: errors}} = Blog.create_post(user, @valid_attrs)
      assert {"does not exist", _} = errors[:user_id]
    end

    test "create_post/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{errors: errors}} = Blog.create_post(user, @invalid_attrs)
      assert {"can't be blank", _} = errors[:title]
      assert {"can't be blank", _} = errors[:body]
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture(user_fixture())
      assert %Ecto.Changeset{} = Blog.change_post(post)
    end
  end
end
