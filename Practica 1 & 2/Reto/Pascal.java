import java.util.Scanner;

public class Pascal{

    public static void main(String[] args){

        System.out.print("Cuantos pisos quieres ver del triangulo de pascal? ");
        Scanner e=new Scanner(System.in);
        int pisos=e.nextInt();

        for(int i=0;i<pisos;i++){

            for(int k=0;k<pisos-i;k++){
                System.out.print(" ");
            }

            for(int j=0;j<=i;j++){
                System.out.print(trianguloPascal(i,j)+" ");
            }
            System.out.println("");
        }

        e.close();

    }

    public static int trianguloPascal(int n, int j){

        if(j==0 || j==n){
            return 1;
        }

        return trianguloPascal(n-1,j-1)+trianguloPascal(n-1,j);

    }









}