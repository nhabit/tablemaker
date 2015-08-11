defmodule Tablemaker.Mixfile do
  use Mix.Project

  def project do
    [ app: :tablemaker,
      version: "0.0.1",
      elixir: "~> 1.0",
      elixir_paths:  ["lib"],
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      escript: [ main_module: Tablemaker ]]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [ {:ex_spec, "~> 0.3.0", only: :test}, {:white_bread, git: "https://github.com/meadsteve/white-bread.git"} ]
  end
end
