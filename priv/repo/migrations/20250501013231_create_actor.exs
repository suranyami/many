defmodule Many.Repo.Migrations.CreateActor do
  use Ecto.Migration

  def change do
    create table(:actors) do
      add :name, :string
      add :born, :integer

      timestamps(type: :utc_datetime)
    end

    create unique_index(:actors, [:name])
  end
end
