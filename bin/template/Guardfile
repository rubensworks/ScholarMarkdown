# guard-nanoc 2.1.x passes `reps: []` to FileActionPrinter.new, but
# nanoc-cli >= 4.14.7 removed that parameter. Absorb the stale kwarg.
require 'nanoc/cli'
::Nanoc::CLI::CompileListeners::FileActionPrinter.prepend(Module.new do
  def initialize(**); super(); end
end)

guard 'rack', :port => 3000 do
  watch 'Gemfile.lock'
end

guard :nanoc do
  watch 'nanoc.yaml'
  watch 'Rules'
  watch %r{^(content|layouts|lib)/}
end

guard :livereload do
  watch(%r{^output/}) { |m| m[0].sub(%r{^output/}, '') }
end

notification :notifu, :nosound => true
