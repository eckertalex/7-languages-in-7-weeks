#!/usr/bin/env ruby
# frozen_string_literal: true

raise 'Example usage: ./grep.rb "one" sample.txt' unless ARGV.size == 2

regex = Regexp.new(ARGV.shift)

ARGF.each_line do |line|
  puts "#{ARGF.lineno}: #{line}" if line =~ regex
end
