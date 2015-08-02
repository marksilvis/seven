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

        attr_accessor :headers, :csv_contents

        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
            end
        end

        def initialize
            read
        end

        def each &block
            @csv_contents.each &block
        end
    end

    class CsvRow

        attr_accessor :head, :row

        def initialize(header, content)
            @head = header
            @row = content
        end

        def method_missing name
            index = @head.index(name.to_s)
            return @row[index]
        end
    end
end

class RubyCsv   # mixin
    include ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each {|row| puts row.one}

