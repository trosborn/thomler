require "thomler/version"
require "thomler/array"
require "thomler/routing"
require "thomler/utils"
require "thomler/dependencies"
require "thomler/controller"
require "thomler/file_model"

module Thomler
  class Application
    def call env
      if env['PATH_INFO'] == '/favicon.ico'
        [404, {'Content-Type' => 'text/html'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      if controller.get_response
        st, hd, rs = controller.get_response.to_a
        [st, hd, [rs.body].flatten]
      else
        [200, {'Content-Type' => 'text/html'}, [text]]
      end
    end

  end
end
