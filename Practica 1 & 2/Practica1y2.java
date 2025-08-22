import java.util.Scanner;

public class Practica1y2 {
    
    public static void main(String[] args){
        int opcion, termino, n;
        Scanner e = new Scanner(System.in);
        do{
            System.out.println("\nElige una opción:");
            System.out.println("1- Factorial recursivo");
            System.out.println("2- Serie de Fibonacci");
            System.out.println("3- Conjetura de Collatz");
            System.out.println("4- Salir");
            opcion=e.nextInt();

            switch(opcion){
                case 1:
                    System.out.println("Elegiste Factorial recursivo");
                    System.out.println("Ingrese el numero que quiere sacar su factorial:");
                    n=e.nextInt();
                    long resultado = factorial(n);
                    System.out.println("Numero dado: " + n);
                    System.out.println("Expresion del resultado: " + expresionResultado(n) + " = " + resultado);
                    factorial(n);
                    break;
                case 2:
                    System.out.println("Elegiste Serie de Fibonacci");
                    do{
                        System.out.print("Cuantos terminos de la serie de Fibonacci quiere ver: ");
                        termino = e.nextInt();

                        if (termino<=0){
                            System.out.println("No le puedo mostrar menos de 1 termino");
                        }
                    }while(termino<=0);

                    System.out.println("La serie de Fibonacci hasta el termino "+termino+" es:");
                    for (n=0; n<termino; n++){
                        System.out.print(fibonacci(n)+" ");
                    }
                    break;
                case 3:
                    System.out.println("Elegiste Conjetura de Collatz");
                    System.out.println("Ingrese el número con el que quiere hacer la conjetura de Collatz");
                    n=e.nextInt();
                    System.out.println("");
                    collatzRecursivo(n);
                    break;
                case 4:
                    System.out.println("Saliendoooo....");
                    break;
                default:
                    System.out.println("Ingrese una opcion valida");
                    continue;
            }
        }while(opcion!=4);
        e.close();
    }

    public static int fibonacci(int valor){
        if (valor==0){
            return 0;
        } else if (valor==1){
            return 1;
        }else{
            return fibonacci(valor-2)+fibonacci(valor-1);
        }
    }

    public static long factorial(int n) {
        if(n==0||n==1){
            return 1;
        }else{
            return n*factorial(n-1);
        }
    }

    public static String expresionResultado(int n){
        if (n==1) {
            return "1";
        } else {
            return n + " * " + expresionResultado(n - 1);
        }
    }

    public static int collatzRecursivo(int numero){
        int valor;
        if(numero==1){
            System.out.println("Fin");
            return numero;
        }
        if(numero%2==0){
            valor=numero/2;
            System.out.print(" "+valor);
        }else{
            valor=numero*3+1;
            System.out.print(" "+valor);
        }
        return(collatzRecursivo(valor));
    }

}