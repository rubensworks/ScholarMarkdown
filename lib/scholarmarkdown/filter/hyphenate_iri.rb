# Define a filter for hyphenating long IRIs
Nanoc::Filter.define(:scholar_hyphenate_iri) do |content|
  content = content.dup
  # Replace in-text URLs
  content.gsub! %r{>https?://[^>]+?} do |match|
    hyphenate(match)
  end
  # Replace mandatory links
  content.gsub! %r{<a href="([^"]+)"[^>]*\s+class="mandatory"} do |match|
    %{#{match} data-link-text="#{hyphenate $1}"}
  end
  content
end

# Add zero-width space after slashes and hyphens to allow hyphenation
def hyphenate text
  text.gsub %r{(?<=/|-)}, "\u200B"
end
