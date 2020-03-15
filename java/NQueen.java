public class NQueen {
    public static void main(String[] args) {
        int N = 4;
        String[][]mat = new String[N][N];
        for(int i =0; i < N; i++) {
            for(int j = 0; j < N; j++) {
                mat[i][j] = "-";
            }
        }
        nQueen(mat, 0, N);
    }

    public static boolean isSafe(String[][] mat, int r, int c, int N) {
        //check there is no queen in the same column |
        for(int i = r; i >=0; i--) {
            if(mat[i][c] == "Q") {
                return false;
            }
        }

        //check there is no queen in the same diagonal \
        for(int i = r, j = c; j >= 0 && i >= 0; i--, j-- ) {
            if(mat[i][j] == "Q"){
                return false;
            }
        }

        //check there is no queen in the same diagonal /
        for(int i = r, j = c; j < N && i >= 0; i--, j++) {
            if(mat[i][j] == "Q") {
                return false;
            }
        }

        return true;
    }


    public static void nQueen(String[][] mat, int r, int N) {
        if(r == N) {
            for(int i = 0; i < N; i++) {
                for(int j = 0; j < N; j++) {
                    System.out.print(mat[i][j]);
                }
                System.out.println();
            }
            System.out.println();

            return;
        }

        for(int i = 0; i < N; i++) {
            if(isSafe(mat, r, i, N)) {
                mat[r][i] = "Q";
                nQueen(mat, r+1, N);
                mat[r][i] = "-";
            }
        }
    }
}