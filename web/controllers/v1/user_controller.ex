defmodule RelaxPhoenix.V1.UserController do
  use RelaxPhoenix.Web, :controller
  plug Guardian.Plug.EnsureAuthenticated, handler: RelaxPhoenix.V1.TokenController

  def index(conn, params) do
    users = RelaxPhoenix.User
      |> RelaxPhoenix.Repo.paginate(params)
    render conn, model: users
  end

  def show(conn, params) do
    render conn, model: RelaxPhoenix.Repo.get!(RelaxPhoenix.User, params["id"])
  end
end
