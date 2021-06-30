/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumir.Resteasy;

import HomeClient.domain.model.Cuestionario;
import HomeClient.domain.model.Persona;
import HomeClient.domain.model.resumenEstructura;
import HomeClient.domain.model.resumenSemestre;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author User
 */
public class SPersona {
    public static void main(String[] args){
       /* Gson json = new Gson();
        PersonaCliente client = new PersonaCliente();
        ArrayList<Persona> list = new ArrayList();
        ArrayList value = client.getProfesores(ArrayList.class);
       
           for( Object ob: value){     
            System.out.println(ob.toString());
        }
        
        client.close();*/
         int semestre = 2;
            int idCurso = 1;
            int inicio = 0;
            int cierre = 0;
            int posicion = 0;
            String name = " ";
            List<String> s1 = Arrays.asList("'ENE'","'FEB'","'MAR'","'ABR'","'MAY'","'JUN'");
            List<String> s2 = Arrays.asList("'JUL'","'AGO'","'SET'","'OCT'","'NOV'","'DIC'");
            List categoria = null;
            int temp[] = {0,0,0,0,0,0};
            List<Integer> prueba = Arrays.asList(0,0,0,0,0,0);
            if(semestre == 1) {
                inicio = 1;
                cierre = 6;
                categoria = s1;
            } else {
                inicio = 7;
                cierre = 12;
                categoria = s2;
            }
            Gson json = new Gson();
            RestCurso restC = new RestCurso();
            resumenSemestre resumenS = new resumenSemestre();
            ArrayList value = restC.getResumenCurso(ArrayList.class, String.valueOf(idCurso), String.valueOf(inicio), String.valueOf(cierre));
            ArrayList<resumenSemestre> list = new ArrayList();
            ArrayList<resumenEstructura> serie = new ArrayList();
            for(Object pro: value){
                resumenS = json.fromJson(pro.toString(), resumenSemestre.class);
                list.add(resumenS);
            }
            name = list.get(0).getMateria();
            for(int a=0;a<list.size();a++){
                if(name.equalsIgnoreCase(list.get(a).getMateria()) == true){
                    if(semestre ==1){
                        prueba.set(list.get(a).getMes()-1, list.get(a).getPromedio());
                    }
                    if(semestre == 2){
                        prueba.set(list.get(a).getMes()-7, list.get(a).getPromedio());
                    }
                } else {
                    name = "'"+name+"'";
                    serie.add(new resumenEstructura("'column'",name,prueba));
                    name = list.get(a).getMateria();
                    prueba = Arrays.asList(0,0,0,0,0,0);
                    if(semestre ==1){
                        prueba.set(list.get(a).getMes()-1, list.get(a).getPromedio());
                    }
                    if(semestre == 2){
                        prueba.set(list.get(a).getMes()-7, list.get(a).getPromedio());
                    }
                }
                if(a == list.size()-1){
                    name = "'"+name+"'";
                    serie.add(new resumenEstructura("'column'",name,prueba));
                }
            } 
    }
}
