/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumir.Resteasy;

import HomeClient.domain.model.Cuestionario;
import HomeClient.domain.model.Persona;
import com.google.gson.Gson;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class SPersona {
    public static void main(String[] args){
        Gson json = new Gson();
        PersonaCliente client = new PersonaCliente();
        System.out.println(client.getPersonas(ArrayList.class).toString());  
        ArrayList<Persona> list = new ArrayList();
//        ArrayList value = client.getPersonas(ArrayList.class); 
//        ArrayList value = client.getProfesores(ArrayList.class);
//       ArrayList value = prod.getPersonas(ArrayList.class);      
//         for(Object pro: value){
//             Persona p = json.fromJson(pro.toString(), Persona.class);
//             list.add(p); 
//         }
//         System.out.println(list);
        //Persona persona = new Curso(1, "octavo", 3,"", "octavo", "octavo");
//        client.addCurso(curso, Curso.class);
        client.close();
    }
}
