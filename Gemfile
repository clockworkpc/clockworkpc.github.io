source 'https://rubygems.org'
# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!
# gem 'jekyll', '3.3'
# This is the default theme for new Jekyll sites. You may change this to anything you like.
# gem 'commonmarker'
# gem 'concurrent-ruby'
# gem 'dnsruby'
# gem 'execjs'
# gem 'ffi'
# gem 'i18n'
# gem 'liquid'
# gem 'listen'
# gem 'minitest'
# gem 'rexml'
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
gem 'github-pages', group: :jekyll_plugins
# If you have any plugins, put them here!
group :jekyll_plugins do
  # gem 'activesupport'
  # gem 'addressable', '2.8.6'
  # gem 'base64', '0.2.0'
  # gem 'jekyll-commonmark-ghpages'
  gem 'jekyll-dash', '1.6.2'
  gem 'jekyll-mermaid'
  # gem 'jekyll-mermaid', '1.0.0'
  gem 'jekyll-tagging', '1.1.0'
  gem 'jekyll-theme-hacker'
  # gem 'minima', '2.5'
  # gem 'nuggets', '1.6.1'
  # gem 'racc', '1.7.3'
  # gem 'thread_safe', '0.3.6'
  # gem 'typhoeus', '1.4.1'
  # gem 'unf_ext', '0.0.9.1'
  # gem 'zeitwerk', '2.6.12'
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
install_if -> { RUBY_PLATFORM =~ /mingw|mswin|java/ } do
  gem 'tzinfo', '1.2.11'
  gem 'tzinfo-data'
end

# Performance-booster for watching directories on Windows
gem 'wdm', '0.1.1', install_if: Gem.win_platform?
