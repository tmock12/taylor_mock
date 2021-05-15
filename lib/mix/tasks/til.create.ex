defmodule Mix.Tasks.Til.Create do
  @shortdoc "Create a TIL"

  @moduledoc """
  Creates a TIL template.

    mix til.create [title]

  The title argument is required.

  example: mix til.create "A new post"
  """

  use Mix.Task

  def run([]) do
    Mix.raise("mix til.create expects a title as first argument")
  end

  def run([title | _rest]) do
    template = """
    %{
      title: "#{title}",
      tags: ~w(),
      date: ~D[#{Date.utc_today()}],
      slug: "#{generate_slug()}"
    }

    ---
    """

    til_location = Path.join(til_path(), file_with_extension(title))

    File.write!(til_location, template)
    Mix.shell().info([:green, "Find your new TIL at #{til_location}"])
  end

  defp generate_slug do
    :crypto.strong_rand_bytes(16)
    |> Base.url_encode64()
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]/, "")
    |> String.slice(0, 10)
  end

  defp til_path do
    Application.get_env(:taylor_mock, :nimble_store)[:til_path]
    |> String.split("*")
    |> hd()
  end

  defp file_with_extension(title) do
    title
    |> String.downcase()
    |> String.replace(~r/[^A-Za-z0-9\s-]/, "")
    |> String.replace(~r/(\s|-)+/, "-")
    |> Kernel.<>(".md")
  end
end
