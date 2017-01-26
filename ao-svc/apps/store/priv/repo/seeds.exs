alias Store.{Repo, Player, Event, Draw, Match, Ranking}

Match.clear
Draw.clear
Player.clear
Ranking.clear
Event.clear

ao = %Event{
  name: "Australian Open",
  year: 2017,
} |> Repo.insert!

qr = %Draw {
  event: ao,
  round: "QF"
} |> Repo.insert!

sm = %Draw {
  event: ao,
  round: "SF"
} |> Repo.insert!

f = %Draw {
  event: ao,
  round: "F"
} |> Repo.insert!


r = %Ranking{
  rank: 17
} |> Repo.insert!
rf = %Player{
  name:    "Roger Federer",
  ranking: r,
  age:     35,
  country: "Switzerland",
  gender:  "M"
} |> Repo.insert!

r = %Ranking{
  rank: 9
} |> Repo.insert!
rn = %Player{
  name:    "Rafael Nadal",
  ranking: r,
  age:     30,
  country: "Spain",
  gender:  "M"
} |> Repo.insert!

r = %Ranking{
  rank: 12
} |> Repo.insert!
jw = %Player{
  name:    "Jo Tsonga",
  ranking: r,
  age:     31,
  country: "France",
  gender:  "M"
} |> Repo.insert!

r = %Ranking{
  rank: 50
} |> Repo.insert!
mz = %Player{
  name:    "Micha Zverev",
  ranking: r,
  age:     29,
  country: "Germany",
  gender:  "M"
} |> Repo.insert!

r = %Ranking{
  rank: 4
} |> Repo.insert!
sw = %Player{
  name:    "Stan Wawrinka",
  ranking: r,
  age:     32,
  country: "Switzerland",
  gender:  "M"
} |> Repo.insert!

r = %Ranking{
  rank: 3
} |> Repo.insert!
mr = %Player{
  name:    "Milos Raonic",
  ranking: r,
  age:     27,
  country: "Canada",
  gender:  "M"
} |> Repo.insert!

r = %Ranking{
  rank: 119
} |> Repo.insert!
gd = %Player{
  name:    "Grigor Dimitrov",
  ranking: r,
  age:     26,
  country: "Bulgaria",
  gender:  "M"
} |> Repo.insert!

r = %Ranking{
  rank: 15
} |> Repo.insert!
dg = %Player{
  name:    "David Goffin",
  ranking: r,
  age:     26,
  country: "Belgium",
  gender:  "M"
} |> Repo.insert!

# -----------------------------
# Quarters
%Match{
  draw:  qr,
  p1:    rf,
  p2:    mz,
  court: "Rod Laver Arena",
  score: [6,3,7,5,6,1]
} |> Repo.insert!

%Match{
  draw:  qr,
  p1:    sw,
  p2:    jw,
  court: "Margaret Arena",
  score: [6,4,4,6,6,2,3,6,7,5]
} |> Repo.insert!

%Match{
  draw:  qr,
  p1:    mr,
  p2:    rn,
  court: "Court 2",
  score: [4,6,6,7,4,6]
} |> Repo.insert!

%Match{
  draw:  qr,
  p1:    gd,
  p2:    dg,
  court: "Court 3",
  score: [6,1,6,2,6,3]
} |> Repo.insert!

# -----------------------------
# Semis
%Match{
  draw:  sm,
  p1:    sw,
  p2:    rf,
  court: "Rod Laver Arena",
  score: [6,4,4,6,6,3,6,4]
} |> Repo.insert!

%Match{
  draw:  sm,
  p1:    rn,
  p2:    gd,
  court: "Margaret Arena",
  score: [6,4,4,6,6,2,6,4]
} |> Repo.insert!

# -----------------------------
# Final
%Match{
  draw:  f,
  p1:    sw,
  p2:    rn,
  court: "Rod Laver Arena",
  score: [6,2,2,6,6,3,7,5]
} |> Repo.insert!

