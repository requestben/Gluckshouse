defmodule Gluckshaus.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Gluckshaus.Repo,
      # Start the Telemetry supervisor
      GluckshausWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Gluckshaus.PubSub},
      # Start the Endpoint (http/https)
      GluckshausWeb.Endpoint
      # Start a worker by calling: Gluckshaus.Worker.start_link(arg)
      # {Gluckshaus.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gluckshaus.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GluckshausWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
