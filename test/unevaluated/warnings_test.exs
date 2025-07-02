defmodule ExonerateTest.Unevaluated.WarningsTest do
  use ExUnit.Case, async: true
  require Exonerate

  describe "when as part of a primary operation =9" do
    Exonerate.function_from_string(
      :def,
      :with_properties,
      """
      {
        "type": "object",
        "properties": {"foo": {"type": "string"}},
        "unevaluatedProperties": {"type": "number"}
      }
      """
    )

    test "with properties 2" do
      assert {:error, _} = with_properties(%{"foo" => 42})
      # assert :ok = with_properties(%{"foo" => "bar"})
      # assert :ok = with_properties(%{"foo" => "bar", "baz" => 47})
      # assert {:error, _} = with_properties(%{"foo" => "bar", "baz" => "quux"})
    end
  end
end
