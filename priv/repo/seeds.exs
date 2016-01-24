# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RelaxPhoenix.Repo.insert!(%RelaxPhoenix.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias RelaxPhoenix.{Repo, User}

[
  %{
    first_name: "Chris",
    last_name: "James",
    email: "drummerboof@gmail.com",
    password: "password"
  },
  %{
    first_name: "Kelly",
    last_name: "Gamble",
    email: "kellygamble8@gmail.com",
    password: "password"
  }
]
|> Enum.map(&User.changeset(%User{}, &1))
|> Enum.each(&Repo.insert!(&1))
