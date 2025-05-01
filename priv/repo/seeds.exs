films = [
  %{
    name: "The Shawshank Redemption",
    year: 1994,
    actors: [
      %{name: "Tim Robbins", born: 1960},
      %{name: "Morgan Freeman", born: 1937}
    ]
  },
  %{
    name: "The Godfather",
    year: 1972,
    actors: [
      %{name: "Marlon Brando", born: 1924},
      %{name: "Al Pacino", born: 1940}
    ]
  },
  %{
    name: "The Dark Knight",
    year: 2008,
    actors: [
      %{name: "Christian Bale", born: 1974},
      %{name: "Heath Ledger", born: 1979}
    ]
  }
]

films
|> Enum.each(fn film ->
  %Many.Films.Film{}
  |> Many.Films.Film.changeset(film)
  |> Many.Repo.insert!()
end)

actors = [
  %{
    name: "Tim Robbins",
    born: 1960,
    films: [
      %{name: "The Shawshank Redemption", year: 1994}
    ]
  },
  %{
    name: "Morgan Freeman",
    born: 1937,
    films: [
      %{name: "The Shawshank Redemption", year: 1994},
      %{name: "The Dark Knight", year: 2008}
    ]
  },
  %{
    name: "Marlon Brando",
    born: 1924,
    films: [
      %{name: "The Godfather", year: 1972}
    ]
  }
]

actors
|> Enum.each(fn actor ->
  %Many.Actors.Actor{}
  |> Many.Actors.Actor.changeset(actor)
  |> Many.Repo.insert!()
end)
