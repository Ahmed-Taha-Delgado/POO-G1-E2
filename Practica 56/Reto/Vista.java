import java.awt.*;
import javax.swing.*;

public class Vista extends JFrame{
    // Componentes encapsulados
    private final JTextField pantalla;
    private final JButton boton1;
    private final JButton boton2;
    private final JButton boton3;
    private final JButton boton4;
    private final JButton boton5;
    private final JButton boton6;
    private final JButton boton7;
    private final JButton boton8;
    private final JButton boton9;
    private final JButton boton0;
    private final JButton botonMas;
    private final JButton botonMenos;
    private final JButton botonPor;
    private final JButton botonEntre;
    private final JButton botonIgual;
    private final JButton botonBorrar;

    public Vista(String titulo) {
        super(titulo);// Esto es de herencia

        pantalla = new JTextField();
        boton1 = new JButton("1");
        boton2 = new JButton("2");
        boton3 = new JButton("3");
        boton4 = new JButton("4");
        boton5 = new JButton("5");
        boton6 = new JButton("6");
        boton7 = new JButton("7");
        boton8 = new JButton("8");
        boton9 = new JButton("9");
        boton0 = new JButton("0");
        botonMas = new JButton("+");
        botonMenos = new JButton("-");
        botonPor = new JButton("x");
        botonEntre = new JButton("/");
        botonIgual = new JButton("=");
        botonBorrar = new JButton("Borrar");

        pantalla.setEditable(false);
        pantalla.setPreferredSize(new Dimension(600, 100));
        pantalla.setFont(new Font("Arial", Font.PLAIN, 24));

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setPreferredSize(new Dimension(600, 500));
        setLayout(new BorderLayout(10, 10));

        JPanel acciones = new JPanel(new GridLayout(4, 4, 8, 8));
        acciones.add(boton1);
        acciones.add(boton2);
        acciones.add(boton3);
        acciones.add(botonEntre);
        acciones.add(boton4);
        acciones.add(boton5);
        acciones.add(boton6);
        acciones.add(botonPor);
        acciones.add(boton7);
        acciones.add(boton8);
        acciones.add(boton9);
        acciones.add(botonMas);
        acciones.add(botonBorrar);
        acciones.add(boton0);
        acciones.add(botonIgual);
        acciones.add(botonMenos);


        acciones.setPreferredSize(new Dimension(600, 120));
        
        JPanel top = new JPanel(new BorderLayout(8, 8));
        top.add(pantalla, BorderLayout.NORTH);
        top.add(acciones, BorderLayout.CENTER);

        add(top, BorderLayout.CENTER);
        

        pack();
        setLocationRelativeTo(null);
    }

    // Getters para que la lógica de la app manipule la UI sin exponer campos
    public JButton getBoton0() { return boton0; }
    public JButton getBoton1() { return boton1; }
    public JButton getBoton2() { return boton2; }
    public JButton getBoton3() { return boton3; }
    public JButton getBoton4() { return boton4; }
    public JButton getBoton5() { return boton5; }
    public JButton getBoton6() { return boton6; }
    public JButton getBoton7() { return boton7; }
    public JButton getBoton8() { return boton8; }
    public JButton getBoton9() { return boton9; }
    public JButton getBotonIgual() { return botonIgual; }
    public JButton getBotonMas() { return botonMas; }
    public JButton getBotonMenos() { return botonMenos; }
    public JButton getBotonEntre() { return botonEntre; }
    public JButton getBotonPor() { return botonPor; }
    public JButton getBotonBorrar() { return botonBorrar; }
    public JTextField getPantalla() { return pantalla; }

}