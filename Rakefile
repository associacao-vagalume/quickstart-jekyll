#!/usr/bin/env ruby

require 'html-proofer'
require 'jekyll'
require 'bundler/gem_tasks'

task :default => [:install]

task :install do
  bundle install
end

task :build do
  bundle exec jekyll build  
end

task :test do
  options = { :assume_extension => true, :check_html => true,  }
  HTMLProofer.check_directory("./_site", options).run
end

