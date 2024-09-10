defmodule AuthentikClient do
  @moduledoc """
  Documentation for `AuthentikClient`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AuthentikClient.hello()
      :world

  """
  @spec new(Keyword.t()) :: map()
  def new(configs) do
    %{
      client_id: Application.get_env(Authentik, :client_id, Keyword.get(configs, :client_id, "")),
      client_secret:
        Application.get_env(Authentik, :client_secret, Keyword.get(configs, :client_secret, "")),
      base_url: Application.get_env(Authentik, :base_url, Keyword.get(configs, :base_url, ""))
    }
  end
end
