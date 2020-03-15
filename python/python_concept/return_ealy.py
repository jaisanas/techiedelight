def return_early(arr):
    i = 0
    while i < len(arr):
        if i >= 3:
            return i
        i += 1
    return i

arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
x = return_early(arr)
print(x)