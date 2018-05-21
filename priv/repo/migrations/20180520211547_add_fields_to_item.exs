defmodule ItemsApi.Repo.Migrations.AddFieldsToItem do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :latitud, :float
      add :longitud, :float
    end
  end
end
