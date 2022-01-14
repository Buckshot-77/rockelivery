defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 18,
      address: "Karakura City",
      cep: "58073420",
      cpf: "72939281068",
      email: "orihimeinoue@gmail.com",
      password: "123456789",
      name: "Orihime Inoue"
    }
  end

  def user_factory do
    %{password_hash: password_hash} = Pbkdf2.add_hash("123456789")

    %User{
      age: 18,
      address: "Karakura City",
      cep: "58073420",
      cpf: "72939281068",
      email: "orihimeinoue@gmail.com",
      password: "123456789",
      name: "Orihime Inoue",
      id: "79ad3f04-af97-48e9-b53a-6d2c8d871a7c",
      password_hash: password_hash
    }
  end
end
