/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HomeClient.domain.servlets;

import Consumir.Resteasy.RestCuestionario;
import Consumir.Resteasy.RestMateria;
import Consumir.Resteasy.RestPuntuaciones;
import Consumir.Resteasy.RestTest;
import HomeClient.domain.model.Cuestionario;
import HomeClient.domain.model.Materia;
import HomeClient.domain.model.Ranking;

import HomeClient.domain.model.Test;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class ControllerRanking extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        this.doPost(request,response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String accion = request.getParameter("accion");
        String idC = request.getParameter("idC");
        request.setAttribute("idC", idC);
        
        switch (accion){
            case "mostrarMaterias":
                this.mostrarMaterias(request,response);
                break;

            case "verMenu":
                this.mostrarMaterias(request,response);
                break;
             case "RankingGlobal":
                this.rankingGlobalMateria(
                        request,response);
                break;
             case "MostrarCuestionarios":
                this.mostrarCuestionario(request, response);
                break;
             case "RankingCuestionario":
                 this.rankingPorCuestionario(request, response);
                 break;
             case "verRespuesta":
                 this.verRespuesta(request, response);
                 break;
             case "modificarPuntoRespuesta":
                 this.modificarPuntoRespuesta(request, response);
                 break;
                 
            default:
                this.mostrarMaterias(request,response);
                break;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void mostrarMaterias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestMateria restM = new RestMateria();
        Materia materia = new Materia();
        String idCurso=(String) request.getAttribute("idC");
       
        ArrayList value = restM.getMateriasForIdCurso(ArrayList.class,idCurso);
        ArrayList<Materia> list = new ArrayList();
        for(Object pro: value){
            materia = json.fromJson(pro.toString(), Materia.class);
            list.add(materia);
        }
        
        request.setAttribute("lista", list);
         restM.close();
        request.getRequestDispatcher("menuRanking.jsp").forward(request, response);
    }
    private void rankingGlobalMateria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idMateria,idCurso,materia;
        idMateria=request.getParameter("idMateria");
        materia=request.getParameter("Materia");
        idCurso=request.getParameter("idCurso");
        Gson json = new Gson();
        RestPuntuaciones restP= new RestPuntuaciones();
        Ranking r= new Ranking();
        ArrayList value= restP.getRankingGlobalById(ArrayList.class, idCurso, idMateria);
        ArrayList<Ranking> list = new ArrayList();
        int posicion=1;
        int porcentaje;
        for(Object pro: value){
            r = json.fromJson(pro.toString(), Ranking.class);
            //String nombre=""+posicion+" "+r.getNombre();
            //r.setNombre(nombre);
            porcentaje=(r.getPuntosObtenido()*100)/r.getPuntosMateria();
            r.setPuntos(porcentaje);
            list.add(r);
            //posicion=posicion+1;
        }
        request.setAttribute("puntosMateria", r.getPuntosMateria());
        request.setAttribute("lista", list);
        request.setAttribute("materia",materia);
        
        restP.close();
        request.getRequestDispatcher("RankingMateria.jsp").forward(request, response);
    }
    private void mostrarCuestionario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson json = new Gson();
        RestCuestionario restC = new RestCuestionario();
        Cuestionario cuestionario = new Cuestionario();
        String idMateria=request.getParameter("idMateria");
        //String materia=request.getParameter("Materia");
        //String idCurso=request.getParameter("idCurso");
        
        ArrayList value = restC.getCuestionariosForMateria(ArrayList.class, idMateria);
        ArrayList<Cuestionario> list = new ArrayList();
        for(Object pro: value){
            cuestionario = json.fromJson(pro.toString(), Cuestionario.class);
            list.add(cuestionario);
        }
        
        request.setAttribute("lista", list);
        restC.close();
        request.getRequestDispatcher("verCuestionarios.jsp").forward(request, response);
    }

    private void rankingPorCuestionario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //To change body of generated methods, choose Tools | Templates.
        String idCuestionario,idCurso,materia;
        idCuestionario=request.getParameter("idCuestionario");
        materia=request.getParameter("Materia");
        int PuntoTotal= Integer.valueOf( request.getParameter("puntos"));
        //idCurso=request.getParameter("idCurso");
        Gson json = new Gson();
        RestPuntuaciones restP= new RestPuntuaciones();
        Ranking r= new Ranking();
        ArrayList value= restP.getPuntuacionesCuestionario(ArrayList.class, idCuestionario);
        ArrayList<Ranking> list = new ArrayList();
        int posicion=1;
        int porcentaje;
        for(Object pro: value){
            r = json.fromJson(pro.toString(), Ranking.class);
            //String nombre=""+posicion+" "+r.getNombre();
            //r.setNombre(nombre);
            
            porcentaje=(r.getPuntos()*100)/PuntoTotal;
            r.setPuntosObtenido(porcentaje);
            list.add(r);
            //posicion=posicion+1;
        }
        request.setAttribute("idC", idCuestionario);
        request.setAttribute("PuntajeT", PuntoTotal);
        request.setAttribute("lista", list);
        request.setAttribute("materia",materia);
        
        restP.close();
        request.getRequestDispatcher("RankingCuestionario.jsp").forward(request, response);
    }

    private void verRespuesta(HttpServletRequest request, HttpServletResponse response) throws ServletException, ServletException, IOException {
        String idAlumno=request.getParameter("idAlumno");
        String idCuestionario=request.getParameter("idCuestionario");
        ArrayList<Test> list = new ArrayList();
        list= obtenerPreguntas(idCuestionario);
        ArrayList<Test> respuestas= obtenerRespuestas(idCuestionario,idAlumno);
        ArrayList<Test> unido = unirRespuestas(list,respuestas);
        request.setAttribute("idAlumno", idAlumno);
        request.setAttribute("idCuestionario", idCuestionario);
        request.setAttribute("lista", unido);
        request.getRequestDispatcher("desplegarCuestionario.jsp").forward(request, response);
    
    }

    private ArrayList<Test> obtenerPreguntas(String idCuestionario) {
        
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

    private ArrayList<Test> obtenerRespuestas(String idCuestionario, String idAlumno) {
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

    private ArrayList<Test> unirRespuestas(ArrayList<Test> list, ArrayList<Test> listRespuestas) {
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

    private void modificarPuntoRespuesta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idAlumno=request.getParameter("idAlumno");
        String idPregunta=request.getParameter("idPregunta");
        String puntaje=request.getParameter("puntoObtenido");
        String idCuestionario=request.getParameter("idCuestionario");
         RestTest restT=new RestTest();
         restT.updatePuntaje(idPregunta, idAlumno, puntaje);
         String path="ControllerRanking?accion=verRespuesta&idCuestionario="+idCuestionario+"&idAlumno="+idAlumno;
        request.getRequestDispatcher(path).forward(request, response);
         restT.close();
    }

    

}