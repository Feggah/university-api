defmodule Api.Directory.University do
  use Ecto.Schema
  import Ecto.Changeset

  schema "universities" do
    field :city, :string
    field :initials, :string
    field :name, :string
    field :students, :integer

    timestamps()
  end

  @doc false
  def changeset(university, attrs) do
    university
    |> cast(attrs, [:name, :city, :initials, :students])
    |> validate_required([:name, :city, :initials, :students])
  end
end
