defmodule ItemsApi.Repo.Migrations.CreateContactUs do
  use Ecto.Migration

  def change do
    create table(:contact_us) do
      add :name, :string
      add :email, :string
      add :details, :text
      add :email_sent, :boolean, default: false, null: false

      timestamps()
    end

  end
end
