defmodule ItemsApi.Repo.Migrations.ChangeDatetimeToDateAndAddImage do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :image, :string
      remove :date
      add :date, :date
    end
  end
end
