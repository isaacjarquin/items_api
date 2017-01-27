ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ItemsApi.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ItemsApi.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ItemsApi.Repo)

