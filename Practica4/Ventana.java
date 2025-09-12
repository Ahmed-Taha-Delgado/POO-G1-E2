import javax.swing.*;
import java.awt.event.*;

public class Ventana extends JFrame {
    JButton boton;
    
    public Ventana(){
        JOptionPane.showMessageDialog(null, "Ingre las coordenadas x1 y1 x2 y2");
    }

    public Ventana(Punto a, Punto b, Mensajes mostrar) {

        setTitle("Practica4");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        boton = new JButton("Haz clic aqui");
        boton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String texto = mostrar.mensaje(a, b);
                JOptionPane.showMessageDialog(null, texto);
            }
        });

        add(boton);
    }
}