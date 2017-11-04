#!/usr/bin/env ruby

require 'html-proofer'
require 'jekyll'
require 'bundler'

task :default => [:preview]

task :preview do
  build
  jekyll(serve --watch)
end

task :build do
  jekyll(build)
end

task :test do
  build
  options = { :assume_extension => true, :check_html => true,  }
  HTMLProofer.check_directory("./_site", options).run
end

