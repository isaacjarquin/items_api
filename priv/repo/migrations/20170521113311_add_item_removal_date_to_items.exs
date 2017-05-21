defmodule ItemsApi.Repo.Migrations.AddItemRemovalDateToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :item_removal_date, :date
    end
  end
end
