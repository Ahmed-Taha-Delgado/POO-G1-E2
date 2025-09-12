public class Punto {
    double x, y;

    public Punto() {}

    public Punto(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public String toString() {
        return "(x = " + x + " , y = " + y + ")";
    }
}