defmodule TaylorMock.Til.Post do
  @moduledoc """
  Struct for a TIL post
  """

  @enforce_keys [:title, :body, :slug, :tags, :date]
  defstruct [:title, :body, :slug, :tags, :date]

  def build(_filename, attrs, body) do
    struct!(__MODULE__, [body: body] ++ Map.to_list(attrs))
  end
end
