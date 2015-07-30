a = (0..15).collect {rand(100)}
a.each_with_index do |i, v|
    puts if v>0 && v%4==0
    print i
    print ' '
end
