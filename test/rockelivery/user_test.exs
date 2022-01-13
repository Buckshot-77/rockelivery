defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: _params, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      original_params = build(:user_params)

      age = 19
      cpf = "82939281068"

      update_params = %{
        age: age,
        cpf: cpf
      }

      user = User.changeset(original_params)
      response = User.changeset(user, update_params)

      assert %Changeset{changes: %{age: ^age, cpf: ^cpf}, valid?: true} = response
    end

    test "when the user is a minor, returns an invalid changeset" do
      params = build(:user_params, %{age: 17})

      response = User.changeset(params)
      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert errors_on(response) == expected_response
    end

    test "when the cpf doesn't have 11 digits, returns an invalid changeset" do
      params = build(:user_params, %{cpf: "7293928106"})

      response = User.changeset(params)
      expected_response = %{cpf: ["should be 11 character(s)"]}

      assert errors_on(response) == expected_response
    end

    test "when the cep doesn't have 8 digits, returns an invalid changeset" do
      params = build(:user_params, %{cep: "5807342"})

      response = User.changeset(params)
      expected_response = %{cep: ["should be 8 character(s)"]}

      assert errors_on(response) == expected_response
    end

    test "when there is no password, returns an invalid changeset" do
      params = build(:user_params, %{password: ""})

      response = User.changeset(params)
      expected_response = %{password: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
