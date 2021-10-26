defmodule Api.Repo.Migrations.CreateUniversities do
  use Ecto.Migration

  def change do
    create table(:universities) do
      add :name, :string
      add :city, :string
      add :initials, :string
      add :students, :integer

      timestamps()
    end
  end
end
