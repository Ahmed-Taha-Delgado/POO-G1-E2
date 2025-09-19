public class Principal {
    public static void main(String[] args) {
        
        if(args.length!=6){
            Ventana ventana = new Ventana();
            ventana.setVisible(false);
            return;
        }

        double x1 = Double.parseDouble(args[0]);
        double y1 = Double.parseDouble(args[1]);
        double x2 = Double.parseDouble(args[2]);
        double y2 = Double.parseDouble(args[3]);
        double x3 = Double.parseDouble(args[4]);
        double y3 = Double.parseDouble(args[5]);

        Punto punto1 = new Punto(x1, y1);
        Punto punto2 = new Punto(x2, y2);
        Punto punto3 = new Punto(x3, y3);

        Mensaje mostrar = new Mensaje();

        Ventana ventana = new Ventana(punto1, punto2, punto3, mostrar);
        ventana.setVisible(true);
    }
}
