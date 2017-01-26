defmodule Store.PlayerTest do
  use Store.Case

  alias Store.UseCases, as: UC

  setup do
    UC.clear_all
    :ok
  end

  test "insert/2 -- new player" do
    UC.new_player("Blee")

    {:ok, players} = Player.all
    assert length(players) == 1
  end
end
