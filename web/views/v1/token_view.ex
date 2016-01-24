defmodule RelaxPhoenix.V1.TokenView do
  use RelaxPhoenix.Web, :view

  location "/v1/token"

  attributes [:jwt]

  def id(model, _conn), do: model.user.id

  def render("delete.json-api", _assigns) do
    nil
  end

end
