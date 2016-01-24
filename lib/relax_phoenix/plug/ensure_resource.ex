defmodule RelaxPhoenix.Plug.EnsureResource do
  @moduledoc """
  Checks the current_resource and throws if it is nil
  """

  alias RelaxPhoenix.Exceptions

  def init(opts \\ %{}), do: Enum.into(opts, %{})

  def call(conn, opts) do
    key = Map.get(opts, :key, :default)

    case Guardian.Plug.current_resource(conn, key) do
      nil -> raise Exceptions.NotAuthenticatedException
      _ -> conn
    end
  end
end