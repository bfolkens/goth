defmodule GoogleAuth.ConfigTest do
  use ExUnit.Case
  alias GoogleAuth.Config

  test "setting and retrieving values" do
    Config.set(:key, "123")
    assert {:ok, "123"} == Config.get(:key)
  end

  test "the initial state is what's passed in from the app config" do
    state = "config/test-credentials.json" |> Path.expand |> File.read! |> Poison.decode!
    state |> Map.keys |> Enum.each(fn(key) ->
      assert {:ok, state[key]} == Config.get(key)
    end)
  end
end
