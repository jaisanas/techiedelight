def is_safe(mat, r, c, N):
    # check if there is another queen in same column
    i = r
    while i >= 0:
        if mat[i][c] == "Q":
            return False
        i -= 1
    
    # check if there is another queen in same diagonal \
    i = r
    j = c
    while i >= 0 and j >= 0:
        if mat[i][j] == "Q":
            return False
        i -= 1
        j -= 1
    
    # check if there is another queen in same diagonal /
    i = r
    j = c
    while i >= 0 and j < N:
        if mat[i][j] == "Q":
            return False
        i -= 1
        j += 1

    return True
    
