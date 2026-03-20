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
