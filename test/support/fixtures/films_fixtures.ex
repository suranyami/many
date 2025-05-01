defmodule Many.FilmsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Many.Films` context.
  """

  @doc """
  Generate a film.
  """
  def film_fixture(attrs \\ %{}) do
    {:ok, film} =
      attrs
      |> Enum.into(%{
        name: "some name",
        year: 1981
      })
      |> Many.Films.create_film()

    film
  end
end
