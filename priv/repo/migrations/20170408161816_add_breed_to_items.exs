defmodule ItemsApi.Repo.Migrations.AddBreedToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :breed, :string
    end
  end
end
