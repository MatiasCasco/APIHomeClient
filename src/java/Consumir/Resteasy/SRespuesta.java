/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumir.Resteasy;

import HomeClient.domain.model.Respuesta;
import com.google.gson.Gson;
import java.util.ArrayList;

/**
 *
 * @author Matias
 */
public class SRespuesta {
    public static void main(String[] args){
        Gson json = new Gson();
        RestRespuesta client = new RestRespuesta();
//        ArrayList value = client.getRespuestaPregunta(ArrayList.class, "1");
//        ArrayList<Respuesta> list = new ArrayList();
////        System.out.println(value);
//        for(Object ob: value){     
//            System.out.println(ob);
//            Respuesta respuesta = json.fromJson(ob.toString(), Respuesta.class);
//            list.add(respuesta);
//        }
        Respuesta respuesta =  new Respuesta(1, 1, "Uno", true);
        client.addRespuesta(respuesta, Respuesta.class);
        System.out.println("Fue exitoso");
        //System.out.println(list);
        client.close();
    }
}
