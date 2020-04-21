require 'rack'
require 'rack-livereload'

class IndexRewriter
  def initialize app
    @app = app
  end

  def call env
    env["PATH_INFO"].gsub! /\/$/, '/index.html'
    @app.call env
  end
end

use IndexRewriter
use Rack::LiveReload
run Rack::File.new 'output'
