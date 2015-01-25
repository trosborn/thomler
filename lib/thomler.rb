require "thomler/version"
require "thomler/array"
require "thomler/routing"
require "thomler/utils"
require "thomler/dependencies"
require "thomler/controller"

module Thomler
  class Application
    def call env
      if env['PATH_INFO'] == '/favicon.ico'
        [404, {'Content-Type' => 'text/html'}, []]
      end
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

end
