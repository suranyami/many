defmodule Many.Repo.Migrations.AddFilmActors do
  use Ecto.Migration

  def change do
    create table(:film_actors) do
      add(:film_id, references(:films, on_delete: :delete_all))
      add(:actor_id, references(:actors, on_delete: :delete_all))
    end

    create unique_index(:film_actors, [:film_id, :actor_id], name: :unique_film_actor)
    create index(:film_actors, [:film_id, :actor_id])
  end
end
