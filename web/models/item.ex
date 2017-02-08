defmodule ItemsApi.Item do
  use ItemsApi.Web, :model

  schema "items" do
    field :name, :string
    field :email, :string
    field :kind, :string
    field :size, :string
    field :date, Ecto.Date
    field :location, :string
    field :info, :string
    field :image, :string

    timestamps
  end

  @required_fields ~w(name email kind size date location info image)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
