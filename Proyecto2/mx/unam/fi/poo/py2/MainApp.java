package mx.unam.fi.poo.py2;
public class MainApp {
    public static void main(String[] args) {
        Empleado emp;

        emp = new EmpleadoPorComision("Ahmed", "Taha", "12006090310", 0.8, 6000);
        System.out.println(emp);
        System.out.println("Ingreso semanal: $"+emp.ingresos()+"\n");

        emp = new EmpleadoAsalariado("Maximo", "Meraz", "32743900231", 20000.00);
        System.out.println(emp);
        System.out.println("Ingreso mensual: $"+emp.ingresos()+"\n");

        emp = new EmpleadoPorComision("Edgar", "Santos", "14598026583", 0.9, 6000);
        System.out.println(emp);
        System.out.println("Ingreso semanal: $"+emp.ingresos()+"\n");

        emp = new EmpleadoAsalariado("Gabo", "Velazquez", "54679801275", 50000.00);
        System.out.println(emp);
        System.out.println("Ingreso mensual: $"+emp.ingresos()+"\n");

        emp = new EmpleadoPorComision("Alexis", "Sanchez", "3456980124", 0.8, 3000);
        System.out.println(emp);
        System.out.println("Ingreso semanal: $"+emp.ingresos()+"\n");
    }
}