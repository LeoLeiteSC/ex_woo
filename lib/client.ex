defmodule ExWoo.Client do
  @moduledoc """
  Module with client configuration
  """

  @type t :: any()
  @type opts :: Keyword.t()

  @callback build_client(opts) :: t()
  @callback request(t(), Request.t()) :: {:ok, Response.t()} | {:error, any()}

  alias ExWoo.Client.Tesla

  defp adapter, do: Application.get_env(:ex_woo, :client) || Tesla

  def build_client(opts \\ []) do
    base_opts = [consumer_key: ExWoo.config(:key), consumer_secret: ExWoo.config(:secret)]

    base_opts
    |> Keyword.merge(opts)
    |> adapter().build_client()
  end

  @doc """
  Sends a request to WooCommerceAPI
  """
  def request(client, request), do: adapter().request(client, request)
end
