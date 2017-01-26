defmodule Store.UseCases do
  @moduledoc false
  alias Store.{Repo, Player, Match, Draw, Ranking, Event}

  def clear_all do
    Match.clear
    Player.clear
    Draw.clear
    Ranking.clear
    Event.clear
  end

  def new_player(name, gender \\ "M", age \\ 17, country \\ "USA") do
    %Player{
      name:    name,
      gender:  gender,
      country: country,
      age:     age
    }
    |> Repo.insert!
  end

  def new_match(p1, p2, draw, score \\ [6,0,6,0,6,0], court \\ "Blee") do
    %Match{
      p1:    p1,
      p2:    p2,
      draw:  draw,
      score: score,
      court: court
    }
    |> Repo.insert!
  end

  def new_event(name, year \\ 2017) do
    %Event{
      name: name,
      year: year
    }
    |> Repo.insert!
  end

  def new_draw(round, event \\ new_event("Blee") ) do
    %Draw{
      event: event,
      round: round,
    }
    |> Repo.insert!
  end
end
