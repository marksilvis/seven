/**
 * A friendly greeting
 */

// make the greeter
greeter := Object clone
greeter greetings := method(n,
    "Hello, #{n}! You are awesome!" interpolate println)

// get name
"What is your name: " print
name := File standardInput readLine

// greet the user
greeter greetings(name)
