defmodule Many.ActorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Many.Actors` context.
  """

  @doc """
  Generate a actor.
  """
  def actor_fixture(attrs \\ %{}) do
    {:ok, actor} =
      attrs
      |> Enum.into(%{
        born: 42,
        name: "some name"
      })
      |> Many.Actors.create_actor()

    actor
  end
end
