=begin
- Ask input for base number
- Store it
- Make the base number an integer or float, depending on the input
- Ask input for exponent number
- Store it
- Check to make sure that the exponent is an integer
- If it's not, deliver a warning message and break the program
- Otherwise, convert the exponent to an integer
- Multiply the number by itself as many times as the exponent number
- Give the user the result
=end

puts "Enter base number:"
base_number = gets

if base_number.count('.') >= 1
  base_number = base_number.to_f
else
  base_number = base_number.to_i
end

puts "Enter exponent number (only enter integers):"
exponent_number = gets

if exponent_number.count('.') >= 1
  puts "ONLY USE INTEGERS FOR THE EXPONENT"
else
  exponent_number = exponent_number.to_i
end

base_number = base_number ** exponent_number
puts base_number