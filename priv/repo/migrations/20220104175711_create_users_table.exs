defmodule Rockelivery.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :address, :string
      add :age, :integer
      add :cep, :string
      add :cpf, :string, null: false
      add :email, :string
      add :password_hash, :string, null: false
      add :name, :string

      timestamps()
    end

    create unique_index(:users, [:cpf])
    create unique_index(:users, [:email])
  end
end
