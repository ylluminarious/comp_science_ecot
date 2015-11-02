=begin
- Prompt user for integer input
- Store input
- Check if input contains letters or decimals
- If so, break the program and deliver a warning
- Convert string input to an intger
- Test if input is even or odd
- Tell user if it's even or odd
=end

puts "Enter an integer:"
integer = gets.chomp

forbidden_characters = ("a".."z").to_a
check_if_even_or_odd = true

forbidden_characters.each do |char|
  if integer.downcase.include? char
    puts "Warning; only enter integers."
    check_if_even_or_odd = false
    break
  end
end

integer = integer.to_i

if integer % 2 == 0 && check_if_even_or_odd
  puts "Your number is even."
elsif check_if_even_or_odd
  puts "Your number is odd."
end