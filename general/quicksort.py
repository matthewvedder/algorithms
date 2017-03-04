from random import randint

def quicksort(array):
    if len(array) < 2: return array

    random_index = randint(0, len(array)-1)
    pivot = array.pop(random_index)
    less    = [i for i in array if i <= pivot]
    greater = [i for i in array if i >  pivot]

    return quicksort(less) + [pivot] + quicksort(greater)

print quicksort([10, 365, 42, 42, 42, 1, 78, 99, 23, 4])
