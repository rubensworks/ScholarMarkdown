# Includes code blocks from external files
Nanoc::Filter.define(:scholar_include_code) do |content|
  content = content.dup
  content.gsub! %r{````(/[^`]+)````} do
    code = @items[$1]
    raise "Code block #{$1} not found." unless code
    "<pre>" + code.raw_content.lines.map{|line| "<code>#{h line}</code>"}.join() + "</pre>"
  end
  content
end
