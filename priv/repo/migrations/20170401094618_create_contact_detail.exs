defmodule ItemsApi.Repo.Migrations.CreateContactDetail do
  use Ecto.Migration

  def change do
    create table(:contact_details) do
      add :name, :string
      add :email, :string
      add :phone_number, :string
      add :details, :text
      add :item_id, :integer

      timestamps()
    end

  end
end
