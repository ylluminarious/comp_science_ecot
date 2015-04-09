def bubble_sort(array, length)
  # The loop that iteratively goes through the array and sorts it
  array.each do |element|
    # Some pretty self-explanatory variables
    current_element = array.index(element)
    next_element    = current_element + 1
    
    # The first check is to make sure that the current element is not the last
    # because the last element has no next element to look to, so the program will crash
    
    if array[current_element] != array.last
      
      # The following bit of conditional logic compares the current element to the next element and
      # replaces the current one with the next one if the next one is smaller
      # (so that it bubbles up the index chain)
      
      if array[next_element] < array[current_element]
        array.insert(current_element, array.delete_at(next_element))
      end
    end
  end
  
  # This bit of logic makes sure that the method recurs if it
  # has not iterated through the array for it's length of times
  
  if length == 0
    print array
  else
    bubble_sort(array, length - 1)
  end
end

array_to_be_sorted = [4,3,78,2,0,2] # insert your array to be sorted
bubble_sort(array_to_be_sorted, array_to_be_sorted.length)