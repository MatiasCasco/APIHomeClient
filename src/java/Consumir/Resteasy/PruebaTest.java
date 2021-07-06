/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumir.Resteasy;

import HomeClient.domain.model.Curso;
import HomeClient.domain.model.Test;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class PruebaTest {
    
    public static void main(String[] args){
     String idCuestionario,idAlumno;
     idCuestionario="73";
     idAlumno="52";
     ArrayList<Test> list = new ArrayList();
     ArrayList<Test> cuestionario = obtenerPreguntas(idCuestionario);
     ArrayList<Test> respuestas= obtenerRespuestas(idCuestionario,idAlumno);
     ArrayList<Test> unido = unirRespuestas(cuestionario,respuestas);
      //imprimirunido(unido);
      String Correctas="\"";
        System.out.println(Correctas.length());
     
    }
    
    private static ArrayList<Test> obtenerPreguntas(String idCuestionario) {
        
        Gson json = new Gson();
        RestTest restT=new RestTest();
        Test test;
        ArrayList value= restT.getWebTest(ArrayList.class, idCuestionario);
        ArrayList<Test> list = new ArrayList();
        for(Object pro: value){
            test = json.fromJson(pro.toString(), Test.class);
            list.add(test);
        }
        
        restT.close();
        return list;
    
    }

    private static ArrayList<Test> obtenerRespuestas(String idCuestionario, String idAlumno) {
      Gson json = new Gson();
        RestTest restT=new RestTest();
        Test test;
        ArrayList value= restT.getTestRecover(ArrayList.class, idCuestionario,idAlumno);
        ArrayList<Test> list = new ArrayList();
        for(Object pro: value){
            test = json.fromJson(pro.toString(), Test.class);
            list.add(test);
        }
        restT.close();
        return list;
    }

    private static ArrayList<Test> unirRespuestas(ArrayList<Test> list, ArrayList<Test> listRespuestas) {
        Test respuesta;
        int index=0;
        for (Test pregunta : list) {
            List<Integer>  marcadas =new ArrayList();
            respuesta=listRespuestas.get(index);
            for (int i = 0; i < pregunta.getOptions().size(); i++) {
                
                if (respuesta.getListidR().contains(pregunta.getListidR().get(i))) {
                    marcadas.add(i);  
                }
            }
            pregunta.setPuntoobtenido(respuesta.getPuntoobtenido());
            pregunta.setMarcadas(marcadas);
            index=index+1;
        }
        return list;
    }

    /* ArrayList<Test> a =(ArrayList<Test>) request.getAttribute("lista");
                                                Test t = a.get(i);
                                                int correcta=t.getAnswer().get(0);
                                                options = t.getOptions();
                                                i=i+1;*/
    private static void imprimirunido(ArrayList<Test> unido) {
        List<String> options;
         int i=0;
        for (Test dato:unido) {
            Test t = unido.get(i);
            System.out.println(dato.getQuestion()); 
            options = dato.getOptions();
            i=i+1;
            int s=0;
            String Correctas="\"";
            for(String r : options){
                if(t.getMarcadas().contains(s) ){
                    System.out.print(s+")"+r+" (marcada)");
                    if(t.getAnswer().contains(s) ){
                        System.out.println("----------Corecta");
                    }else{
                     System.out.println("----------incorecta");   
                    }                                      
                }else{
                    System.out.println(s+")"+r+"----");
                }
                if(t.getAnswer().contains(s) ){	
                    Correctas=Correctas+r+"\", ";
                }                                                            
                s=s+1;
            }
            System.out.println("Correctas:"+Correctas);
            System.out.println("Total de Puntos"+dato.getAssignedscore()+" Obtenido: "+dato.getPuntoobtenido()); 
                                                   
            }
                                                    
    
    
    }

}
