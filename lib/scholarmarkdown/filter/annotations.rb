# Define a filter for adding annotation links
Nanoc::Filter.define(:scholar_annotations) do |content, params|
  content = content.dup
  
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
