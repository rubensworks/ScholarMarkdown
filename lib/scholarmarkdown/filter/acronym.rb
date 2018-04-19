require 'csv'

# A filter for displaying full names of acronyms
Nanoc::Filter.define(:scholar_acronym) do |content, params|
  acronyms = CSV.parse(params[:acronyms].raw_content, :headers => true)
  transformed = content.dup
  acronyms.each do |row|
    transformed.gsub! %r{(?<=[^a-zA-Z0-9])#{row['abbreviation']}(?=[^a-zA-Z0-9])} do |match|
      %{<span class='abbreviation' title='#{row['full']}'>#{row['abbreviation']}</span>}
    end
  end
  transformed
end
