defmodule Many.Films.Film do
  use Ecto.Schema
  import Ecto.Changeset

  schema "films" do
    field(:name, :string)
    field(:year, :integer)

    many_to_many(:actors, Many.Actors.Actor, join_through: "film_actors")

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(film, attrs) do
    film
    |> cast(attrs, [:name, :year])
    |> validate_required([:name, :year])
    |> unique_constraint(:name)
    |> put_assoc(:actors, parse_actors(attrs))
  end

  defp parse_actors(params) do
    (params["actors"] || [])
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&get_or_insert_actor/1)
  end

  defp get_or_insert_actor(attrs = %{name: name, born: born}) do
    Many.Repo.get_by(Many.Actors.Actor, attrs) ||
      Many.Repo.insert!(%Many.Actors.Actor{name: name, born: born})
  end
end
