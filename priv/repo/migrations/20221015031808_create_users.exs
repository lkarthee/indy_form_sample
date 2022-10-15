defmodule IndyFormSample.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :contact_me, :string
      add :phone, :string
      add :email, :string

      timestamps()
    end
  end
end
