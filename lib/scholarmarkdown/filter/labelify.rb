# Add labels to elements such as figures and sections, and make them referencable.

DOCUMENT_SECTIONS = [
  'Chapter',
  'Section',
  'Subsection',
  'Subsubsection'
]

Nanoc::Filter.define(:scholar_labelify) do |content, params|
  if params[:chapters]
    document_sections = DOCUMENT_SECTIONS
  else
    document_sections = DOCUMENT_SECTIONS[1, DOCUMENT_SECTIONS.length]
  end

  content = content.dup
  sections_index = []

  labels = create_labels document_sections, sections_index, content
  add_labels_to_figures content, labels
  set_reference_labels content, labels
  
  serialize_sections_index sections_index, params[:sections_index_depth] || 3, content

  content
end

# Creates labels for referenceable elements
def create_labels document_sections, sections_index, content
  @reference_counts = {}
  main = content[%r{<main>.*</main>}m]
  appendix = content[%r{<div id="appendix"[^>]*>.*</div>}m] || ""
  labels = (main + appendix).scan(/<(\w+)([^>]*\s+id="([^"]+)"[^>]*)>([^<]*)</)
               .map do |tag, attribute_list, id, name|
    attributes = parse_attributes(attribute_list)
    type = label_type_for document_sections, tag.downcase.to_sym, attributes
    number = 0
    if attributes[:class].nil? or !attributes[:class].include? 'no-label-increment'
      number = number_for document_sections, type, name, id, sections_index
    end
    [id, "#{type} #{number}"]
  end
  labels.to_h
end

# Determines the label type of a given element
def label_type_for document_sections, tag, attributes
  case tag
  when :h2
    document_sections[0]
  when :h3
    document_sections[1]
  when :h4
    document_sections[2]
  when :figure
    unless attributes[:class].nil?
      for clazz in attributes[:class].split(' ') do
        case clazz
        when 'algorithm'
          return 'Algorithm'
        when 'listing'
          return 'Listing'
        when 'table'
          return 'Table'
        when 'equation'
          return 'Equation'
        when 'subfigure'
          return 'Subfig.'
        end
      end
    end
    'Fig.'
  else
    'Unknown'
  end
end

def number_for document_sections, type, name, id, sections_index
  # Determine number of elements
  @reference_counts[type] ||= 0
  number = @reference_counts[type] += 1

  # Perform hierarchical numbering when needed
  case type
  when document_sections[0]
    @reference_counts[document_sections[1]] = 0
    @reference_counts[document_sections[2]] = 0
    sections_index[@reference_counts[document_sections[0]] - 1] = { :name => name, :id => id, :children => [] }
  when document_sections[1]
    @reference_counts[document_sections[2]] = 0
    number = "#{reference_counts[document_sections[0]]}.#{number}"
    sections_index[@reference_counts[document_sections[0]] - 1][:children][@reference_counts[document_sections[1]] - 1] = { :name => name, :id => id, :children => [] }
  when document_sections[2]
    number = "#{reference_counts[document_sections[0]]}.#{reference_counts[document_sections[1]]}.#{number}"
    sections_index[@reference_counts[document_sections[0]] - 1][:children][@reference_counts[document_sections[1]] - 1][:children][@reference_counts[document_sections[2]] - 1] = { :name => name, :id => id, :children => [] }
  when 'Fig.'
    @reference_counts['Subfig.'] = 0
  when 'Subfig.'
    number = "#{reference_counts['Fig.']}.#{number}"
  end
  number
end

# Adds labels to referenceable figures
def add_labels_to_figures content, labels
  # Subfigures
  content.gsub! %r{<figure[^>]*\s+id="([^"]+)"\s+class="[^"]*subfigure[^"]*".*?<figcaption>(?:\s*<p>)?}m do |match|
    id=$1
    match = match.sub! '<figcaption>', '<figcaption class="for-subfigure">'
    if labels.key? id
      %{#{match}<span class="label">#{h labels[id]}:</span> }
    else
      match
    end
  end

  # Main figures
  content.gsub! %r{<figure[^>]*\s+id="([^"]+)".*?<figcaption>(?:\s*<p>)?}m do |match|
    if labels.key? $1
      %{#{match}<span class="label">#{h labels[$1]}:</span> }
    else
      match
    end
  end
end

# Sets the labels of unlabeled references in the text
def set_reference_labels content, labels
  content.gsub! %r{(<a href="#([^"]+)">)(</a>)} do |match|
    if labels.key? $2
      "#{$1}#{h labels[$2]}#{$3}"
    else
      match
    end
  end
end

# Parses a string of HTML attributes
def parse_attributes attribute_list
  attribute_list.scan(/\s*(\w+)\s*=\s*"([^"]+)"\s*/)
                .map { |k,v| [k.downcase.to_sym, v] }
                .to_h
end

# Replace '<div id="toc-index"></div>' with the sections index
def serialize_sections_index sections_index, max_depth, content
  content.gsub! %r{<div id="toc-index"></div>} do |match|
    table = serialize_sections_index_row sections_index, max_depth, 0, true
    table
  end
end

# Serialize a single row of index entries, and recursively create the index for sub-entries
def serialize_sections_index_row sections_index, max_depth, depth, root
  if max_depth == 0
    return ""
  end

  table = "<ol class=\"#{root ? "index-entries index-entries-root" : "index-entries"}\" depth=\"#{depth}\">"
  sections_index.each do |section|
    index_sub = serialize_sections_index_row section[:children], max_depth - 1, depth + 1, false
    table += "<li><a href=\"##{section[:id]}\" class=\"index-entry-name\">#{section[:name]}</a>#{index_sub}</li>"
  end
  table += "</ol>"
  table
end