# Add labels to elements such as figures and sections, and make them referencable.
Nanoc::Filter.define(:scholar_labelify) do |content|
  content = content.dup
  
  labels = create_labels content
  add_labels_to_figures content, labels
  set_reference_labels content, labels
  
  content
end

# Creates labels for referenceable elements
def create_labels content
  @reference_counts = {}
  main = content[%r{<main>.*</main>}m]
  appendix = content[%r{<div id="appendix"[^>]*>.*</div>}m] || ""
  labels = (main + appendix).scan(/<(\w+)([^>]*\s+id="([^"]+)"[^>]*)>/)
               .map do |tag, attribute_list, id|
    attributes = parse_attributes(attribute_list)
    type = label_type_for tag.downcase.to_sym, attributes
    number = 0
    if attributes[:class].nil? or !attributes[:class].include? 'no-label-increment'
      number = number_for type
    end
    [id, "#{type} #{number}"]
  end
  labels.to_h
end

# Determines the label type of a given element
def label_type_for tag, attributes
  case tag
  when :h2
    'Section'
  when :h3
    'Subsection'
  when :h4
    'Subsubsection'
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
        end
      end
    end
    'Fig.'
  else
    'Unknown'
  end
end

def number_for type
  # Determine number of elements
  @reference_counts[type] ||= 0
  number = @reference_counts[type] += 1

  # Perform hierarchical numbering when needed
  case type
  when 'Section'
    @reference_counts['Subsection'] = 0
    @reference_counts['Subsubsection'] = 0
  when 'Subsection'
    @reference_counts['Subsubsection'] = 0
    number = "#{reference_counts['Section']}.#{number}"
  when 'Subsubsection'
    number = "#{reference_counts['Section']}.#{reference_counts['Subsection']}.#{number}"
  end
  number
end

# Adds labels to referenceable figures
def add_labels_to_figures content, labels
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
