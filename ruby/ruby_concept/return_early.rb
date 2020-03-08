#this function will clarify if return inside loop will also return function
def return_early(arr)
    i = 0
    while i < arr.length
        if i >= 3 
            return i
        end
        i += 1
    end
    return i
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
result = return_early(arr)

# turns out that return statement will exit loop and function
puts result