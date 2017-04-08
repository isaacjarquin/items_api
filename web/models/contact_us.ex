defmodule ItemsApi.ContactUs do
  use ItemsApi.Web, :model

  schema "contact_us" do
    field :name, :string
    field :email, :string
    field :details, :string
    field :email_sent, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :details, :email_sent])
    |> validate_required([:name, :email, :details])
  end
end
