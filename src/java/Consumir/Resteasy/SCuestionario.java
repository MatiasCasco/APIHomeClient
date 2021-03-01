/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumir.Resteasy;

import HomeClient.domain.model.Cuestionario;
import com.google.gson.Gson;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class SCuestionario {
    public static void main(String[] args){
        Gson json = new Gson();
        RestCuestionario client = new RestCuestionario();
        ArrayList<Cuestionario> list = new ArrayList();
//        ArrayList value = client.getCuestionarios(ArrayList.class);
        client.addCuestionario("{idcuestionario: 1, idmateria: 2, nombremateria: Matematica,fechacierre: 2020-11-19, fechainicio: 2020-09-27, puntos: 100, tiempolimite:02:00:00, idcurso:7, nombrecurso: quinto}", Cuestionario.class);
//        ArrayList value = client.getCuestionariosOfMateria(ArrayList.class, "Matematica");
//        for(Object ob: value){     
//            System.out.println(ob.toString());
//            Cuestionario cuestionario = json.fromJson(ob.toString(), Cuestionario.class);
//            list.add(cuestionario);
////            System.out.println(cuestionario.getTiempoLimite());
//        }
        System.out.println(list);
        
        client.close();
    }
}
