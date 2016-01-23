defmodule RelaxPhoenix.PageController do
  use RelaxPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
