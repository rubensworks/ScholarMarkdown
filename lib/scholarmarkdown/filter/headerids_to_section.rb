# Moves IDs on headings to their parent section
Nanoc::Filter.define(:scholar_headerids_to_section) do |content|
  content = content.dup
  content.gsub! /<section>(\s*)(<h\d[^>]*)(\sid=[^\s>]+)/,
                '<section\3>\1\2'
  content
end
