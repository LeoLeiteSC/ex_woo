# ExWoo

This is a library that makes simple requests to the WooCommerce API.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_woo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_woo, "~> 0.1.0"}
  ]
end
```

Add this configurations to your `config.exs` file:

```elixir
config :ex_woo,
  base_url: "Your site URL",
  key: "Your Customer Key",
  secret: "Your Customer Secret"
```

## Example

`config.exs`:
```elixir
config :ex_woo,
  base_url: "https://mysite.com/wp-json/wc/v3",
  key: "my_key",
  secret: "my_secret"
```

In your program:
```elixir
# To list all customers
ExWoo.get("/customers")
```
