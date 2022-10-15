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

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age, :contact_me, :phone, :email])
    |> validate_required([:name, :age, :contact_me])
  end
end
