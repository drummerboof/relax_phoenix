ExUnit.start

Mix.Task.run "ecto.create", ~w(-r RelaxPhoenix.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r RelaxPhoenix.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(RelaxPhoenix.Repo)

