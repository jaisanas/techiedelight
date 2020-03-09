def is_safe(mat, r, c):
    i = 0
    while i >= 0:
        if mat[i][c] == "Q":
            return False
        i -= 1
    
