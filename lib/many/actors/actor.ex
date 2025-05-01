defmodule Many.Actors.Actor do
  use Ecto.Schema
  import Ecto.Changeset
  alias Many.Films.Film
  alias Many.Repo

  schema "actors" do
    field :name, :string
    field :born, :integer

    many_to_many :films, Many.Films.Film, join_through: "film_actors"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(actor, attrs) do
    actor
    |> cast(attrs, [:name, :born])
    |> validate_required([:name, :born])
    |> put_assoc(:films, parse_films(attrs))
  end

  defp parse_films(params) do
    (params["films"] || [])
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&get_or_insert_film/1)
  end

  defp get_or_insert_film(attrs = %{name: name, year: year}) do
    Repo.get_by(Film, attrs) ||
      Repo.insert!(%Film{name: name, year: year})
  end
end
