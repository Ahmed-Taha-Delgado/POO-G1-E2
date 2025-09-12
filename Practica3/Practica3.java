import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

public class Practica3 {

    public static void main(String[] args){
        ArrayList<String> ingresado = new ArrayList<String>();
        HashMap<String, String> hash = new HashMap<String, String>();

        if(args.length==0){
            System.out.println("Ingrese una cadena al ejecutar");
        }

        for(int i=0; i<args.length; i++){
            ingresado.add(args[i]);
        }

        for(String palabra:ingresado){
            String clave = generaHash(palabra);
            hash.put(clave, palabra);
        }

        String palabra;
        for(String llave:hash.keySet()){
            palabra=hash.get(llave);
            System.out.println("Clave: " + llave + "\tPalabra: " + palabra  );
        }
      
    }
    
    public static String generaHash(String texto) {
        // Crear la semilla a partir de la suma de los caracteres
        int semilla = 0;
        for (char c : texto.toCharArray()) {
            semilla += c;
        }

        Random random = new Random(semilla);

        // Generar 32 caracteres hexadecimales (simulando MD5)
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 32; i++) {
            int valor = random.nextInt(16); // 0 - F
            sb.append(Integer.toHexString(valor));
        }

        return sb.toString();
    }
}