package mx.unam.fi.poo.py2;
public abstract class Empleado {
    private String nombre, apellido, seguroSocial;

    public Empleado(String nombre, String apellido, String seguroSocial){
        setNombre(nombre);
        setApellido(apellido);
        setSeguroSocial(seguroSocial);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getSeguroSocial() {
        return seguroSocial;
    }

    public void setSeguroSocial(String seguroSocial) {
        this.seguroSocial = seguroSocial;
    }

    public abstract double ingresos();
    
    @Override
    public String toString() {
        return "Empleado Nombre= " + nombre + ", Apellido= " + apellido + ", SeguroSocial= " + seguroSocial + "";
    }
}