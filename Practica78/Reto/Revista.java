public class Revista extends Material{
    
    public Revista(String titulo, String autor, int anio){
        setTitulo(titulo);
        setAutor(autor);
        setAnio(anio);
    }

    @Override
    public String mostrarInformacion(){
        return "Datos de la revista: " +
            "\nTitulo: " + getTitulo() +
            "\nAutor: " + getAutor() +
            "\nAño: " + getAnio();
    }

}
