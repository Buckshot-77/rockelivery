defmodule Rockelivery.Items.Index do
  alias Rockelivery.{Error, Item, Repo}

  def call do
    case Repo.all(Item) do
      nil -> {:error, Error.build_item_not_found_error()}
      items -> {:ok, items}
    end
  end
end
