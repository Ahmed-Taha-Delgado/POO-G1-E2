import javax.swing.*;
import java.awt.event.*;

public class Ventana extends JFrame {
    JButton boton;
    Punto punto1, punto2, punto3;
    Mensaje mostrar;

    public Ventana(){
         JOptionPane.showMessageDialog(null, "Ingrese los puntos de los vertices del triangulo \n (x1, y1), (x2, y2), (x3, y3)");
    }
    
    public Ventana(Punto punto1, Punto punto2, Punto punto3, Mensaje mostrar) {
        this.punto1 = punto1;
        this.punto2 = punto2;
        this.punto3 = punto3;

        setTitle("Ejemplo");
        setSize(300, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        boton = new JButton("Haz clic aqui");
        boton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                
                TrianguloEq triang = new TrianguloEq();

                double equilatero = triang.triangulo(punto1, punto2, punto3);
                String cadena = mostrar.mostrar(equilatero);
                JOptionPane.showMessageDialog(null, cadena);
            }
        });

        add(boton);
    }
}