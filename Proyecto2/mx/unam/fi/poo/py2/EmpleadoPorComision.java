package mx.unam.fi.poo.py2;
public class EmpleadoPorComision extends Empleado {
    
    private double tarifa, ventas;

    public EmpleadoPorComision(String nombre, String apellido, String seguroSocial, double tarifa, double ventas){
        super(nombre, apellido, seguroSocial);
        setTarifa(tarifa);
        setVentas(ventas);
    }

    public void setTarifa(double tarifa){
        if(tarifa > 0.0 && tarifa<1.0)
            this.tarifa = tarifa;
        else   
            System.out.println("Ingresa un rango adecuado de numeros");
    }
    public void setVentas(double ventas){
        if(ventas > 0.0)
            this.ventas = ventas;
        else
            System.out.println("No puede haber valores negativos");
    }
    public double getTarifa(){
        return tarifa;
    }
    public double getVentas(){
        return ventas;
    } 
    
    @Override
    public String toString(){
        return super.toString()+ "\nTarifa por comision: "+ getTarifa()+"\nVentas netas: "+ getVentas();
    }
    
    @Override
    public double ingresos(){
        return getTarifa() * getVentas();
    }
}