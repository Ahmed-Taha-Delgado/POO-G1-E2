public class Mensaje {

    public String mostrar(double distancia){
        if(distancia==0){
            return "El triangulo NO es equilatero";
        }else{
            return "El triangulo SI es equilatero" + "\ndistancia= " + distancia;
        }
    }


}
