=begin
- Ask user for input for the number to square
- Convert the input string to an integer or a float (depending on what it is)
- Square the number
- Give the user their number squared
=end

# Ask for user input and store it.
puts "Enter number to be squared:"
number = gets

# To find out whether the number is an integer or a float, check if it has a decimal point.
if number.count('.') >= 1
  number = number.to_f  # Make it a float if it has a decimal point
else
  number = number.to_i  # Make it an integer otherwise
end

# Print out the number times itself
puts number * number