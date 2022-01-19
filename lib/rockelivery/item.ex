defmodule Rockelivery.Item do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:category, :description, :price, :photo]
  @item_categories [:food, :drink, :dessert]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "items" do
    field :category, Ecto.Enum, values: @item_categories
    field :description, :string
    field :price, :decimal
    field :photo, :string

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 6)
    |> validate_number(:price, greater_than: 0)
  end

  # |> validate_length(:password, min: 8)
  # |> validate_length(:cep, is: 8)
  # |> validate_length(:cpf, is: 11)
  # |> validate_number(:age, greater_than_or_equal_to: 18)
  # |> validate_format(:email, ~r/@/)
  # |> unique_constraint([:email])
  # |> unique_constraint([:cpf])
  # |> hash_password()
end
