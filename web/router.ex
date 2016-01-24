defmodule RelaxPhoenix.Router do
  use RelaxPhoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json-api"]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
    plug RelaxPhoenix.Plug.EnsureResource
  end

  scope "/v1", RelaxPhoenix.V1, as: :v1 do
    pipe_through :api # Use the API stack

    post "/token", TokenController, :create
    delete "/token", TokenController, :delete

    resources "/users", UserController
  end
end
