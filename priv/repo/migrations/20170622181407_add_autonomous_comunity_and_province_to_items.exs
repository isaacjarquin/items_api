defmodule ItemsApi.Repo.Migrations.AddAutonomousComunityAndProvinceToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :autonomous_comunity, :string
      add :province, :string
    end
  end
end
