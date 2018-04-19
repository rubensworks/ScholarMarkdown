# Moves the references section into <footer>
Nanoc::Filter.define(:scholar_references_to_footer) do |content|
  content = content.dup
  references = content[%r{<h2 id="references">.*?</dl>}m]
  if references
    content[references] = ''
    content['</footer>'] = "<section>\n" + references + "\n</section>\n</footer>"
  end
  content
end
