defmodule Rockelivery do
  alias Rockelivery.Items.Create, as: ItemCreate
  alias Rockelivery.Items.Delete, as: ItemDelete
  alias Rockelivery.Items.Get, as: ItemGet
  alias Rockelivery.Items.Update, as: ItemUpdate
  alias Rockelivery.Items.Index, as: ItemIndex

  alias Rockelivery.Users.Create, as: UserCreate
  alias Rockelivery.Users.Delete, as: UserDelete
  alias Rockelivery.Users.Get, as: UserGet
  alias Rockelivery.Users.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(params), to: UserDelete, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate update_user(params), to: UserUpdate, as: :call

  defdelegate create_item(params), to: ItemCreate, as: :call
  defdelegate delete_item(id), to: ItemDelete, as: :call
  defdelegate get_item_by_id(id), to: ItemGet, as: :by_id
  defdelegate update_item(params), to: ItemUpdate, as: :call
  defdelegate list_items, to: ItemIndex, as: :call
end
