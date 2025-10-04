import java.util.ArrayList;
import java.util.List;
import javax.swing.SwingUtilities;

public class MainApp {


    static boolean bandera1 = false, bandera2 = false, bandera3 = false;
    static int posicion = 0;
    static List<Double> listaValores = new ArrayList<>();
    static List<String> listaOperaciones = new ArrayList<>();

    public static void main(String[] args) {
        // Sin excepciones; SwingUtilities no requiere try/catch
        SwingUtilities.invokeLater(() -> {
            Vista view = new Vista("Calculadora");

            view.getBoton0().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("");
                    posicion = 0;
                    listaValores.clear();
                    listaOperaciones.clear();
                    bandera1 = false;
                    bandera2 = true;
                }

                view.getPantalla().setText(view.getPantalla().getText() + "0");
                bandera1 = true;
                bandera2 = false;
            });
            view.getBoton1().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("");
                    posicion = 0;
                    listaValores.clear();
                    listaOperaciones.clear();
                    bandera1 = false;
                    bandera2 = true;
                }

                view.getPantalla().setText(view.getPantalla().getText() + "1");
                bandera1 = true;
                bandera2 = false;
            });
            view.getBoton2().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("");
                    posicion = 0;
                    listaValores.clear();
                    listaOperaciones.clear();
                    bandera1 = false;
                    bandera2 = true;
                }
                view.getPantalla().setText(view.getPantalla().getText() + "2");
                bandera1 = true;
                bandera2 = false;
            });
            view.getBoton3().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("");
                    posicion = 0;
                    listaValores.clear();
                    listaOperaciones.clear();
                    bandera1 = false;
                    bandera2 = true;
                }
                view.getPantalla().setText(view.getPantalla().getText() + "3");
                bandera1 = true;
                bandera2 = false;
            });
            view.getBoton4().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("");
                    posicion = 0;
                    listaValores.clear();
                    listaOperaciones.clear();
                    bandera1 = false;
                    bandera2 = true;
                }

                view.getPantalla().setText(view.getPantalla().getText() + "4");
                bandera1 = true;
                bandera2 = false;
            });
            view.getBoton5().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("");
                    posicion = 0;
                    listaValores.clear();
                    listaOperaciones.clear();
                    bandera1 = false;
                    bandera2 = true;
                }

                view.getPantalla().setText(view.getPantalla().getText() + "5");
                bandera1 = true;
                bandera2 = false;
            });
            view.getBoton6().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("");
                    posicion = 0;
                    listaValores.clear();
                    listaOperaciones.clear();
                    bandera1 = false;
                    bandera2 = true;
                }

                view.getPantalla().setText(view.getPantalla().getText() + "6");
                bandera1 = true;
                bandera2 = false;
            });
            view.getBoton7().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("");
                    posicion = 0;
                    listaValores.clear();
                    listaOperaciones.clear();
                    bandera1 = false;
                    bandera2 = true;
                }

                view.getPantalla().setText(view.getPantalla().getText() + "7");
                bandera1 = true;
                bandera2 = false;
            });
            view.getBoton8().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("");
                    posicion = 0;
                    listaValores.clear();
                    listaOperaciones.clear();
                    bandera1 = false;
                    bandera2 = true;
                }

                view.getPantalla().setText(view.getPantalla().getText() + "8");
                bandera1 = true;
                bandera2 = false;
            });
            view.getBoton9().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("");
                    posicion = 0;
                    listaValores.clear();
                    listaOperaciones.clear();
                    bandera1 = false;
                    bandera2 = true;
                }

                view.getPantalla().setText(view.getPantalla().getText() + "9");
                bandera1 = true;
                bandera2 = false;

            });
            view.getBotonMas().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("Operacion invalida");
                    bandera3 = true;
                    return;
                }


                if(!bandera1)
                    bandera2 = true;
                else{
                    bandera1 = false;
                    String operacion = view.getPantalla().getText();
                    listaValores.add(Double.parseDouble(operacion.substring(posicion, operacion.length())));
                    posicion = operacion.length() + 1;
                    
                    listaOperaciones.add("+");
                }
                view.getPantalla().setText(view.getPantalla().getText() + "+");
                
            });
            view.getBotonMenos().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    bandera2 = false;
                    view.getPantalla().setText(view.getPantalla().getText() + "-");
                    return;
                }

                if (bandera1) {
                    bandera1 = false;
                    String operacion = view.getPantalla().getText();
                    double numero = Double.parseDouble(operacion.substring(posicion, operacion.length()));
                    listaValores.add(numero);
                    listaOperaciones.add("-");
                    posicion = operacion.length() + 1;
                    bandera2 = false;
                }

                view.getPantalla().setText(view.getPantalla().getText() + "-");
                bandera2 = false;
                
            });
            view.getBotonPor().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("Operacion invalida");
                    bandera3 = true;
                    return;
                }

                if(!bandera1)
                    bandera2 = true;
                else{
                    bandera1 = false;
                    String operacion = view.getPantalla().getText();
                    listaValores.add(Double.parseDouble(operacion.substring(posicion, operacion.length())));
                    posicion = operacion.length() + 1;   
                    
                    listaOperaciones.add("*");
                }
                view.getPantalla().setText(view.getPantalla().getText() + "x");
                
            });
            view.getBotonEntre().addActionListener(e -> {
                
                if(bandera3){
                    view.getPantalla().setText("");
                    bandera3 = false;
                }

                if(bandera2){
                    view.getPantalla().setText("Operacion invalida");
                    bandera3 = true;
                    return;
                }

                if(!bandera1)
                    bandera2 = true;
                else{
                    bandera1 = false;
                    String operacion = view.getPantalla().getText();
                    listaValores.add(Double.parseDouble(operacion.substring(posicion, operacion.length())));
                    posicion = operacion.length() + 1;
                    listaOperaciones.add("/");
                }
                
                view.getPantalla().setText(view.getPantalla().getText() + "/");
            });

            view.getBotonIgual().addActionListener(e -> {
                
                if(bandera2){
                    view.getPantalla().setText("Operacion invalida");
                    bandera3 = true;
                    posicion = 0;
                    listaValores.clear();
                    listaOperaciones.clear();
                
                    return;
                }

                if(!bandera1)
                    bandera2 = true;
                else{
                    bandera1 = false;
                    String operacion = view.getPantalla().getText();
                    listaValores.add(Double.parseDouble(operacion.substring(posicion, operacion.length())));
                }
                
                if(listaOperaciones.size()>=listaValores.size()){
                    view.getPantalla().setText("Operacion invalida");
                    bandera3 = true;
                    posicion = 0;
                    listaValores.clear();
                    listaOperaciones.clear();
                
                    return;
                }
                

                for(int i=0; i<listaOperaciones.size(); i++){
                    String op = listaOperaciones.get(i);
                    if(op.equals("*") || op.equals("/")){
                        double a = listaValores.get(i);
                        double b = listaValores.get(i+1);
                        double res = op.equals("*") ? a*b : a/b;
                        listaValores.set(i, res);
                        listaValores.remove(i+1);
                        listaOperaciones.remove(i);
                        i--;
                    }
                }

                
                double resultado = listaValores.get(0);
                for(int i = 0; i < listaOperaciones.size(); i++){
                    String op = listaOperaciones.get(i);
                    if(op.equals("+"))
                        resultado += listaValores.get(i+1);
                    else
                        resultado -= listaValores.get(i+1);
                }

                String r = String.valueOf(resultado);
                view.getPantalla().setText(r);
                resultado = 0;
                
                
                bandera3 = true;
                posicion = 0;
                listaValores.clear();
                listaOperaciones.clear();
                bandera1 = false;
                bandera2 = true;
                
            });

            view.getBotonBorrar().addActionListener(e ->{

                view.getPantalla().setText("");
                posicion = 0;
                listaValores.clear();
                listaOperaciones.clear();

            });
            

            
            view.setVisible(true);
        });

    



    }
}