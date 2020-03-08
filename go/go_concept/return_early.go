package main

import "fmt"

func main() {
	numbers := [10]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	i := -99
	i = checkReturnEarly(numbers)
	fmt.Println(i)
}

func checkReturnEarly(arr [10]int) int {
	i := 0
	for i <= 10 {
		if i >= 3 {
			return i
		}
		i++
	}

	i = 9

	return i
}
