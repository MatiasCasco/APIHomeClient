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
public class Curso {
    private int idCurso;
    private String nombre;
    private int idProfesor;
    private String claveProfesor;
    private String claveAlumno;

    public Curso() {
    }

    public Curso(int idCurso, String nombre, int idProfesor, String claveProfesor, String claveAlumno) {
        this.idCurso = idCurso;
        this.nombre = nombre;
        this.idProfesor = idProfesor;
        this.claveProfesor = claveProfesor;
        this.claveAlumno = claveAlumno;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdProfesor() {
        return idProfesor;
    }

    public void setIdProfesor(int idProfesor) {
        this.idProfesor = idProfesor;
    }

    public String getClaveProfesor() {
        return claveProfesor;
    }

    public void setClaveProfesor(String claveProfesor) {
        this.claveProfesor = claveProfesor;
    }

    public String getClaveAlumno() {
        return claveAlumno;
    }

    public void setClaveAlumno(String claveAlumno) {
        this.claveAlumno = claveAlumno;
    }
    
    @Override
    public String toString() {
        //return "Curso{" + "idProfesr=" + idProfesr + ", claveProfesor=" + claveProfesor + ", claveAlumno=" + claveAlumno + '}';
        return new StringBuilder("{idcurso: ").append(idCurso)
                .append(", idprofesor: ").append(idProfesor)
                .append(", nombrecurso: ").append(nombre)
                .append(", claveprofesor: ").append(claveProfesor)
                .append(", clavealumno: ").append(claveAlumno)
                .append("}").toString();
                
    }
}
