#\ -p 3000
require 'serve'
require 'serve/rack'
require 'rack-livereload'
use Rack::LiveReload, no_swf: true

root = File.dirname(__FILE__) + '/output'
run Rack::Cascade.new [
  Serve::RackAdapter.new(root),
  Rack::Directory.new(root),
]
