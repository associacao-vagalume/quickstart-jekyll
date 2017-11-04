#!/usr/bin/env ruby

require 'html-proofer'
require 'jekyll'
require 'bundler'

task :default => :build

task :preview => [:clean, :build ] do
  jekyll('serve --watch')
end

task :build do
  jekyll('build')
end

task :test => [:clean, :build ] do
  options = { :assume_extension => true, :check_html => true,  }
  HTMLProofer.check_directory("./_site", options).run
end

task :clean do
  cleanup
end

def jekyll(directives = '')
  sh 'jekyll ' + directives
end

# remove generated site
def cleanup
  sh 'rm -rf _site'
end