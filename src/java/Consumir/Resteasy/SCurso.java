/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumir.Resteasy;

import HomeClient.domain.model.Curso;
import com.google.gson.Gson;

/**
 *
 * @author User
 */
public class SCurso {
    public static void main(String[] args){
        Gson json = new Gson();
        RestCurso client = new RestCurso();
        Curso curso = new Curso(1, "octavo", 3,"", "octavo", "octavo");
        client.addCurso(curso, Curso.class);
        System.out.println("Fue exitoso");
        client.close();
    }
}
