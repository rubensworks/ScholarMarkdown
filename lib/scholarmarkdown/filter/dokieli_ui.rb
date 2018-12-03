# Define a filter for adding the Dokieli UI
Nanoc::Filter.define(:scholar_dokieli_ui) do |content|
  content = content.dup

  # Add Dokieli scripts at the end of the <head>
  content.gsub! %r{\<\/head\>} do |match|
    <<-HTML
  <link href="https://fonts.googleapis.com/css?family=Ubuntu+Mono" rel="stylesheet" />
  <link href="https://dokie.li/media/css/dokieli.css" media="all" rel="stylesheet" />
  <script src="https://dokie.li/scripts/dokieli.js"></script>
</head>
    HTML
  end
  
  content
end
