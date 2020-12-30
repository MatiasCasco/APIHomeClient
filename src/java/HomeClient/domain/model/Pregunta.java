/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HomeClient.domain.model;

import java.awt.Image;
import java.io.InputStream;
import java.util.Base64;

/**
 *
 * @author Matias
 */
public class Pregunta {

    private int idPregunta;
    private int idCuestionario;
    private int puntoAsignado;
    private int puntoObtenido;
    private String pregunta;
    private  String archivoimg;
    private byte[] archivoimg2;
   
    public Pregunta() {
    }
        
    public Pregunta(int idPregunta, int idCuestionario, int puntoAsignado, int puntoObtenido, String pregunta) {
        this.idPregunta = idPregunta;
        this.idCuestionario = idCuestionario;
        this.puntoAsignado = puntoAsignado;
        this.puntoObtenido = puntoObtenido;
        this.pregunta = pregunta;

    }
    
    public Pregunta(int idPregunta, int idCuestionario, int puntoAsignado, int puntoObtenido, String pregunta, String archivoimg2) {
        this.idPregunta = idPregunta;
        this.idCuestionario = idCuestionario;
        this.puntoAsignado = puntoAsignado;
        this.puntoObtenido = puntoObtenido;
        this.pregunta = pregunta;
        this.archivoimg2 = Base64.getDecoder().decode(archivoimg2);
    }

    public Pregunta(int idPregunta, int idCuestionario, int puntoAsignado, int puntoObtenido, String pregunta, String archivoimg, String archivoimg2) {
        this.idPregunta = idPregunta;
        this.idCuestionario = idCuestionario;
        this.puntoAsignado = puntoAsignado;
        this.puntoObtenido = puntoObtenido;
        this.pregunta = pregunta;
        this.archivoimg = archivoimg;
        this.archivoimg2 = Base64.getDecoder().decode(archivoimg2);
    }
 
    public String getArchivoimg() {
        return archivoimg;
    }

    public void setArchivoimg(String archivoimg) {
        this.archivoimg = archivoimg;
    }

    public byte[] getArchivoimg2() {
        return archivoimg2;
    }

    public void setArchivoimg2(byte[] archivoimg2) {
        this.archivoimg2 = archivoimg2;
    }
    
    public int getPuntoObtenido() {
        return puntoObtenido;
    }

    public void setPuntoObtenido(int puntoObtenidos) {
        this.puntoObtenido = puntoObtenidos;
    }
    
    public int getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(int idPregunta) {
        this.idPregunta = idPregunta;
    }

    public int getIdCuestionario() {
        return idCuestionario;
    }

    public void setIdCuestionario(int idCuestionario) {
        this.idCuestionario = idCuestionario;
    }

    public int getPuntoAsignado() {
        return puntoAsignado;
    }

    public void setPuntoAsignado(int puntoAsignado) {
        this.puntoAsignado = puntoAsignado;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    @Override
    public String toString() {
       // puntoAsignado=" + puntoAsignado + ", pregunta=" + pregunta + '}';
       return new StringBuilder("{idpregunta: ").append(idPregunta)
                .append(", idcuestionario: ").append(idCuestionario)
                .append(", puntoasignado: ").append(puntoAsignado)
                .append(", puntoobtenido:").append(puntoObtenido)
                .append(", pregunta: ").append(pregunta)
                .append(", archivoimg: ").append(archivoimg)
                .append(", archivoimg2: ").append(archivoimg2)
                .append("}").toString();
    }
    
    


}
