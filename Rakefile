#!/usr/bin/env ruby

require 'html-proofer'

task :default => [:test]

task :test do
  HTMLProofer.check_directory("./_site").run
end

