defmodule RockeliveryWeb.WelcomeController do
  use RockeliveryWeb, :controller

  def index(connection, _params) do
    connection
    |> put_status(:ok)
    |> json(%{Hello: "World"})
  end
end
