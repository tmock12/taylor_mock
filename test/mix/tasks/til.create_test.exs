defmodule Mix.Tasks.Til.CreateTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias Mix.Tasks.Til.Create
  Mix.shell(Mix.Shell.Process)

  test "raises when not passed a title" do
    message = "mix til.create expects a title as first argument"
    assert_raise Mix.Error, message, fn -> Create.run([]) end
  end

  test "creates a new til template with supplied title" do
    Create.run(["A Cool Title"])

    expected_file = expected_til_path() <> "a-cool-title.md"

    expected_message = "Find your new TIL at #{expected_file}"
    assert_received {:mix_shell, :info, [^expected_message]}

    assert_file(expected_file, ~s(title: "A Cool Title"))
    assert_file(expected_file, ~s(date: ~D[#{Date.utc_today()}]))
    assert_file(expected_file, ~r/slug: "\w{10}"/)

    File.rm!(expected_file)
  end

  defp expected_til_path do
    Application.get_env(:taylor_mock, :nimble_store)[:til_path]
    |> String.split("*")
    |> hd()
  end

  defp assert_file(file, match) do
    assert File.read!(file) =~ match
  end
end
