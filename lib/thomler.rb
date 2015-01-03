require "thomler/version"

module Thomler
  class Application
    def call env
      'echo debug > debug.txt';
      [200, {'Content-Type' => 'text/html'},
        ["Hello from Ruby on Thomler, version 0.0.4!"]]
    end
  end
end
