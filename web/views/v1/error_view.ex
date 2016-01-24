defmodule RelaxPhoenix.V1.ErrorView do
  use RelaxPhoenix.Web, :view

  def render("500.json-api", _assigns) do
    render_api_error(%{
      status: "500",
      title: "An internal server error has occurred."
    })
  end

  def render("404.json-api", assigns) do
    render_api_error(%{
      status: "404",
      title: "Unknown URI: #{assigns.conn.request_path}"
    })
  end

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
