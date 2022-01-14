defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %Rockelivery.User{
               address: "Karakura City",
               age: 18,
               cep: "58073420",
               cpf: "72939281068",
               email: "orihimeinoue@gmail.com",
               id: "79ad3f04-af97-48e9-b53a-6d2c8d871a7c",
               inserted_at: nil,
               name: "Orihime Inoue",
               password: "123456789",
               password_hash: _,
               updated_at: nil
             }
           } = response
  end
end
