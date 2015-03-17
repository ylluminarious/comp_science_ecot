=begin
- Tell the user to give input for their cipher (their string and their shift factor)
- Get strings from user input
- Store the string and the shift factor
- Check every character in the string and see if it's a letter
- If it is a letter, give the letter the value that is 5 places before it in the $alphabet
- Store all the new letters in a variable
- Print out the variable for the user to see their Caesar's cipher
=end

$alphabet   = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
$cipher     = ""
$captilized = nil

def caesar_cipher(character, shift)
  if character == character.upcase
    $captilized = true
  else
    $captilized = false
  end
  
  letter_shift = $alphabet.index(character.downcase) + shift
  
  if letter_shift >= $alphabet.length
    letter_shift = letter_shift - $alphabet.length
    
    if $captilized
      character = $alphabet[letter_shift].upcase
    else
      character = $alphabet[letter_shift]
    end
  else
    if $captilized
      character = $alphabet[letter_shift].upcase
    else
      character = $alphabet[letter_shift]
    end
  end
  
  $cipher << character
end

puts "Enter text for your Caesar's Cipher:"
user_string = gets.chomp

puts "Enter the shift factor (it will go to the right):"
user_shift = gets.chomp
user_shift = user_shift.to_i

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

puts "The Caesar's Cipher of your text is:"
puts $cipher