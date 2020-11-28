defmodule TaylorMock.Repo do
  use Ecto.Repo,
    otp_app: :taylor_mock,
    adapter: Ecto.Adapters.Postgres
end
