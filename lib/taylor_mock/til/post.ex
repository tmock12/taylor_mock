defmodule TaylorMock.Til.Post do
  @moduledoc """
  Struct for a TIL post
  """

  @enforce_keys [:title, :body, :slug, :tags, :date]
  defstruct [:title, :body, :slug, :tags, :date]

  def build(filename, attrs, body) do
    <<slug::size(10)-binary, _rest::binary>> = Path.basename(filename)
    struct!(__MODULE__, [body: body, slug: slug] ++ Map.to_list(attrs))
  end
end
