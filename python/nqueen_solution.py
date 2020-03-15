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

def nqueen(mat, r, N):
    if r == N:
        print(mat,  end="\n")
        return
    
    i = 0
    while i < N:
        if is_safe(mat, r, i, N):
            mat[r][i] = "Q"
            nqueen(mat, r+1, N)
            mat[r][i] = "-"
        i += 1
    return

N = 4
rows, cols = (N, N) 
mat = [["-"] * N for i in range(N)]
nqueen(mat,0, N)

