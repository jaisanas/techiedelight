# The N queens puzzle is the problem of placing N chess queens on an N × N chessboard so that no two queens threaten each other.
# Thus, a solution requires that no two queens share the same row, column, or diagonal.

# For example, for standard 8 × 8 chessboard below is one such configuration –
# Q – – – – – – –

# – – – – Q – – –

# – – – – – – – Q

# – – – – – Q – –

# – – Q – – – – –

# – – – – – – Q –

# – Q – – – – – –

# – – – Q – – – –

def is_safe(mat, r, c)
    # check if there is another queen in same column
    i = r
    while i >= 0
        if mat[i][c] == "Q"
            return false
        end 

        i -= 1
    end 

    # check if there is another queen in same diagonal \
    i = r
    j = c
    while i >= 0 and j >= 0
        if mat[i][j] == "Q"
            return false
        end
        i -= 1
        j -= 1
    end

    # check if there is another queenn in same diagonal /
    i = r
    j = c
    while i >= 0 and j < N 
        if mat[i][j] == "Q"
            return false
        end
        j += 1
        i -= 1
    end

    return true
end

def n_queen(mat, r) 
    # print matriks if r reach the base
    if r == N
        i = 0
        while i < N
            j = 0
            while j < N
                print mat[i][j]
                j += 1
            end
            puts ""
           i += 1 
        end
        puts ""
        return
    end

    #recur solution
    i = 0
    while i < N
        if is_safe(mat, r, i) 
            mat[r][i] = "Q"
            n_queen(mat, r+1)
            mat[r][i] = "-"
        end
        i += 1
    end
end

N = 4
mat = Array.new(N){Array.new(N)}
i = 0
while i < N
    j = 0
    while j < N
        mat[i][j] = "-"
        j += 1
    end
    i += 1
end

n_queen(mat,0)
