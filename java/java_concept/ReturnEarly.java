public class ReturnEarly {
    public static void main(String[] args){
        int length = 7;
        int[] arr = new int[length];

        int x = returnEarly(arr, length);
        System.out.println(x);
    }

    public static int returnEarly(int[] arr, int length) {
        for(int i = 0; i < length; i++) {
            if(i >= 3) {
                return i;
            }
        }
        int sum = 10;
        return sum;
    }
}