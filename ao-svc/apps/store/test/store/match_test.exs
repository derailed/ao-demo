defmodule Store.MatchTest do
  use Store.Case

  alias Store.UseCases, as: UC

  setup do
    UC.clear_all
    :ok
  end

  test "insert/2 -- new player" do
    p1 = UC.new_player("P1")
    p2 = UC.new_player("P2")

    draw = UC.new_draw("finals")
    UC.new_match(p1, p2, draw, [60,60,60], "Blee")

    {:ok, players} = Player.all
    assert length(players) == 2
    {:ok, matches} = Match.all
    assert length(matches) == 1
  end

  test "all" do
    p1 = UC.new_player("P1")
    p2 = UC.new_player("P2")

    draw = UC.new_draw("finals")
    UC.new_match(p1, p2, draw, [60,60,60], "Blee")

    {:ok, matches} = Match.all
    assert length(matches) == 1
IO.inspect matches |> List.first
    assert (matches |> List.first).p1.name == p1.name
    assert (matches |> List.first).p2.name == p2.name
  end
end
