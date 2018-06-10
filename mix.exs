defmodule Apus.MixProject do
  use Mix.Project

  def project do
    [
      app: :apus,
      version: "0.5.0",
      elixir: "~> 1.6",
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Apus.Application, []}
    ]
  end

  defp deps do
    [
      {:excoveralls, "~> 0.9.0", [only: :test]},
      {:exvcr, "~> 0.10.2", only: :test},
      {:ex_doc, "~> 0.18.3", only: :dev},
      {:hackney, "~> 1.12"},
      {:poison, "~> 3.1"},
      {:plug, "~> 1.5"}
    ]
  end

  defp description do
    "Apus is a testable and adapter based Elixir SMS library"
  end

  defp package do
    [
      name: :apus,
      maintainers: ["Stuart Welham", "John Griffin"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/SeatedInc/apus"}
    ]
  end
end
