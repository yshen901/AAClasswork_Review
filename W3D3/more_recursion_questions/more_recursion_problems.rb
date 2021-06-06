#Problem 1: 
def sum_recur(array)
  return 0 if array.empty?
  array.pop + sum_recur(array)
end

#Problem 2: 
def includes?(array, target)
  return false if array.empty?
  return true if array.pop == target
  includes?(array)
end

# Problem 3: 
def num_occur(array, target)
  return 0 if array.empty?
  return 1 + num_occur(array, target) if array.pop == target
  num_occur(array, target)
end

# Problem 4: 
def add_to_twelve?(array)
  return false if array.length <= 1
  return true if array[0] + array[1] == 12
  add_to_twelve?(array.drop(1))
end

# Problem 5: 
def sorted?(array)
  return true if array.length == 1
  return false if array[0] > array[1]
  sorted?(array.drop(1))
end

# Problem 6: 

def reverse(string)
  return string if string == ""
  return reverse(string[1..-1]) + string[0]
end
