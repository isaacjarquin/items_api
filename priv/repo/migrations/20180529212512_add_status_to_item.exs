defmodule ItemsApi.Repo.Migrations.AddStatusToItem do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :status, :string
    end
  end
end
