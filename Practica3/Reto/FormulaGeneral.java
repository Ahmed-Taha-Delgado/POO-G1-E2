public class FormulaGeneral{

    public static void main(String[] args) {
        
        if(args.length!=3){
            System.out.println("Ingresa los valores de a, b, c");
            return;
        }

        double a = Double.parseDouble(args[0]);
        double b = Double.parseDouble(args[1]);
        double c = Double.parseDouble(args[2]);


        double det=(b*b)-((4*a*c));

        if(det<0){
            det = Math.abs(det);
            double xi=Math.sqrt(det)/(2*a);
            double xr=(-b)/(2*a);
            System.out.println("x = " + xr + " + " + xi + "i" + ", " + xr + " - " + xi + "i");
        }else{
            double x1 = ((-b)+Math.sqrt(det))/(2*a);
            double x2 = ((-b)-Math.sqrt(det))/(2*a);
            System.out.println("x = "+ x1 + " , " + x2);
        }

    }

}
