defmodule FruitListWeb.FruitController do
  use FruitListWeb, :controller
  @boolean_params ~w(in_season)

  def index(conn, params) do
    params = parse_params(params)
    {:ok, fruits} = FruitList.Data.get_data()

    json(
      conn,
      params
      |> Enum.reduce(fruits, fn {k, v}, acc ->
        FruitList.Data.filter_by(k, acc, v)
      end)
    )
  end

  defp parse_params(params) do
    params
    |> Enum.into(%{}, fn {k, v} ->
      case k in @boolean_params do
        true -> {k |> String.to_atom(), v == "true"}
        false -> {k |> String.to_atom(), v}
      end
    end)
  end
end
