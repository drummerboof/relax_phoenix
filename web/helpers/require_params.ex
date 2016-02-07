defmodule RelaxPhoenix.RequireParams do
  @moduledoc """
  Checks the conn.params for the given required params and throws if they are not present
  """

  alias RelaxPhoenix.Exceptions

  def require_params(conn, required_key) when is_binary(required_key) do
    param = Map.get(conn.params, required_key)
    unless param do
      raise Exceptions.MissingParamException, key: required_key
    end
    conn
  end

  def require_params(conn, required_keys) when is_list(required_keys) do
    Enum.map(required_keys, fn(key) -> require_params(conn, key) end)
    conn
  end
end