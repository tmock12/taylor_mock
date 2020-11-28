defmodule TaylorMock.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TaylorMock.Repo,
      # Start the Telemetry supervisor
      TaylorMockWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TaylorMock.PubSub},
      # Start the Endpoint (http/https)
      TaylorMockWeb.Endpoint
      # Start a worker by calling: TaylorMock.Worker.start_link(arg)
      # {TaylorMock.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TaylorMock.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TaylorMockWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
