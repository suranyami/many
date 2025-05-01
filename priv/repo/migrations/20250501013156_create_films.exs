defmodule Many.Repo.Migrations.CreateFilms do
  use Ecto.Migration

  def change do
    create table(:films) do
      add(:name, :string)
      add(:year, :integer)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:films, [:name])
  end
end
