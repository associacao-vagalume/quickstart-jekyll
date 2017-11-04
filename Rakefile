#!/usr/bin/env ruby

require 'html-proofer'
require 'jekyll'
require 'bundler'

task :default => :preview

task :preview => [:cleanup, :build ] do
  build
  jekyll('serve --watch')
end

task :build do
  jekyll('build')
end

task :test => [:cleanup, :build ] do
  options = { :assume_extension => true, :check_html => true,  }
  HTMLProofer.check_directory("./_site", options).run
end

def jekyll(directives = '')
  sh 'jekyll ' + directives
end

# remove generated site
def cleanup
  sh 'rm -rf _site'
  compass('clean')
end