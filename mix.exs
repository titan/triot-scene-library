defmodule Scene.Mixfile do
  use Mix.Project

  def project do
    [app: :scene_library,
     version: "0.1.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:resource_discovery, git: "https://github.com/titan/resource_discovery.git", branch: "master"},
      {:domainlib, git: "git@gitlab.ruicloud.cn:titan/domainlib.git", tag: "0.1.0" },
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end
end