defmodule RelaxPhoenix.GuardianSerialiser do
  @behaviour Guardian.Serializer

  alias RelaxPhoenix.Repo
  alias RelaxPhoenix.User
  alias RelaxPhoenix.Exceptions

  def for_token(user = %User{}), do: { :ok, "User:#{user.id}" }
  def for_token(_), do: { :error, "Unknown resource type" }

  def from_token("User:" <> id) do
    case Repo.get(User, id) do
     user -> { :ok, user }
     nil -> { :error, "User not found" }
    end
  end
  def from_token(_), do: { :error, "Unknown resource type" }
end