require "thomler/version"
require "thomler/array"
require "thomler/routing"

module Thomler
  class Application
    def call env
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, ["404", "File not found"]]
      end
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
      rescue Exception
        return [500, {'Content-Type' => 'text/html'}, ["text"]]
      end
      [200, {'Content-Type' => 'text/html'}, ["text"]]
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
