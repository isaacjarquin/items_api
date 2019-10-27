defmodule ItemsApi.Repo.Migrations.AddNewPetsFieldsItemTable do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :pet_name, :string
      add :age, :string
      add :sex, :string
      add :character, :string
      add :pet_code, :string
      add :checksum, :string
    end
  end
end
