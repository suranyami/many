defmodule Many.FilmsTest do
  use Many.DataCase

  alias Many.Films

  describe "films" do
    alias Many.Films.Film

    import Many.FilmsFixtures

    @invalid_attrs %{name: nil, year: nil}

    test "list_films/0 returns all films" do
      film = film_fixture()
      assert Films.list_films() == [film]
    end

    test "get_film!/1 returns the film with given id" do
      film = film_fixture()
      assert Films.get_film!(film.id) == film
    end

    test "create_film/1 with valid data creates a film" do
      valid_attrs = %{name: "some name", year: 1980}

      assert {:ok, %Film{} = film} = Films.create_film(valid_attrs)
      assert film.name == "some name"
      assert film.year == 1980
    end

    test "create_film/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Films.create_film(@invalid_attrs)
    end

    test "update_film/2 with valid data updates the film" do
      film = film_fixture()
      update_attrs = %{name: "some updated name", year: 1982}

      assert {:ok, %Film{} = film} = Films.update_film(film, update_attrs)
      assert film.name == "some updated name"
      assert film.year == 1982
    end

    test "update_film/2 with invalid data returns error changeset" do
      film = film_fixture()
      assert {:error, %Ecto.Changeset{}} = Films.update_film(film, @invalid_attrs)
      assert film == Films.get_film!(film.id)
    end

    test "delete_film/1 deletes the film" do
      film = film_fixture()
      assert {:ok, %Film{}} = Films.delete_film(film)
      assert_raise Ecto.NoResultsError, fn -> Films.get_film!(film.id) end
    end

    test "change_film/1 returns a film changeset" do
      film = film_fixture()
      assert %Ecto.Changeset{} = Films.change_film(film)
    end
  end
end
