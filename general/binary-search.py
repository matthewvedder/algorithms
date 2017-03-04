def binary_search(list, item):
    low = 0
    high = len(list) - 1

    while low <= high:
        mid = (low + high) / 2
        if list[mid] == item: return mid
        if list[mid] > item: high = mid - 1
        if list[mid] < item: low = mid + 1

print binary_search([1,2,3,7,13], 1)
print binary_search([1,2,3,7,13], 2)
print binary_search([1,2,3,7,13], 3)
print binary_search([1,2,3,7,13], 7)
print binary_search([1,2,3,7,13], 13)
print binary_search([1,2,3,7,13], 5)
