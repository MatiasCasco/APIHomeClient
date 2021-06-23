/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumir.Resteasy;

import HomeClient.domain.model.Curso;
import com.google.gson.Gson;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class SCurso {
    public static void main(String[] args){
        //Gson json = new Gson();
        //RestCurso client = new RestCurso();
        //ArrayList value = client.getCursos(ArrayList.class);
//        Curso curso = new Curso(1, "octavo", 3,"", "octavo", "octavo");
//        client.addCurso(curso, Curso.class);
//        System.out.println("Fue exitoso");
        //Curso nombre=client.getCurso(Curso.class, "1");
          /*RestCurso restCurso = new RestCurso();
            ArrayList<Curso> lista = new ArrayList();
            ArrayList valueC = restCurso.getCursos(ArrayList.class);
            for(Object pro: valueC){
                Curso cursos = json.fromJson(pro.toString(), Curso.class);
                lista.add(cursos);                   
            }
         System.out.println(lista);*/
        //System.out.println(nombre.getNombre());
        //client.close();
        Gson json = new Gson();
        RestCurso restC = new RestCurso();
        Curso curso = new Curso();
         ArrayList value = restC.CursosfindIdProf(ArrayList.class, "1");
        ArrayList<Curso> list = new ArrayList();
        for(Object pro: value){
            curso = json.fromJson(pro.toString(), Curso.class);
            System.out.println(curso.toString());
            list.add(curso);
        }
        
        
        restC.close();
    }
}
