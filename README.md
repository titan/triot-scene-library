# scene-library

访问场景微服务的支持库

## Installation

  1. Add scenelib to your list of dependencies in `mix.exs`:

        def deps do
          [{:scene_library, git: "git@gitlab.ruicloud.cn:ruicloud-triot/scene-library.git", tag: "0.1.0" }]
        end

  2. Ensure scenelib is started before your application:

        def application do
          [applications: [:scene_library]]
        end
