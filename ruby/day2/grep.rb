if ARGV.length < 2
    puts "incorrrect number of arguments"
    puts "usage: ruby grep.rb file search terms"
else
    terms = ARGV[1, ARGV.length].join(' ')
    begin
        puts "matches\n----------\n\n"
        File.readlines(ARGV[0]).each_with_index do |line, index|
            puts "#{index+1}: #{line}" if line =~ /#{terms}/
        end
    rescue Errno::ENOENT
        puts "file not found"
    else
        puts "\n----------\nfinished reading file"
    end
end