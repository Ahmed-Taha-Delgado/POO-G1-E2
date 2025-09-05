public class FormulaGeneral{

    public static void main(String[] args) {
        
        if(args.length==0){
            System.out.println("Ingresa los valores de a, b, c");
            return;
        }

        int imaginario=0;

        int a = Integer.parseInt(args[0]);
        int b = Integer.parseInt(args[1]);
        int c = Integer.parseInt(args[2]);


        double det=(b*b)-((4*a*c));

        if(det<0){
            det = Math.abs(det);
            imaginario=1;
        }

        double x1 = ((-b)+Math.sqrt(det))/(2*a);
        double x2 = ((-b)-Math.sqrt(det))/(2*a);

        if(imaginario==1){
            System.out.println("x = "+ x1 +"i" + ", " + x2 + "i");
        }else{
            System.out.println("x = "+ x1 + " , " + x2);
        }
    }

}