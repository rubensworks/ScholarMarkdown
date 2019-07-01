require 'katex'
require 'sskatex'
require 'kramdown-math-sskatex'

# Make sure our KaTeX assets are available (this can be disabled if you are not using math-mode)
def preprocess_katex_assets
  # Copy stylesheet
  @items.create(File.open(File.join(Katex.gem_path, 'vendor', 'katex', 'stylesheets', 'katex.css'), 'r').read, {}, '/styles/katex.css')

  # Copy fonts
  fontPath = File.join(Katex.gem_path, 'vendor', 'katex', 'fonts')
  Dir.foreach(fontPath) do |item|
    next if item == '.' or item == '..'
    @items.create(File.open(File.join(fontPath, item), 'r').read, {}, '/styles/fonts/' + item)
  end
end