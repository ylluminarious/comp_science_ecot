$alphabet   = ("a".."z").to_a
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

puts "---------------------------------------------------------------------------------------"
puts "Enter the shift factor (which will move right), but only enter an integer from 1 to 26:"
puts "---------------------------------------------------------------------------------------"

user_shift = gets.chomp

if user_shift.include? "."
  # do not make `user_shift` an integer and therefore the error will be thrown
else
  user_shift = user_shift.to_i
end

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
  puts "------------------------------------------------------------------------"
  puts "Error: you must enter an integer between 1 and 26 for your shift factor."
  puts "------------------------------------------------------------------------"
end