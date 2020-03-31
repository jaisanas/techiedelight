public class KnightTour{
    public static int N = 5;
    public static int[] ROW = {2, 1, -1, -2, -2, -1, 1, 2};
    public static int[] COL = {1, 2, 2, 1, -1, -2, -2, -1};

    public static void main(String[] args) {
        int[][] visited = new int[N][N];
        for(int i = 0; i < N; i++) {
            for(int j = 0; j < N; j++) {
                visited[i][j] = 0;
            }
        }
        knightTour(visited, 0, 0, 1);
    }

    public static boolean isValid(int x, int y) {
        if(x < 0 || y < 0 || x >= N || y >= N) {
            return false;
        }

        return true;
    }

    public static void printVisited(int[][] visited) {
        for(int i = 0; i < N; i++) {
            for(int j = 0; j < N; j++) {
                System.out.printf("%d ", visited[i][j]);
            }
            System.out.println();
        }
        System.out.println();
    }

    public static void knightTour(int[][] visited, int x, int y, int steps) {
        visited[x][y] = steps;
        if(steps >= N*N) {
            printVisited(visited);
            visited[x][y] = 0;
            return;
        }

        for(int i = 0; i < 8; i++) {
            int newX = x + ROW[i];
            int newY = y + COL[i];
            if(isValid(newX, newY) && visited[newX][newY] == 0) {
                knightTour(visited, newX, newY, steps+1);
            }
        }
        visited[x][y] = 0;
    }
}