defmodule EChronicler.Repo do
  use Ecto.Repo,
    otp_app: :eChronicler,
    adapter: Ecto.Adapters.Postgres
end
