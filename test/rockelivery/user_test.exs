defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        age: 18,
        address: "Karakura City",
        cep: "58073420",
        cpf: "72939281068",
        email: "orihimeinoue@gmail.com",
        password: "123456789",
        name: "Orihime Inoue"
      }

      response = User.changeset(params)

      assert %Changeset{changes: _params, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      original_params = %{
        age: 18,
        address: "Karakura City",
        cep: "58073420",
        cpf: "72939281068",
        email: "orihimeinoue@gmail.com",
        password: "123456789",
        name: "Orihime Inoue"
      }

      age = 19
      cpf = "82939281068"

      update_params = %{
        "age" => age,
        "cpf" => cpf
      }

      user = User.changeset(original_params)
      response = User.changeset(user, update_params)

      assert %Changeset{changes: %{age: ^age, cpf: ^cpf}, valid?: true} = response
    end

    test "when the user is a minor, returns an invalid changeset" do
      params = %{
        age: 17,
        address: "Karakura City",
        cep: "58073420",
        cpf: "72939281068",
        email: "orihimeinoue@gmail.com",
        password: "123456789",
        name: "Orihime Inoue"
      }

      response = User.changeset(params)

      assert %Changeset{valid?: false} = response
    end

    test "when the cpf doesn't have 11 digits, returns an invalid changeset" do
      params = %{
        age: 18,
        address: "Karakura City",
        cep: "58073420",
        cpf: "7293928106",
        email: "orihimeinoue@gmail.com",
        password: "123456789",
        name: "Orihime Inoue"
      }

      response = User.changeset(params)

      assert %Changeset{valid?: false} = response
    end

    test "when the cep doesn't have 8 digits, returns an invalid changeset" do
      params = %{
        age: 18,
        address: "Karakura City",
        cep: "5807342",
        cpf: "72939281068",
        email: "orihimeinoue@gmail.com",
        password: "123456789",
        name: "Orihime Inoue"
      }

      response = User.changeset(params)

      assert %Changeset{valid?: false} = response
    end

    test "when there is no password, returns an invalid changeset" do
      params = %{
        age: 18,
        address: "Karakura City",
        cep: "58073420",
        cpf: "7293928106",
        email: "orihimeinoue@gmail.com",
        password: "",
        name: "Orihime Inoue"
      }

      response = User.changeset(params)

      assert %Changeset{valid?: false} = response
    end
  end
end
