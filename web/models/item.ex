defmodule ItemsApi.Item do
  use ItemsApi.Web, :model

  schema "items" do
    field :name, :string
    field :email, :string
    field :kind, :string
    field :status, :string
    field :breed, :string
    field :size, :string
    field :date, Ecto.Date
    field :item_removal_date, Ecto.Date
    field :location, :string
    field :latitud, :float
    field :longitud, :float
    field :info, :string
    field :image, :string

    timestamps
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email, :kind, :status, :breed, :size, :date, :location, :latitud, :longitud, :info, :image, :item_removal_date])
    |> validate_required([:name, :email, :kind, :breed, :size, :date, :location, :info, :image])
  end
end
