defmodule RelaxPhoenix.Exceptions do
  defmodule NotAuthenticatedException do
    @moduledoc """
    Exception raised when user is not authenticated
    """
    defexception plug_status: 403, message: "Not authenticated"
  end

  defmodule InvalidCredentialsException do
    @moduledoc """
    Exception raised when user posts incorrect login crendentials
    """
    defexception plug_status: 403, message: "Invalid authentication credentials"
  end

  defmodule MissingParamException do
    @moduledoc """
    Raised when a key is expected to be present in the request parameters,
    but is not.
    This exception is raised by `RelaxPhoenix.RequireParams.require_params/2`
    """

    defexception [:message, plug_status: 400]

    def exception([key: value]) do
      msg = "Missing requied parameter. Expected key #{inspect value} to be present in params"
      %RelaxPhoenix.Exceptions.MissingParamException{message: msg}
    end
  end
end
