require "thomler/file_model"
require "rack/request"

module Thomler
  class Controller
    include Thomler::Model
    def request
      @request ||= Rack::Request.new(@env)
    end

    def params
      request.params
    end

    def initialize env
      @env = env
    end

    def env
      @env
    end

    def render view_name, locals = {}
      filename = File.join "app", "views", controller_name, "#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(:env => env)
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub /Controller$/, ""
      Thomler.to_underscore klass
    end

    def response text, status = 200, headers = {}
      raise "Already responded!" if @response
      a = [text].flatten
      @response = Rack::Response.new(a, status, headers)
    end

    def get_response
      @response
    end

    def render_response *args
      response(render(*args))
    end
  end
end
