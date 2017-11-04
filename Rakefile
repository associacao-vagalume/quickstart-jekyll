#!/usr/bin/env ruby

require 'html-proofer'
require 'jekyll'
require 'bundler'

task :default => [:build, :test]

task :install do
  bundle install
end

task :build do
  jekyll build  
end

task :test do
  options = { :assume_extension => true, :check_html => true,  }
  HTMLProofer.check_directory("./_site", options).run
end

