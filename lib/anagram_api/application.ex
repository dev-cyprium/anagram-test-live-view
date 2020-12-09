defmodule AnagramApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      # AnagramApi.Repo, Not used...
      # Start the Telemetry supervisor
      AnagramApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AnagramApi.PubSub},
      # Start the Endpoint (http/https)
      AnagramApiWeb.Endpoint
      # Start a worker by calling: AnagramApi.Worker.start_link(arg)
      # {AnagramApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AnagramApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AnagramApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
