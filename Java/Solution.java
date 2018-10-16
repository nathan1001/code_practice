class Solution {
    public int addDigits(int num) {

        // convert number to string inorder to split it.
        int sum = 0;
        String number =new String (Integer.toString(num));

        for (int i=0; i<number.length();i++){
            // System.out.println(number.substring(i,i+1));
            sum += Integer.parseInt( number.substring(i,i+1));
        }
        String summation= new String(Integer.toString(sum));
        if (summation.length()!=1){
            return addDigits(sum);
        }else{
            return sum;
        }
 }
}
