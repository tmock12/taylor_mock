defmodule TaylorMock.TilFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TaylorMock.Til` context.
  """

  def til_fixture(attrs \\ %{}) do
    %TaylorMock.Til.Post{
      title: "Post Title",
      body: "<h3>Post Body</h3>",
      slug: random_slug(),
      tags: ~w(Elixir Erlang),
      date: Date.utc_today()
    }
    |> Map.merge(attrs)
  end

  defp random_slug do
    :crypto.strong_rand_bytes(16)
    |> Base.url_encode64()
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]/, "")
    |> String.slice(0, 10)
  end
end
