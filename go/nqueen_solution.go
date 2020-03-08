package main

import "fmt"

// N is const for specify size of matrix
const N int = 4

func main() {
	var mat [N][N]string
	var i, j int
	for i = 0; i < N; i++ {
		for j = 0; j < N; j++ {
			mat[i][j] = "-"
		}
	}
	nqueen(mat, 0, N)
}

func isSafe(mat [N][N]string, r int, c int, N int) bool {
	// check if there is no other queen in the same column
	i := r
	for i >= 0 {
		if mat[i][c] == "Q" {
			return false
		}
		i--
	}

	// check if there is no other queen in the diagonal \
	i = r
	j := c
	for i >= 0 && j >= 0 {
		if mat[i][j] == "Q" {
			return false
		}
		i--
		j--
	}

	// check if there is other than queen in diagonal /
	i = r
	j = c
	for i >= 0 && j < N {
		if mat[i][j] == "Q" {
			return false
		}
		i--
		j++
	}

	return true
}

func nqueen(mat [N][N]string, r int, N int) {
	if r == N {
		i := 0
		for i < N {
			j := 0
			for j < N {
				fmt.Printf("%s", mat[i][j])
				j++
			}
			fmt.Println("")
			i++
		}
		fmt.Println("")

		return
	}

	i := 0
	for i < N {
		if isSafe(mat, r, i, N) {
			mat[r][i] = "Q"
			nqueen(mat, r+1, N)
			mat[r][i] = "-"
		}
		i++
	}
	return
}
