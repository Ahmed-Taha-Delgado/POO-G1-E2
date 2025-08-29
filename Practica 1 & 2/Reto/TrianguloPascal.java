import java.util.Scanner;

public class TrianguloPascal{

    public static void main(String[] args){

        System.out.print("Cuantos pisos quieres ver del triangulo de pascal? ");
        Scanner e=new Scanner(System.in);
        int pisos=e.nextInt();

        for(int i=0;i<pisos;i++){

            for(int k=0;k<pisos-i;k++){
                System.out.print(" ");
            }

            for(int j=0;j<=i;j++){
                System.out.print(Pascal(i,j)+" ");
            }
            System.out.println("");
        }

        e.close();

    }

    public static int Pascal(int n, int j){

        if(j==0 || j==n){
            return 1;
        }

        return Pascal(n-1,j-1)+Pascal(n-1,j);
        
    }

}