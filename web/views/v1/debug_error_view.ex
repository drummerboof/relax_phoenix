defmodule RelaxPhoenix.V1.DebugErrorView do
  use RelaxPhoenix.Web, :view

  def render(_, assigns) do
    render_api_error(%{
      status: "#{assigns.conn.status}",
      title: Map.get(assigns.reason, :message, "Unknown error occurred")
    })
  end

  defp render_api_error(error) do
    error
    |> JaSerializer.ErrorSerializer.format
    |> Poison.encode!
  end
end
