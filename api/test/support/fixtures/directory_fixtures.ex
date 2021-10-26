defmodule Api.DirectoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Directory` context.
  """

  @doc """
  Generate a university.
  """
  def university_fixture(attrs \\ %{}) do
    {:ok, university} =
      attrs
      |> Enum.into(%{
        city: "some city",
        initials: "some initials",
        name: "some name",
        students: 42
      })
      |> Api.Directory.create_university()

    university
  end
end
