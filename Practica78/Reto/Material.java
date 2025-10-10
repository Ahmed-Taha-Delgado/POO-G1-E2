public abstract class Material {
    
    private String titulo, autor;
    private int anio;

    public void setTitulo(String titulo){ this.titulo = titulo; }
    public void setAutor(String autor){ this.autor = autor; }
    public void setAnio(int anio){ this.anio = anio;}
    public String getTitulo(){ return titulo; }
    public String getAutor(){ return autor; }
    public int getAnio(){ return anio; }

    public abstract String mostrarInformacion();

}
