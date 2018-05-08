# Define a filter for adding Dokieli annotations
Nanoc::Filter.define(:scholar_dokieli) do |content, params|
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
  
  # Add Dokieli actions at the end of the <header>
  content.gsub! %r{\<\/header\>} do |match|
    <<-HTML
  <section class="actions">
    <h2 id="notifications-and-annotations">Notifications and annotations</h2>
    <ul>
      <li><a href="#{params[:notifications]}" rel="ldp:inbox">notification inbox</a></li>
      <li><a href="#{params[:annotations]}" rel="oa:annotationService">annotation service</a></li>
    </ul>
  </section>
</header>
    HTML
  end
  
  content
end
