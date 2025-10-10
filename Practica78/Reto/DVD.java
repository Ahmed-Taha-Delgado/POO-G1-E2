public class DVD extends Material {
    
    public DVD(String titulo, String autor, int anio){
        setTitulo(titulo);
        setAutor(autor);
        setAnio(anio);
    }

    @Override
    public String mostrarInformacion(){
        return "Datos del DVD: " +
            "\nTitulo: " + getTitulo() +
            "\nAutor: " + getAutor() +
            "\nAño: " + getAnio();
    }
}
