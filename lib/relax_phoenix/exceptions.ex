defmodule RelaxPhoenix.Exceptions do
  defmodule NotAuthenticatedException do
    @moduledoc """
    Exception raised when user is not authenticated
    """
    defexception plug_status: 403, message: "Not authenticated"
  end

  defmodule InvalidCredentialsException do
    @moduledoc """
    Exception raised when user is not authenticated
    """
    defexception plug_status: 403, message: "Invalid authentication credentials"
  end
end
