def is_valid(x, y)
    if x < 0 || y < 0 || x >= N || y >= N 
        return false
    end

    return true
end

def knight_tour(visited, x, y, steps) 
    visited[x][y] = steps
    if steps == N * N 
        i = 0
        while i < N 
            j = 0
            while j < N
                printf("%d ", visited[i][j])
                j += 1
            end
            puts ""
            i += 1
        end
        puts ""
        visited[x][y] = 0
        return
    end

    i = 0
    while i < ROW.length
        new_x = x + ROW[i]
        new_y = y + COL[i]
        if is_valid(new_x,new_y) and visited[new_x][new_y] == 0 
            knight_tour(visited, new_x, new_y, steps + 1)
        end
        i += 1
    end
    visited[x][y] = 0
end

def print_visited(visited)
    i = 0
    while i < N 
        j = 0
        while j < N
            printf("%d ", visited[i][j])
            j += 1
        end
        puts ""
        i += 1
    end
    puts ""
end

N = 5
ROW = [2, 1, -1, -2, -2, -1,  1,  2]
COL = [1, 2,  2,  1, -1, -2, -2, -1]
visited = Array.new(N){Array.new(N)}
i = 0
while i < N 
    j = 0 
    while j < N 
        visited[i][j] = 0
        j += 1
    end
    i += 1
end

knight_tour(visited, 0, 0, 1)


