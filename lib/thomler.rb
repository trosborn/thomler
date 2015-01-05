require "thomler/version"
require "thomler/array"
require "thomler/routing"

module Thomler
  class Application
    def call env
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'}, ["Hello from Ruby on Thomler!"]]
    end
  end

  class Controller
    def initialize env
      @env = env
    end

    def env
      @env
    end
  end
end
