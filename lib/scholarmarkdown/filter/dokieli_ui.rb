# Define a filter for adding the Dokieli UI
Nanoc::Filter.define(:scholar_dokieli_ui) do |content|
  content = content.dup

  # Add Dokieli scripts at the end of the <head>
  content.gsub! %r{\<\/head\>} do |match|
    <<-HTML
  <link href="https://fonts.googleapis.com/css?family=Ubuntu+Mono" rel="stylesheet" />
  <link href="https://dokie.li/media/css/do.css" media="all" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" media="all" rel="stylesheet" />
  <script src="https://dokie.li/scripts/simplerdf.js"></script>
  <script src="https://dokie.li/scripts/medium-editor.min.js"></script>
  <script src="https://dokie.li/scripts/medium-editor-tables.min.js"></script>
  <script src="https://dokie.li/scripts/do.js"></script>
</head>
    HTML
  end
  
  content
end
