defmodule ExWoo.Response do
  @moduledoc """
  Represents an API response.
  """

  @type t :: %__MODULE__{
    body: any(),
    headers: [{binary(), binary()}] | nil,
    method: :get | :delete | :post | :put | :patch,
    opts: [any()] | nil,
    query: [{binary() | atom(), binary()}] | nil,
    status: integer() | nil,
    url: binary()
  }

  defstruct [
    :body,
    :headers,
    :method,
    :opts,
    :query,
    :status,
    :url
  ]
end
