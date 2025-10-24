package mx.unam.fi.poo.py2;

public class EmpleadoAsalariado extends Empleado {
    
    private double salarioSemanal;

    public EmpleadoAsalariado (String nombre, String apellido, String seguroSocial, double salarioSemanal){
        super(nombre, apellido, seguroSocial);
        setSalarioSemanal(salarioSemanal);
    }

    public void setSalarioSemanal(double salarioSemanal){
        if (salarioSemanal < 0){
            System.out.println("No se permiten salarios negativos.");
            this.salarioSemanal = 0.00;
        } else {
            this.salarioSemanal = salarioSemanal;
        }
    }

    public double getSalarioSemanal(){
        return salarioSemanal;
    }

    @Override
    public String toString(){
        return super.toString() + "\nSalario semanal: " + getSalarioSemanal();
    }
    
    @Override
    public double ingresos(){
        return getSalarioSemanal() * 4;
    }
}