defmodule ExWoo do
  @moduledoc """
  Module to make requests to WooCommerce API
  """

  alias ExWoo.{
    Client,
    Request,
    Response,
  }

  def create(url, params, client \\ Client.build_client()), do: request(:post, url, params, client)

  def get(url, params, client \\ Client.build_client()), do: request(:get, url, params, client)

  defp request(method, url, params, client) do
    client
    |> Client.request(%Request{method: method, url: url, body: params})
    |> handle_response()
  end

  defp handle_response({:ok, %Response{status: 200, body: body}}), do: {:ok, body}
  defp handle_response({:ok, %Response{status: 201, body: body}}), do: {:ok, body}
  defp handle_response({:ok, %Response{status: status, body: body}}), do: {:error, %{status: status, message: body}}
  defp handle_response({:error, _} = error), do: error

  def config(key), do: Application.get_env(:ex_woo, key)
end
