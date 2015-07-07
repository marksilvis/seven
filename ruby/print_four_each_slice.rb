a = (0..15).collect {rand(100)}
a.each_slice(4) {|i| p i}
