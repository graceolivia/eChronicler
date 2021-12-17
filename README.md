# E-Chronicler

## About E-Chronicler

To start E-Chronicler, clone the repo to your local machine.

E-Chronicler required Postgres in order to function properly. 

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Using E-Chronicler

So far, the main page displays journal entries. In order to put seed data in the database to see the journal entries:

`mix ecto.gen.migration add_journal_table`
`mix ecto.migrate`
`run priv/repo/seeds.exs`

Future features will include:
- adding new journal entries 
- updating journal entries
- Displaying individual journal entries

## Learn more about Phoenix

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
