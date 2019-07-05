require 'csv'

# A filter for displaying full names of acronyms
Nanoc::Filter.define(:scholar_acronym) do |content, params|
  acronyms = CSV.parse(params[:acronyms].raw_content, :headers => true)
  
  # Annotate all occurrences with their full name
  transformed = content.dup
  acronyms.each do |row|
    transformed.gsub! %r{(?<=[\s\.,!?])#{row['abbreviation']}(?=[\s\.,!?])} do |match|
      %{<abbr title='#{row['full']}'>#{row['abbreviation']}</abbr>}
    end
  end
  
  # Inject acronyms list
  transformed = transformed.gsub! %r{<div id="scholarmarkdown-acronyms-list"></div>} do |match|
    serialize_acronyms acronyms
  end
  
  transformed
end

# Serialize the list of acronyms to a table
def serialize_acronyms acronyms
  table = "<table class=\"acronyms\">"
  
  acronyms.each do |row|
    table += "<tr><th>#{row['abbreviation']}</th><td>#{row['full']}</td></tr>"
  end
  
  table += "</table>"
  table
end
