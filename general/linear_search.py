def linear_search(value, numbers):
  found = False
  numbers_length = len(numbers)
  for i in range(0, numbers_length):
    if numbers[i] == value:
      found = True
      break
  if found == True:
    print i
  else:
    print "nil"


