#include <iostream>
using namespace std;

const int N = 5;
const int ROW[8] = {2, 1, -1, -2, -2, -1, 1, 2};
const int COL[8] = {1, 2, 2, 1, -1, -2, -2, -1};

bool isValid(int x, int y) {
    if(x < 0 || y < 0 || x >= N || y >= N) {
        return false;
    }

    return true;
}

void printVisited(int visited[N][N]) {
    for(int i = 0; i < N; i++) {
        for(int j = 0; j < N; j++) {
            cout<<visited[i][j]<<" ";
        }
        cout<<"\n";
    }
    cout<<"\n";
}


void knightTour(int visited[N][N], int x, int y, int steps) {
    visited[x][y] = steps;
    if(steps >= N * N) {
        printVisited(visited);
        visited[x][y] = 0;
        return;
    }

    for(int i = 0; i < 8; i++) {
        int newX = x + ROW[i];
        int newY = y + COL[i];
        if(isValid(newX, newY) && visited[newX][newY] == 0) {
            knightTour(visited, newX, newY, steps + 1);
        }
    }
    visited[x][y] = 0;
}

int main() {
    int visited[N][N];
    for(int i = 0; i < N; i++) {
        for(int j = 0; j < N; j++) {
            visited[i][j] = 0;
        }
    }
    knightTour(visited, 0, 0, 1);
    return 0;
}