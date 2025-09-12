public class Mensajes {

    public String mensaje(Punto a, Punto b) {

        String puntoA = a.toString();
        String puntoB = b.toString();
        double distanciaX = a.x-b.x;
        double distanciaY = a.y-b.y;
        double distancia = Math.hypot(distanciaX,distanciaY);

        return "Punto a: "+puntoA+"\nPunto b: "+puntoB+"\nDistancia: "+distancia;
    }   
}