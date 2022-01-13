defmodule Rockelivery.Factory do
  use ExMachina

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
end
