# Moves IDs on headings to their parent section
Nanoc::Filter.define(:scholar_headerids_to_section) do |content|
  content = content.dup
  content.gsub! /<section>(\s*)(<div[^>]*>)(\s*)(<h\d[^>]*)\sid="([^\s>]+)"([^>]*)>/ do |_|
    match = Regexp.last_match
    "<section id=\"#{match[5]}\" inlist=\"\" rel=\"schema:hasPart\" resource=\"##{match[5]}\">#{match[1]}#{match[2]}#{match[3]}#{match[4]} property=\"schema:name\"#{match[6]}>"
  end
  content
end
