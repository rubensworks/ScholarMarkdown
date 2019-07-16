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
<section markdown="block"#{section_suffix}>
#{item.raw_content}
</section>
  HTML
end

# Create a person block
def person name, website, profile
  # Add person to global list of authors
  unless $authors
    $authors = []
  end
  $authors.push(name)

  if not website
    h name
  elsif not profile
    %{<a href="#{h website}">#{h name}</a>}
  else
    %{<a href="#{h website}" typeof="http://xmlns.com/foaf/0.1/Person" resource="#{profile}">#{h name}</a>}
  end
end
