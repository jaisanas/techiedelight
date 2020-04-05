
def is_valid(x,y)
    if x < 0 or y < 0 or x >= N or y >= N 
        return false
    end

    return true
end

def longest_path(mat, visited, current_long, incoming_long, x, y)
    if x == 5 and y == 7 
        if incoming_long > current_long 
            current_long = incoming_long
            return current_long
        end
    end

    visited[x][y] = true
    i = 0 
    while i < 4 
        newX = x + ROW[i]
        newY = y + COL[i]
        if is_valid(newX, newY) and visited[newX][newY] == false and mat[newX][newY] == 1
            current_long = longest_path(mat, visited, current_long, incoming_long + 1, newX, newY)
        end
        i += 1
    end
    visited[x][y] = false

    return current_long
end

N = 10
mat = Array.new(N){Array.new(N)}
mat = [ 
    [ 1, 0, 1, 1, 1, 1, 0, 1, 1, 1 ],
    [ 1, 0, 1, 0, 1, 1, 1, 0, 1, 1 ],
    [ 1, 1, 1, 0, 1, 1, 0, 1, 0, 1 ],
    [ 0, 0, 0, 0, 1, 0, 0, 1, 0, 0 ],
    [ 1, 0, 0, 0, 1, 1, 1, 1, 1, 1 ],
    [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 ],
    [ 1, 0, 0, 0, 1, 0, 0, 1, 0, 1 ],
    [ 1, 0, 1, 1, 1, 1, 0, 0, 1, 1 ],
    [ 1, 1, 0, 0, 1, 0, 0, 0, 0, 1 ],
    [ 1, 0, 1, 1, 1, 1, 0, 1, 0, 0 ]
]
visited = Array.new(N){Array.new(N)}
i = 0
while i < N 
    j = 0
    while j < N 
        visited[i][j] = false
        j += 1
    end
    i += 1
end

ROW = [-1,0,1,0]
COL = [0,1,0,-1]
incoming_long = 0
current_long = 0
max_dist = longest_path(mat, visited, current_long, incoming_long, 0, 0)
puts max_dist