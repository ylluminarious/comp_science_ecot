=begin
- Tell the user to give input for their cipher (their string and their shift factor)
- Get strings from user input
- Store the string and the shift factor
- Check every character in the string and see if it's a letter
- If it is a letter, give the letter the shift value to the right
- Store all the new letters in a variable
- Print out the variable for the user to see their Caesar's cipher
=end

$alphabet   = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
$cipher     = ""
$captilized = nil

def caesar_cipher(character, shift_factor)
  if character == character.upcase
    $captilized = true
  else
    $captilized = false
  end
  
  letter_shift = $alphabet.index(character.downcase) + shift_factor
  
  letter_shift = letter_shift - $alphabet.length
  
  puts letter_shift
    
  if $captilized
    character = $alphabet[letter_shift].upcase
  else
    character = $alphabet[letter_shift]
  end
  
  $cipher << character
end

puts "------------------------------------"
puts "Enter text for your Caesar's Cipher:"
puts "------------------------------------"

user_string = gets.chomp

puts "-------------------------------------------------------------------------------------"
puts "Enter the shift factor (which will move right), but only enter a number from 1 to 26:"
puts "-------------------------------------------------------------------------------------"

user_shift = gets.chomp
user_shift = user_shift.to_i

if (1..26).include? user_shift
  user_string.split("").each do |character|
    if $alphabet.include? character.downcase
      $alphabet.each do |letter|
        if character.downcase == letter
          caesar_cipher(character, user_shift)
        end
      end
    else
      $cipher << character
    end
  end
  
  puts "------------------------------------"
  puts "The Caesar's Cipher of your text is:"
  puts "------------------------------------"
  
  puts $cipher
else
  puts "Error: you must enter a shift factor between 1 and 26."
end