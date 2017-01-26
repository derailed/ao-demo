defmodule Store.EvenTest do
  use Store.Case

  alias Store.UseCases, as: UC

  setup do
    UC.clear_all
    :ok
  end

  test "insert/2 -- new evemt" do
    UC.new_event("Blee")

    {:ok, events} = Event.all
    assert length(events) == 1
  end
end
