/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HomeClient.domain.model;

/**
 *
 * @author User
 */
public class Reporte {
    private int n;
    private String nombre;
    private int tp;
    private int pl;

    public Reporte() {
    }

    public Reporte(int n, String nombre, int tp, int pl) {
        this.n = n;
        this.nombre = nombre;
        this.tp = tp;
        this.pl = pl;
    }

    public int getN() {
        return n;
    }

    public void setN(int n) {
        this.n = n;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTp() {
        return tp;
    }

    public void setTp(int tp) {
        this.tp = tp;
    }

    public int getPl() {
        return pl;
    }

    public void setPl(int pl) {
        this.pl = pl;
    }
    
    @Override
    public String toString() {
        //return "Curso{" + "idProfesr=" + idProfesr + ", claveProfesor=" + claveProfesor + ", claveAlumno=" + claveAlumno + '}';
        return new StringBuilder("{n: ").append(n)
                .append(", nombre: ").append(nombre)
                .append(", Total de puntos: ").append(tp)
                .append(", Puntos logrados: ").append(pl)
                .append("}").toString();                
    }
}
