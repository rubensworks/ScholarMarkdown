require 'erb'

# Proper escaping of IRIs
include ERB::Util

# Create a section block with the given file contents
def section id, classes = nil
  section_suffix=''
  if classes
    section_suffix=" class=\"" + classes + "\""
  end
  item = @items["/#{id.to_s}.*"]
  if not item
    raise "Could not find the file '" + id.to_s + "'"
  end
  <<-HTML
<section #{section_suffix}>
<div datatype="rdf:HTML" property="schema:description" markdown="block">
#{item.raw_content}
</div>
</section>
  HTML
end

# Create a person block
def person(name, website, profile, mainAuthor = true)
  if mainAuthor
    # Add person to global list of authors
    $authors ||= []
    $authors.push(name)
  end

  # Handle "Firstname, Lastname" format
  display_name =
    if name.include?(",")
      firstname, lastname = name.split(",", 2).map(&:strip)
      %{<span class="first-name">#{h firstname}</span> #{h lastname}}
    else
      h name
    end

  if not website
    %{<span id="author-name">#{display_name}</span>}
  elsif not profile
    %{<a id="author-name" href="#{h website}">#{display_name}</a>}
  else
    %{<a id="author-name" rev="lsc:participatesIn" property="foaf:maker schema:creator schema:author schema:publisher" href="#{h website}" typeof="foaf:Person schema:Person" resource="#{profile}">#{display_name}</a>}
  end
end
