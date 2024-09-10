defmodule AuthentikClientTest do
  use ExUnit.Case
  doctest AuthentikClient

  test "greets the world" do
    assert AuthentikClient.hello() == :world
  end
end
