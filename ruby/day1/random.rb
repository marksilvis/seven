answer = rand(10)
guess = -1
rounds = 0

until answer == guess
    print "guess: "
    guess = gets.chomp.to_i
    rounds+=1
end

puts "\nAnswer #{answer}\nGuesses: #{rounds}"