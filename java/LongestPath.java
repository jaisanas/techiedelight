public class LongestPath{
    public static int N = 10;
    public static int ROW[] = {-1, 0, 1, 0};
    public static int COL[] = {0, 1, 0, -1};
    public static int mat[][] = {
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
    public static void main(String[] args){
        boolean[][] visited = new boolean[N][N];
        for(int i = 0; i < N; i++) {
            for(int j = 0; j < N; j++) {
                visited[i][j] = false;
            }
        }

        int maxDist = findLongestPath(mat, visited, 0, 0, 0, 0);
        System.out.println(maxDist);
    }

    public static boolean isValid(int x, int y) {
        if(x < 0 || y < 0 || x >= N || y >= N) {
            return false;
        }

        return true;
    }

    public static int findLongestPath(int mat[][], boolean visited[][],int x, int y, int dist, int maxDist) {
        if(x == 5 && y == 7){
            return Math.max(maxDist,dist);
        }

        visited[x][y] = true;
        for(int i = 0; i < 4; i++) {
            int newX = x + ROW[i];
            int newY = y + COL[i];
            if(isValid(newX, newY) && visited[newX][newY] == false && mat[newX][newY] == 1) {
                maxDist = findLongestPath(mat, visited, newX, newY, dist + 1, maxDist);
            }
        }
        visited[x][y] = false;

        return maxDist;
    }
}
