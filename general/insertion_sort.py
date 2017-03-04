def insertion_sort(numbers):
  numbers_length = len(numbers) - 1
  for j in range(numbers_length - 1, -1, -1):
    current = numbers[j]
    i = j + 1
    print "j: " + str(j)
    print "i: " + str(i)
    while i <= numbers_length and numbers[i] > current:
      print "i: " + str(i)
      numbers[i - 1] = numbers[i]
      print numbers
      numbers[i] = current
      print numbers
      i += 1
  print numbers



