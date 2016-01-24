defmodule RelaxPhoenix.Router do
  use RelaxPhoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json-api"]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/v1", RelaxPhoenix.V1, as: :v1 do
    pipe_through :api # Use the API stack
    resources "/users", UserController
  end
end
