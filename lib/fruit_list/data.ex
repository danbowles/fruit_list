defmodule FruitList.Data do
  @data File.read!("priv/static/fruit_list.json") |> Jason.decode()

  def get_data, do: @data

  def filter_by(:name, fruits, name) do
    Enum.filter(fruits, fn fruit ->
      fruit["name"] |> String.downcase() |> String.contains?(name)
    end)
  end

  def filter_by(:in_season, fruits, in_season) do
    Enum.filter(fruits, fn fruit ->
      fruit["in_season"] == in_season
    end)
  end

  def filter_by(:color, fruits, color) do
    Enum.filter(fruits, fn fruit ->
      fruit["colors"]
      |> Enum.any?(fn c ->
        c |> String.downcase() == color |> String.downcase()
      end)
    end)
  end

  def filter_by(_, fruits, _), do: fruits
end
