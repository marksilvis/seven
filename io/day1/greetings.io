/**
 * A friendly greeting
 */
name := nil

// make the greeter
greeter := Object clone
greeter greetings := method("Hello, #{name}! You are awesome!" interpolate println)

// get name
"What is your name: " print
name = File standardInput readLine

// greet the user
greeter greetings

