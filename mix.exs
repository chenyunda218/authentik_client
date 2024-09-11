defmodule AuthentikClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :authentik_client,
      version: "0.1.2",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "authentik_client",
      source_url: "https://github.com/chenyunda218/authentik_client",
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.5.0"}
    ]
  end

  defp description() do
    "AuthentikClient is a client for the Authentik API."
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "authentik_client",
      # These are the default files included in the package
      # files: ~w(lib priv .formatter.exs mix.exs README* readme* LICENSE*
      #           license* CHANGELOG* changelog* src),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/chenyunda218/authentik_client"}
    ]
  end
end
