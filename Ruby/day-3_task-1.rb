#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each(&block)
      @csv_contents.each do |row|
        csv_row = CsvRow.new(row)
        yield csv_row
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class CsvRow
  attr_accessor :content

  def initialize(content)
    @content = content
  end

  def method_missing(name, *args)
    index_map = { "one" => 0, "two" => 1 }  # etc.
    index = index_map[name.to_s]
    @content[index.to_i]
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
# puts m.headers.inspect
# puts m.csv_contents.inspect
m.each { |row| puts row.two }


# Do:
# Modify the CSV application to support an each method to return a CsvRow object.
# Use method_missing on that CsvRow to return the value for the column for a given heading.
# For example, for the file:
#       one, two
#       lions, tigers
# allow an API that works like this:
#       csv = RubyCsv.new
#       csv.each {|row| puts row.one}
# This should print "lions".
