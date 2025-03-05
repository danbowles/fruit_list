# FruitList

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Main Application Logic
### Filtering: [`data.ex`](lib/fruit_list/data.ex).
### Controller: [`fruit_controller`](lib/fruit_list_web/controllers/fruit_controller.ex)

## Query Parameters

| Parameter   | Type    | Description                          |
|------------|---------|--------------------------------------|
| `in_season` | boolean | Filter fruits that are currently in season (`true` or `false`). |
| `name`      | string  | Filter by the name of the fruit.    |
| `color`     | string  | Filter by the color of the fruit.   |

## Example Requests

**Get all fruits:**

`GET /fruits`

**Get fruits that are in season:**

`GET /fruits?in_season=true`

**Get red apples that are in season:**

`GET /fruits?name=apple&color=red&in_season=true`
