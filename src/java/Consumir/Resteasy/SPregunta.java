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
        Gson json = new Gson();
//        Pregunta pregunta = new Pregunta();
        RestPregunta client = new RestPregunta();
//        Pregunta pregunta = client.getPregunta(Pregunta.class, "1");
//        System.out.println(pregunta);
//        System.out.println(pregunta.toString());
        ArrayList value = client.getPreguntasCuestionario(ArrayList.class, "1");
//        ArrayList value = client.getPreguntas(ArrayList.class);
        ArrayList<Pregunta> list = new ArrayList();
//        System.out.println(value);
        for(Object ob: value){     
            System.out.println(ob);
            Pregunta pregunta = json.fromJson(ob.toString(), Pregunta.class);
            list.add(pregunta);
            System.out.println(pregunta.getPregunta());
            System.out.println(pregunta.getArchivoimg2());
        }
//        Pregunta p = new Pregunta(1,14,400,300,"5000?","C:\\Users\\Matias\\Pictures\\Pictures\\Sample Pictures\\Desert.jpg", inputStream," ");
        //Object ob = p;
//        client.addPregunta(p, Pregunta.class);
//        System.out.println(list);
        client.close();
    }
}
