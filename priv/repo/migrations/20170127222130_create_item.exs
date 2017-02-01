defmodule ItemsApi.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :email, :string
      add :kind, :string
      add :size, :string
      add :date, :datetime
      add :location, :string
      add :info, :text

      timestamps
    end

  end
end
