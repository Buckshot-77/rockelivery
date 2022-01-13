defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Create, as: UserCreate

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = UserCreate.call(params)

      assert {:ok, %User{id: _id, age: 18, email: "orihimeinoue@gmail.com"}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, %{password: "1234", age: 17})

      response = UserCreate.call(params)
      {:error, %Error{result: changeset}} = response

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 8 character(s)"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
