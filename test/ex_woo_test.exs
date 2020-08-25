defmodule ExWooTest do
  use ExUnit.Case
  doctest ExWoo

  test "greets the world" do
    assert ExWoo.hello() == :world
  end
end
