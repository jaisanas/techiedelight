#include <iostream>
using namespace std;

const int N = 4;

bool isSafe(char mat[N][N], int r, int c) {
    for(int i = r; i >= 0; i--) {
        if (mat[i][c] == 'Q') {
            return false;
        }
    }

    for(int i = r, j = c; i >= 0 && j >= 0; i--, j--) {
        if (mat[i][j] == 'Q') {
            return false;
        }
    }

    for(int i = r, j = c; i >= 0 && j < N; i--, j++) {
        if(mat[i][j] == 'Q') {
            return false;
        }
    }
    return true;
}

void nQueen(char mat[N][N], int r) {
    if(r == N) {
        for(int i = 0; i < N; i++) {
            for(int j = 0; j < N; j++) {
                cout<<mat[i][j]<<" ";
            }
            cout<<"\n";
        }
        cout<<"\n";

        return;
    }

    for(int i = 0; i < N; i++) {
        if(isSafe(mat, r, i)) {
            mat[r][i] = 'Q';
            nQueen(mat, r+1);
            mat[r][i] = '-';
        }
    }
}

int main() {
    char mat[N][N];
    for(int i = 0; i < N; i++) {
        for(int j =0; j < N; j++) {
            mat[i][j] = '-';
        }
    }

    nQueen(mat, 0);

    return 0;
} 

