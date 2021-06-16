/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumir.Resteasy;

import HomeClient.domain.model.Pregunta;
import com.google.gson.Gson;
import java.io.InputStream;
import java.util.ArrayList;

/*
 *
 * @author Matias
 */
public class SPregunta {
    public static void main(String[] args) {
        
//        Pregunta pregunta = new Pregunta();
        Gson json = new Gson();
        RestPregunta client = new RestPregunta();
        ArrayList value = client.getPreguntasCuestionario(ArrayList.class, "68");
        for(Object ob: value){     
            System.out.println(ob);
            Pregunta pregunta = json.fromJson(ob.toString(), Pregunta.class);
            System.out.println(pregunta.getPregunta());
        }
         client.close();
       //Gson json = new Gson();
            RestPregunta restPregunta = new RestPregunta();
            ArrayList<Pregunta> lista = new ArrayList();
            ArrayList values = restPregunta.getPreguntasCuestionario(ArrayList.class,"68");
            for(Object pro: values){
                Pregunta pregunta = json.fromJson(pro.toString(), Pregunta.class);
                lista.add(new Pregunta(pregunta.getIdPregunta(), pregunta.getIdCuestionario(), pregunta.getPuntoAsignado(), pregunta.getPuntoObtenido(), pregunta.getPregunta()));                   
            }
//        Pregunta pregunta = client.getPregunta(Pregunta.class, "1");
//        System.out.println(pregunta);
//        System.out.println(pregunta.toString());
       
//        ArrayList value = client.getPreguntas(ArrayList.class);
       // ArrayList<Pregunta> list = new ArrayList();
//        System.out.println(value);
        
            //list.add(pregunta);
            
            //System.out.println(pregunta.getArchivoimg2());
       
//        Pregunta p = new Pregunta(1,14,400,300,"5000?","C:\\Users\\Matias\\Pictures\\Pictures\\Sample Pictures\\Desert.jpg", inputStream," ");
        //Object ob = p;
//        client.addPregunta(p, Pregunta.class);
//        System.out.println(list);
       
    }
}
