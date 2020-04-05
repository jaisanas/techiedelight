def is_valid(x, y):
    if x < 0 or y < 0 or x >= N or y >= N:
        return False
    return True

def knight_tour(visited, x, y, steps):
    visited[x][y] = steps
    if steps == N * N:
        print_visited(visited)
        visited[x][y] = 0
        return
    
    i = 0
    while i < len(ROW):
        new_x = x + ROW[i]
        new_y = y + COL[i]
        if is_valid(new_x,new_y) and visited[new_x][new_y] == 0:
            knight_tour(visited, new_x , new_y, steps + 1)
        i += 1
    visited[x][y] = 0
    return

def print_visited(visited):
    i = 0
    while i < N:
        j = 0
        while j < N:
            print(visited[i][j], end=" ")
            j = j +  1
        print("\n")
        i = i + 1
    print("\n")

N = 5
ROW = [2, 1, -1, -2, -2, -1,  1,  2]
COL = [1, 2,  2,  1, -1, -2, -2, -1]
visited = [[0] * N for i in range(N)]
knight_tour(visited, 0, 0, 1)

