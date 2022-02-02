defmodule RockeliveryWeb.ItemsController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Item
  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(connection, params) do
    with {:ok, %Item{} = item} <- Rockelivery.create_item(params) do
      connection
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end

  def delete(connection, %{"id" => id}) do
    with {:ok, %Item{}} <- Rockelivery.delete_item(id) do
      connection
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(connection, %{"id" => id}) do
    with {:ok, %Item{} = item} <- Rockelivery.get_item_by_id(id) do
      connection
      |> put_status(:ok)
      |> render("item.json", item: item)
    end
  end

  def update(connection, params) do
    with {:ok, %Item{} = item} <- Rockelivery.update_item(params) do
      connection
      |> put_status(:ok)
      |> render("item.json", item: item)
    end
  end

  def index(connection, _params) do
    with {:ok, %Item{} = item} <- Rockelivery.list_items() do
      connection
      |> put_status(:ok)
      |> render("item.json", item: item)
    end
  end
end
