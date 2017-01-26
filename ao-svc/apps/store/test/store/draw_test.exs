defmodule Store.DrawTest do
  use Store.Case

  alias Store.UseCases, as: UC

  setup do
    UC.clear_all
    :ok
  end

  test "insert/2 -- new draw" do
    evt = UC.new_event("test")
    draw = UC.new_draw("finals", evt)

    p1 = UC.new_player("p1")
    p2 = UC.new_player("p2")

    UC.new_match(p1, p2, draw, [60,62,63], "Fred")

    {:ok, draws} = Draw.all
    assert length(draws) == 1

    {:ok, draw} = Draw.by(id: draw.id)
    assert length(draw.matches) == 1
  end
end
