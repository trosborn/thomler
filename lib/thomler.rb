require "thomler/version"

module Thomler
  class Application
    def call env
      [200, {'Content-Type' => 'text/html'}, ["Hello from Ruby on Thomler!"]]
    end
  end
end
