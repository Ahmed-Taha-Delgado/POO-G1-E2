package mx.unam.fi.poo.p78;

import java.awt.Dimension;
import java.awt.Graphics2D;

public class Rectangulo extends Figura{
    
    private double alto, ancho;

    public Rectangulo(double alto, double ancho){
        setAlto(alto);
        setAncho(ancho);
    }

    public void setAlto(double alto){ this.alto = alto; }
    public void setAncho(double ancho){ this.ancho = ancho; }
    public double getAlto(){ return alto; }
    public double getAncho(){ return ancho; }

    @Override 
    public double area(){ return alto * ancho; }

    @Override 
    public double perimetro(){ return (2 * alto) +(2 * ancho); }

    @Override
    public void dibujar(Graphics2D g, Dimension size) {
        double margen = 20;
        double maxW = size.width - 2 * margen;
        double maxH = size.height - 2 * margen;

        double escalaW = maxW / Math.max(getAncho(), 1.0);
        double escalaH = maxH / Math.max(getAlto(), 1.0);
        double escala = Math.min(escalaW, escalaH);

        int w = (int) Math.round(getAncho() * escala);
        int h = (int) Math.round(getAlto() * escala);
        int x = (size.width - w) / 2;
        int y = (size.height - h) / 2;

        g.drawRect(x, y, w, h);
    }
}