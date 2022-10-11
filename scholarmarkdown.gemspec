# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: scholarmarkdown 3.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "scholarmarkdown".freeze
  s.version = "3.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ruben Taelman".freeze]
  s.date = "2022-10-11"
  s.email = "rubensworks@gmail.com".freeze
  s.executables = ["generate-scholarmarkdown".freeze]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/generate-scholarmarkdown",
    "bin/template/.gitignore",
    "bin/template/Gemfile",
    "bin/template/Guardfile",
    "bin/template/README.md",
    "bin/template/Rules",
    "bin/template/config.ru",
    "bin/template/content/abstract.md",
    "bin/template/content/index.md.erb",
    "bin/template/content/introduction.md",
    "bin/template/content/references.bib",
    "bin/template/content/styles/lncs.scss",
    "bin/template/content/styles/print.scss",
    "bin/template/content/styles/reset.scss",
    "bin/template/content/styles/screen.scss",
    "bin/template/content/styles/shared.scss",
    "bin/template/content/styles/shared_override.scss",
    "bin/template/layouts/default.html.erb",
    "bin/template/nanoc.yaml",
    "bin/template_override_acm/content/abstract.md",
    "bin/template_override_acm/content/fonts/LinBiolinum_R.woff",
    "bin/template_override_acm/content/fonts/LinBiolinum_RB.woff",
    "bin/template_override_acm/content/fonts/LinLibertine_R.woff",
    "bin/template_override_acm/content/fonts/LinLibertine_RB.woff",
    "bin/template_override_acm/content/index.md.erb",
    "bin/template_override_acm/content/styles/acm.scss",
    "bin/template_override_acm/content/styles/print.scss",
    "bin/template_override_acm/content/styles/shared_override.scss",
    "bin/template_override_ceur/content/fonts/LinBiolinum_R.woff",
    "bin/template_override_ceur/content/fonts/LinBiolinum_RB.woff",
    "bin/template_override_ceur/content/fonts/LinLibertine_R.woff",
    "bin/template_override_ceur/content/fonts/LinLibertine_RB.woff",
    "bin/template_override_ceur/content/index.md.erb",
    "bin/template_override_ceur/content/styles/ceurart.scss",
    "bin/template_override_ceur/content/styles/print.scss",
    "bin/template_override_ceur/content/styles/shared_override.scss",
    "lib/scholarmarkdown.rb",
    "lib/scholarmarkdown/citationstyles/lncs-custom.csl",
    "lib/scholarmarkdown/filter/acronym.rb",
    "lib/scholarmarkdown/filter/annotations.rb",
    "lib/scholarmarkdown/filter/citation.rb",
    "lib/scholarmarkdown/filter/citation_metadata.rb",
    "lib/scholarmarkdown/filter/dokieli_ui.rb",
    "lib/scholarmarkdown/filter/headerids_to_section.rb",
    "lib/scholarmarkdown/filter/hyphenate_iri.rb",
    "lib/scholarmarkdown/filter/include_code.rb",
    "lib/scholarmarkdown/filter/labelify.rb",
    "lib/scholarmarkdown/filter/references_to_footer.rb",
    "lib/scholarmarkdown/preprocess/katex.rb",
    "lib/scholarmarkdown/snippets.rb",
    "scholarmarkdown.gemspec"
  ]
  s.homepage = "http://github.com/rubensworks/ScholarMarkdown".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "A framework for writing markdown-based scholarly articles.".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<puma>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<i18n>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<bibtex-ruby>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<latex-decode>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<citeproc-ruby>.freeze, [">= 1.1.6"])
    s.add_runtime_dependency(%q<csl-styles>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<bibmarkdown>.freeze, ["~> 2.0.0"])
    s.add_runtime_dependency(%q<katex>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<sskatex>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<kramdown-math-sskatex>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<execjs>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<mini_racer>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<libv8-node>.freeze, ["= 16.10.0.0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<juwelier>.freeze, ["~> 2.4.7"])
  else
    s.add_dependency(%q<puma>.freeze, [">= 0"])
    s.add_dependency(%q<i18n>.freeze, [">= 0"])
    s.add_dependency(%q<bibtex-ruby>.freeze, [">= 0"])
    s.add_dependency(%q<latex-decode>.freeze, [">= 0"])
    s.add_dependency(%q<citeproc-ruby>.freeze, [">= 1.1.6"])
    s.add_dependency(%q<csl-styles>.freeze, [">= 0"])
    s.add_dependency(%q<bibmarkdown>.freeze, ["~> 2.0.0"])
    s.add_dependency(%q<katex>.freeze, [">= 0"])
    s.add_dependency(%q<sskatex>.freeze, [">= 0"])
    s.add_dependency(%q<kramdown-math-sskatex>.freeze, [">= 0"])
    s.add_dependency(%q<execjs>.freeze, [">= 0"])
    s.add_dependency(%q<mini_racer>.freeze, [">= 0"])
    s.add_dependency(%q<libv8-node>.freeze, ["= 16.10.0.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<juwelier>.freeze, ["~> 2.4.7"])
  end
end

