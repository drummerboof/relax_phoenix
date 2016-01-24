defmodule RelaxPhoenix.V1.TokenController do
  use RelaxPhoenix.Web, :controller
  alias RelaxPhoenix.Exceptions
  alias RelaxPhoenix.Authentication

  def unauthenticated(conn, _params) do
    raise Exceptions.NotAuthenticatedException
  end

  def create(conn, params = %{}) do
    case Authentication.authenticate(params) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = user |> Guardian.encode_and_sign(:token)
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
