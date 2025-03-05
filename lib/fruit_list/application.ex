defmodule FruitList.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FruitListWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:fruit_list, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FruitList.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FruitList.Finch},
      # Start a worker by calling: FruitList.Worker.start_link(arg)
      # {FruitList.Worker, arg},
      # Start to serve requests, typically the last entry
      FruitListWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FruitList.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FruitListWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
