defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 18,
        "address" => "Karakura City",
        "cep" => "58073420",
        "cpf" => "72939281068",
        "email" => "orihimeinoue@gmail.com",
        "password" => "123456789",
        "name" => "Orihime Inoue"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Karakura City",
                 "age" => 18,
                 "cep" => "58073420",
                 "cpf" => "72939281068",
                 "email" => "orihimeinoue@gmail.com",
                 "id" => _id,
                 "name" => "Orihime Inoue"
               }
             } = response
    end

    test "when there is an error, returns the error", %{conn: conn} do
      params = %{"password" => "123456789", "name" => "Orihime Inoue"}

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "79ad3f04-af97-48e9-b53a-6d2c8d871a7c"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
