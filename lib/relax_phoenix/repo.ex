defmodule RelaxPhoenix.Repo do
  use Ecto.Repo, otp_app: :relax_phoenix
  use Scrivener, page_size: 10
end
