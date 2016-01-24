defmodule RelaxPhoenix.V1.UserView do
  use RelaxPhoenix.Web, :view

  location "/v1/users/:id"

  attributes [:id, :email, :first_name, :last_name, :inserted_at, :updated_at]
end
