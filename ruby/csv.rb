#!/usr/bin/env ruby
# frozen_string_literal: true

module ActsAsCsv
  class CsvRow
    def initialize(csv, contents)
      @csv = csv
      @contents = contents
    end

    def method_missing(name, *args)
      index = @csv.headers.index name.to_s
      @contents[index]
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def act_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << CsvRow.new(self, row.chomp.split(', '))
      end
    end

    def each &block
      @csv_contents.each do |row|
        block.call row
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class Sample
  include ActsAsCsv
  act_as_csv
end

csv = Sample.new
csv.each { |row| puts row.one }
