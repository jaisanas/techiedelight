def is_valid(x, y):
    if x < 0 or y < 0 or x >= N or y >= N:
        return False
    return True

def longest_path(mat, visited, x, y, dist, max_dist):
    if x == 5 and y == 7:
        if dist > max_dist:
            max_dist = dist 
        return max_dist
    visited[x][y] = True
    i = 0
    while i < 4:
        new_x = x + ROW[i]
        new_y = y + COL[i]
        if is_valid(new_x, new_y) and visited[new_x][new_y] == False and mat[new_x][new_y] == 1:
            max_dist = longest_path(mat, visited, new_x, new_y, dist + 1, max_dist)
        i += 1
    visited[x][y] = False
    return max_dist

N = 10
visited = [[False] * N for i in range(N)]
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
ROW = [-1,0,1,0]
COL = [0,1,0,-1]
max_dist = longest_path(mat, visited, 0, 0, 0, 0)
print(max_dist)