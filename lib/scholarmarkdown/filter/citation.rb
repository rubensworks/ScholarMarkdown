require 'bibmarkdown'
require 'bibtex'
require 'csl/styles'

# Sets the default directory of citation styles.
CSL::Style.root = File.dirname(__FILE__) + '/../citationstyles'

# Define a citation filter using bibmarkdown
Nanoc::Filter.define(:scholar_citation) do |content, params|
  bib = params[:bibfile]
  if not bib
    raise "Could not find bibliography file"
  end
  entries = BibTeX.parse(bib.raw_content).entries
  entries.each_value { |e| e.convert!(:latex) { |key| key != :url } }
  params = params.merge(entries: entries)
  BibMarkdown::Document.new(content, params).to_markdown
end
