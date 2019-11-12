defmodule TriangularStorage.MixProject do
  use Mix.Project

  def project do
    [
      app: :triangular_storage_exercise,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  defp escript do
    [main_module: TriangularStorage.CLI]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [{:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.19", only: :dev}]
  end
end
