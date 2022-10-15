defmodule IndyFormSample.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :age, :integer
    field :contact_me, Ecto.Enum, values: [:none, :phone, :email, :phone_email]
    field :email, :string
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @fields [:name, :age, :contact_me, :phone, :email]
  @required_fields [:name, :age, :contact_me]

  @doc false
  def cast_row(user, attrs, opts), do: cast(user, attrs, @fields, opts)

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
  end
end
