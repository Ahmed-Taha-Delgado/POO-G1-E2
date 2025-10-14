
public class Libro extends Material{
    
    public Libro(String titulo, String autor, int anio){
        setTitulo(titulo);
        setAutor(autor);
        setAnio(anio);
    }

    @Override
    public String mostrarInformacion(){
        return "Datos del libro: " +
            "\nTitulo: " + getTitulo() +
            "\nAutor: " + getAutor() +
            "\nAño: " + getAnio();
    }
}
