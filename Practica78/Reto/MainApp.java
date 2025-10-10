import java.util.ArrayList;
import java.util.Scanner;

public class MainApp {
    
    public static void main(String[] args) {
        
        String titulo, autor;
        int anio;

        ArrayList<Material> listaMateriales = new ArrayList<>();
        Scanner e = new Scanner(System.in);
        
        int opcion;

        do {
            
            System.out.println("Menu polimorfismo");
            System.out.println("Ingresa que material quieres agregar");
            System.out.println("1) Revista");
            System.out.println("2) Libro");
            System.out.println("3) DVD");
            System.out.println("4) Ver materiales");
            System.out.println("5) Salir");
            opcion = e.nextInt();
            e.nextLine();

            if(opcion !=4 && opcion != 5){
                
                System.out.print("Ingesa el titulo: ");
                titulo = e.nextLine();
                System.out.print("Ingresa el autor: ");
                autor = e.nextLine();
                System.out.print("Ingresa el año: ");
                anio = e.nextInt();
            }
            Material miMaterial;
            switch (opcion) {
                case 1:
                    miMaterial = new Revista(titulo, autor, anio);
                    listaMateriales.add(miMaterial);
                    break;
                case 2:
                    miMaterial = new Libro(titulo, autor, anio);
                    listaMateriales.add(miMaterial);
                    break;

                case 3:
                    miMaterial = new DVD(titulo, autor, anio);
                    listaMateriales.add(miMaterial);
                    break;

                case 4:
                    System.out.println(listaMateriales);
                    break;

                
                default:
                    System.out.println("Opcion invalida");
                    break;
            }

        } while (opcion != 5);

        e.close();
    }
}
