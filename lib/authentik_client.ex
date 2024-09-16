defmodule AuthentikClient do
  @client_id Application.get_env(:authentik, :client_id, "")
  @client_secret Application.get_env(:authentik, :client_secret, "")
  @base_url Application.get_env(:authentik, :base_url, "")

  @spec new_client(Keyword.t()) :: map()
  def new_client() do
    new_client([])
  end

  @spec new_client(Keyword.t()) :: map()
  def new_client(configs) do
    %{
      client_id: Application.get_env(Authentik, :client_id, Keyword.get(configs, :client_id, "")),
      client_secret:
        Application.get_env(Authentik, :client_secret, Keyword.get(configs, :client_secret, "")),
      base_url: Application.get_env(Authentik, :base_url, Keyword.get(configs, :base_url, ""))
    }
  end

  def get_user_info(%{base_url: base_url}, access_token) do
    Req.get("#{base_url}/application/o/userinfo/",
      headers: %{authorization: "Bearer #{access_token}"}
    )
  end

  def retrive_token(
        %{client_id: client_id, client_secret: client_secret, base_url: base_url},
        code,
        redirect_uri
      ) do
    Req.post!(base_url,
      form: [
        client_id: client_id,
        client_secret: client_secret,
        code: code,
        redirect_uri: redirect_uri,
        grant_type: "authorization_code"
      ]
    )
  end

  def oauth2_authorize_url(
        %{client_id: client_id, base_url: base_url},
        scope,
        redirect_uri
      )
      when is_bitstring(scope) do
    "#{base_url}/application/o/authorize/?client_id=#{client_id}&scope=#{scope}&redirect_uri=#{redirect_uri}&response_type=code"
  end

  def oauth2_authorize_url(
        client,
        scope,
        redirect_uri
      )
      when is_list(scope),
      do:
        oauth2_authorize_url(
          client,
          Enum.join(scope, " "),
          redirect_uri
        )
end
