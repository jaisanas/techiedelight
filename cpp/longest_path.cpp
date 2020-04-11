#include <iostream>
using namespace std;

const int N = 10;

const int ROW[4] = {-1, 0, 1, 0};
const int COL[4] = {0, 1, 0, -1};

int mat[N][N] = {
    {1, 0, 1, 1, 1, 1, 0, 1, 1, 1},
	{1, 0, 1, 0, 1, 1, 1, 0, 1, 1},
	{1, 1, 1, 0, 1, 1, 0, 1, 0, 1},
	{0, 0, 0, 0, 1, 0, 0, 1, 0, 0},
	{1, 0, 0, 0, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 0, 0, 0, 1, 0, 0, 1, 0, 1},
	{1, 0, 1, 1, 1, 1, 0, 0, 1, 1},
	{1, 1, 0, 0, 1, 0, 0, 0, 0, 1},
	{1, 0, 1, 1, 1, 1, 0, 1, 0, 0}
};

bool isValid(int x, int y) {
    if(x < 0 || y < 0 || x >= N || y >= N) {
        return false;
    }

    return true;
}

int findLongestPath(int mat[N][N], bool visited[N][N], int x, int y, int dist, int maxDist) {
    cout << x << y << endl;
    if(x == 5 && y == 7) {
        return max(dist, maxDist);
    }
    visited[x][y] = true;
    for(int i = 0; i < 4; i++) {
        int newX = x + ROW[i];
        int newY = y + COL[i];
        if(isValid(newX, newY) && mat[newX][newY] == 1 && visited[newX][newY] == false) {
            maxDist = findLongestPath(mat, visited, newX, newY, dist + 1, maxDist);
        }
    }
    visited[x][y] = false;

    return maxDist;
}

int main(){
    bool visited[N][N] = {false};
    int maxDist = findLongestPath(mat,visited, 0, 0, 0, 0);
    cout << maxDist << endl;
    return 0;
}




