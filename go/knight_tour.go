package main

import "fmt"

// N is size of matrix input
const N int = 5

var ROW [8]int = [8]int{2, 1, -1, -2, -2, -1, 1, 2}

var COL [8]int = [8]int{1, 2, 2, 1, -1, -2, -2, -1}

func main() {
	var mat [N][N]int
	var i, j int
	for i = 0; i < N; i++ {
		for j = 0; j < N; j++ {
			mat[i][j] = 0
		}
	}
	printVisited(mat)
	knightTour(mat, 0, 0, 1)
}

func isValid(x int, y int) bool {
	if x < 0 || y < 0 || x >= N || y >= N {
		return false
	}

	return true
}

func knightTour(visited [N][N]int, x int, y int, steps int) {
	visited[x][y] = steps
	if steps >= N*N {
		printVisited(visited)
		visited[x][y] = 0
		return
	}

	for i := 0; i < 8; i++ {
		newX := x + ROW[i]
		newY := y + COL[i]
		if isValid(newX, newY) && visited[newX][newY] == 0 {
			knightTour(visited, newX, newY, steps+1)
		}
	}
	visited[x][y] = 0
}

func printVisited(visited [N][N]int) {
	for i := 0; i < N; i++ {
		for j := 0; j < N; j++ {
			fmt.Printf("%d", visited[i][j])
		}
		fmt.Println()
	}
	fmt.Println()
}
