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
        ArrayList<Persona> list = new ArrayList();
        ArrayList value = client.getProfesores(ArrayList.class);
       
           for( Object ob: value){     
            System.out.println(ob.toString());
        }
        
        client.close();
    }
}
