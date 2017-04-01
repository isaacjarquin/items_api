defmodule ItemsApi.ContactDetail do
  use ItemsApi.Web, :model

  schema "contact_details" do
    field :name, :string
    field :email, :string
    field :phone_number, :string
    field :details, :string
    field :item_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :phone_number, :details, :item_id])
    |> validate_required([:name, :email, :phone_number, :details, :item_id])
  end
end
