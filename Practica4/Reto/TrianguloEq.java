public class TrianguloEq {

    public double triangulo(Punto punto1, Punto punto2, Punto punto3){

        double d1 = distancia(punto1, punto2);
        double d2 = distancia(punto2, punto3);
        double d3 = distancia(punto1, punto3);

        double area = area(punto1, punto2, punto3);

        if((d1==d2 && d2==d3 && d1==d3) && area!=0){
            return d1;
        }

        return -1;
    }

    public static double distancia(Punto punto1, Punto punto2){
        double dx = punto1.x - punto2.x;
        double dy = punto1.y - punto2.y;
        
        double dist = Math.hypot(dx, dy);
        return Math.round(dist);
    }

    public static double area(Punto punto1, Punto punto2, Punto punto3){

        double valor1 = punto1.x * (punto2.y - punto3.y);
        double valor2 = punto2.x * (punto3.y - punto1.y);
        double valor3 = punto3.x * (punto1.y - punto2.y);
        double area = 0.5 * Math.abs(valor1 + valor2 + valor3);

        return area;
    }
}
