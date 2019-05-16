# Define a filter for adding citation metadata
Nanoc::Filter.define(:scholar_citation_metadata) do |content, params|
  content = content.dup

  # Create author tags
  authors = ""
  if $authors
    authors = $authors.map { |author| '<meta name="citation_author" content="' + author + '" />' }.join("\n  ")
    $authors = []
  end

  # Create optional tags
  additionalTags = params.map { |key, value| '<meta name="citation_' + key.to_s + '" content="' + value + '" />' }.join("\n  ")
  if not params[:publication_date]
    additionalTags += "\n  "
    additionalTags += '<meta name="citation_publication_date" content="' + Time.now.strftime("%Y/%m/%d") + '" />'
  end
  #params_publication_date = params[:publication_date] || Time.now.strftime("%Y/%m/%d")
  
  # Add citation meta tags at the end of the <head>
  content.gsub! %r{\<\/head\>} do |match|
    <<-HTML
  <meta name="citation_title" content="#{item[:title]}">
  #{authors}
  #{additionalTags}
</head>
    HTML
  end
  
  content
end
