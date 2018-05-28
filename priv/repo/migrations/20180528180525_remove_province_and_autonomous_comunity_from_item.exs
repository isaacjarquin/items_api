defmodule ItemsApi.Repo.Migrations.RemoveProvinceAndAutonomousComunityFromItem do
  use Ecto.Migration

  def change do
    alter table(:items) do
      remove :province
      remove :autonomous_comunity
    end
  end
end
