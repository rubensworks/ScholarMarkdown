# ScholarMarkdown
[![scholarmarkdown gem version](https://badge.fury.io/rb/scholarmarkdown.svg)](https://rubygems.org/gems/scholarmarkdown)

ScholarMarkdown is Ruby gem for writing scholarly articles in Markdown/HTML. These articles can be viewed in your browser with rich HTML annotations, and they can be printed to PDF into traditional scientific templates via your browser.

It provides an executable (`generate-scholarmd`) for initializing a [nanoc](https://nanoc.ws/) project
to generate HTML and PDF versions of articles.

ScholarMarkdown consists of a collection of modules that can be configured in your `Rules` file.
More information on these modules can be found in the [wiki](https://github.com/rubensworks/ScholarMarkdown/wiki/Modules).

## Quick Start

#### 1. Use RubyGems to install this bundle:

```bash
$ gem install scholarmarkdown
```

#### 2. Generate your article

_This will create a directory `my-awesome-article` containing the basic files for a ScholarMarkdown project._

```bash
$ generate-scholarmarkdown my-awesome-article
$ cd my-awesome-article
$ bundle install
```

#### 3. Compile your article

_This will start a live webserver that will continuously compile your article files upon any change._

```
$ bundle exec guard
```

#### 4. View your article

Visit `http://localhost:3000/` in your browser to read your article.

Preview in print-mode to see it in its traditional scientific format.

## License
This software is released under the [MIT license](http://opensource.org/licenses/MIT).
