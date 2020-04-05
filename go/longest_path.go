package main

import "fmt"

const N = 10

var ROW [4]int = [4]int{-1, 0, 1, 0}

var COL [4]int = [4]int{0, 1, 0, -1}

var mat [N][N]int = [N][N]int{
	[N]int{1, 0, 1, 1, 1, 1, 0, 1, 1, 1},
	[N]int{1, 0, 1, 0, 1, 1, 1, 0, 1, 1},
	[N]int{1, 1, 1, 0, 1, 1, 0, 1, 0, 1},
	[N]int{0, 0, 0, 0, 1, 0, 0, 1, 0, 0},
	[N]int{1, 0, 0, 0, 1, 1, 1, 1, 1, 1},
	[N]int{1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	[N]int{1, 0, 0, 0, 1, 0, 0, 1, 0, 1},
	[N]int{1, 0, 1, 1, 1, 1, 0, 0, 1, 1},
	[N]int{1, 1, 0, 0, 1, 0, 0, 0, 0, 1},
	[N]int{1, 0, 1, 1, 1, 1, 0, 1, 0, 0},
}

var visited [N][N]bool

func main() {
	var i, j int
	for i = 0; i < N; i++ {
		for j = 0; j < N; j++ {
			visited[i][j] = false
		}
	}

	maxDist := longestPath(mat, visited, 0, 0, 0, 0)
	fmt.Println(maxDist)
}

func isValid(x int, y int) bool {
	if x < 0 || y < 0 || x >= N || y >= N {
		return false
	}

	return true
}

func longestPath(mat [N][N]int, visited [N][N]bool, x int, y int, dist int, maxDist int) int {
	if x == 5 && y == 7 {
		if dist > maxDist {
			maxDist = dist
		}

		return maxDist
	}

	visited[x][y] = true
	var i int
	for i = 0; i < 4; i++ {
		newX := x + ROW[i]
		newY := y + COL[i]
		if isValid(newX, newY) && visited[newX][newY] == false && mat[newX][newY] == 1 {
			maxDist = longestPath(mat, visited, newX, newY, dist+1, maxDist)
		}
	}
	visited[x][y] = false
	return maxDist
}
