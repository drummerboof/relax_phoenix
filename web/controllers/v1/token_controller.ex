defmodule RelaxPhoenix.V1.TokenController do
  use RelaxPhoenix.Web, :controller
  alias RelaxPhoenix.Exceptions
  alias RelaxPhoenix.Authentication

  plug :require_params, ["email", "password"] when action in [:create]

  def unauthenticated(_, _params) do
    raise Exceptions.NotAuthenticatedException
  end

  def create(conn, params = %{}) do
    case Authentication.authenticate(params) do
      {:ok, user} ->
        jwt = conn
        |> Guardian.Plug.api_sign_in(user)
        |> Guardian.Plug.current_token
        render conn, "show.json", data: %{jwt: jwt, user: user}
      :error ->
        raise Exceptions.InvalidCredentialsException
    end
  end

  def delete(conn, _params) do
    case Guardian.Plug.claims(conn) do
      {:ok, claims} ->
        conn
        |> Guardian.Plug.current_token
        |> Guardian.revoke!(claims)
        conn
        |> put_status(:no_content)
        |> text("")
      {:error, _} ->
        raise Exceptions.NotAuthenticatedException
    end
  end
end
