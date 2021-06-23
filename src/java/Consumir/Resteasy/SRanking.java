/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Consumir.Resteasy;

import HomeClient.domain.model.Curso;
import HomeClient.domain.model.Ranking;
import HomeClient.domain.model.Test;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author User
 */
public class SRanking {
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
       /* Gson json = new Gson();
        RestCurso restC = new RestCurso();
        Curso curso = new Curso();
         ArrayList value = restC.CursosfindIdProf(ArrayList.class, "1");
        ArrayList<Curso> list = new ArrayList();
        for(Object pro: value){
            curso = json.fromJson(pro.toString(), Curso.class);
            System.out.println(curso.toString());
            list.add(curso);
        }
        
        
        restC.close();*/
       /* String idMateria,idCurso,materia;
        idMateria="22";
        //materia=request.getParameter("Materia");
        idCurso="1";
        Gson json = new Gson();
        RestPuntuaciones restP= new RestPuntuaciones();
        Ranking r= new Ranking();
        ArrayList value= restP.getRankingGlobalById(ArrayList.class, idCurso, idMateria);
        ArrayList<Ranking> list = new ArrayList();
        for(Object pro: value){
            r = json.fromJson(pro.toString(), Ranking.class);
            System.out.println(r.toString());
            System.out.println((r.getPuntosObtenido()*100)/r.getPuntosMateria());
            list.add(r);
        }
        
        //request.setAttribute("lista", list);
        //request.setAttribute("materia",materia);
        
        restP.close();*/
        /*******************************/
        String idCuestionario="89";
        Gson json = new Gson();
        RestTest restT=new RestTest();
        Test test;
        ArrayList<Test> list = new ArrayList();
        ArrayList<Test> listR = new ArrayList();
        
        //recuperamos cuestionario
        ArrayList value= restT.getWebTest(ArrayList.class, idCuestionario);
      
        for(Object pro: value){           
            try{
                 test = json.fromJson(pro.toString(), Test.class);
                     list.add(test);
            }catch (Exception e){
                System.out.println("error en "+pro.toString());
            }          
            //System.out.println(pro);
        }
   
        //recuperamos el respuestas
          value= restT.getTestRecover(ArrayList.class, idCuestionario,"39");
          for(Object pro: value){
           
            try{
                 test = json.fromJson(pro.toString(), Test.class);
                     listR.add(test);
            }catch (Exception e){
                System.out.println("error en "+pro.toString());
            }
           //System.out.println(pro);
        }
        
        restT.close();
        
       /* int index=0;
        Test respuesta;
        //List<Integer>  marcadas =new ArrayList();
        for (Test pregunta : list) {
            List<Integer>  marcadas =new ArrayList();
            respuesta=listR.get(index);
            System.out.println("Pregunta:"+pregunta.getQuestion());
            for (int i = 0; i < pregunta.getOptions().size(); i++) {
                if (pregunta.getAnswer().contains(i)) {
                    System.out.println("**"+pregunta.getOptions().get(i)+" (correcta)");
                }else{
                    System.out.println("**"+pregunta.getOptions().get(i));
                }
                if (respuesta.getListidR().contains(pregunta.getListidR().get(i))) {
                    marcadas.add(i);
                        System.out.println("marco este");
                    }
               
            }
             System.out.println("respuesta obtenido: "+pregunta.getPuntoobtenido());
             pregunta.setPuntoobtenido(respuesta.getPuntoobtenido());
            
              pregunta.setMarcadas(marcadas);
            index=index+1;
            
        }
       */
         Test respuesta;
        int index=0;
        for (Test pregunta : list) {
            List<Integer>  marcadas =new ArrayList();
            respuesta=listR.get(index);
            for (int i = 0; i < pregunta.getOptions().size(); i++) {
                
                if (respuesta.getListidR().contains(pregunta.getListidR().get(i))) {
                    marcadas.add(i);  
                }
            }
            pregunta.setPuntoobtenido(respuesta.getPuntoobtenido());
            pregunta.setMarcadas(marcadas);
            index=index+1;
        }
        
        
         /****/
        System.out.println("ahora:-----------------------------------------");
        for (Test pregunta : list) {
          
            System.out.println("Pregunta:"+pregunta.getQuestion()+pregunta.getId());
            
            for (int i = 0; i < pregunta.getOptions().size(); i++) {
                if (pregunta.getAnswer().contains(i)) {
                    System.out.println("**"+pregunta.getOptions().get(i)+" idPregunta: "+pregunta.getListidR().get(i)+" (correcta)");
                }else{
                    System.out.print("**"+pregunta.getOptions().get(i)+pregunta.getListidR().get(i) );
                }
                if (pregunta.getMarcadas().contains(i)) {
                        System.out.println("marco este");
                }
             
            }
             System.out.println("punto asignado:"+pregunta.getAssignedscore());
             System.out.println("punto obtenido:"+pregunta.getPuntoobtenido());
              //pregunta.setMarcadas(marcadas);
            //index=index+1;
             //para modificar necesito id alumno + idpregunta
            
        }
        
    }
}
