public class Practica4 {
    public static void main(String[] args) {

        if(args.length!=4){
            Ventana ventana = new Ventana();
            ventana.setVisible(false);
        } else{
            double x1 = Double.parseDouble(args[0]);
            double y1 = Double.parseDouble(args[1]);
            double x2 = Double.parseDouble(args[2]);
            double y2 = Double.parseDouble(args[3]);

            Punto a = new Punto(x1, y1);
            Punto b = new Punto(x2, y2);

            Mensajes mostrar = new Mensajes();

            Ventana ventana = new Ventana(a, b, mostrar);
            ventana.setVisible(true);
        }
    }
}