/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumir.Resteasy;

import HomeClient.domain.model.Materia;
import com.google.gson.Gson;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class SMateria {
  public static void main(String[] args){
        Gson json = new Gson();
        RestMateria client = new RestMateria();
        Materia materia = client.getMateria(Materia.class, "Guarani");
//        Curso curso = new Curso(1, "octavo", 3,"", "octavo", "octavo");
//        client.addCurso(curso, Curso.class);
//        System.out.println("Fue exitoso");
         System.out.println(materia);
        client.close();
    }  
}
