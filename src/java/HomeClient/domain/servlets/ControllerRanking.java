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
        String nombreCurso=request.getParameter("nombreCurso");
        request.setAttribute("nombreCurso",nombreCurso);
        if (idC!=null) {
            request.setAttribute("idC", idC);   
        }
        
        switch (accion){
            case "Reporte":
                this.reporte(request,response);
                break;
            case "mostrarMaterias":
                this.mostrarMaterias(request,response);
                break;

             case "RankingGlobal":
                this.rankingGlobalMateria(
                        request,response);
                break;
             case "MostrarCuestionarios":
                this.listarCuestionarioCurso(request, response);
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
             case "estadistica":
                 this.verEstadisticaCuestionario(request, response);
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
        String idMateria,idCurso,materia,nombreCurso;
        nombreCurso=request.getParameter("nombreCurso");
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
        request.setAttribute("Materia",materia);
        request.setAttribute("idC",idCurso);
        request.setAttribute("nombreCurso",nombreCurso);
        restP.close();
        request.getRequestDispatcher("RankingMateria.jsp").forward(request, response);
    }
    
    private void listarCuestionarioCurso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idMateria,idCurso,materia,nombreCurso;
        nombreCurso=request.getParameter("nombreCurso");
        idMateria=request.getParameter("idMateria");
        materia=request.getParameter("Materia");
        idCurso=request.getParameter("idCurso");
        
        
        Gson json = new Gson();
        RestCuestionario restC = new RestCuestionario();
        Cuestionario cuestionario = new Cuestionario();
        
        ArrayList value = restC.getCuestionariosForMateria(ArrayList.class, idMateria);
        ArrayList<Cuestionario> list = new ArrayList();
        for(Object pro: value){
            cuestionario = json.fromJson(pro.toString(), Cuestionario.class);
            list.add(cuestionario);
        }
        request.setAttribute("idMateria",idMateria);
        request.setAttribute("Materia",materia);
        request.setAttribute("idC",idCurso);
        request.setAttribute("nombreCurso",nombreCurso);
        request.setAttribute("lista", list);
        restC.close();
        request.getRequestDispatcher("verCuestionarios.jsp").forward(request, response);
    }

    private void verRespuesta(HttpServletRequest request, HttpServletResponse response) throws ServletException, ServletException, IOException {
        String idCurso,materia,nombreCurso,idMateria;
        
        String idAlumno=request.getParameter("idAlumno");
        String idCuestionario=request.getParameter("idCuestionario");
        String puntoTotal=request.getParameter("puntoTotal");
        materia=request.getParameter("Materia");
        idCurso=request.getParameter("idC");
        nombreCurso=request.getParameter("nombreCurso");
        idMateria=request.getParameter("idMateria");
        String nombre=request.getParameter("nombre");
        String apellido=request.getParameter("apellido");
        nombre=nombre+" "+apellido;
        String puntosObtenido=request.getParameter("puntosObtenido");
        
        
        ArrayList<Test> list = new ArrayList();
        list= obtenerPreguntas(idCuestionario);
        ArrayList<Test> respuestas= obtenerRespuestas(idCuestionario,idAlumno);
        ArrayList<Test> unido = unirRespuestas(list,respuestas);
        
        request.setAttribute("idCuestionario", idCuestionario);
        request.setAttribute("puntajeT", puntoTotal);
        request.setAttribute("Materia",materia);
        request.setAttribute("idC", idCurso);
        request.setAttribute("nombreCurso",nombreCurso);
        request.setAttribute("idMateria",idMateria);
        request.setAttribute("puntaje", puntosObtenido);
        request.setAttribute("idAlumno", idAlumno);
        request.setAttribute("nombre", nombre);
        request.setAttribute("idAlumno", idAlumno);
        
        request.setAttribute("lista", unido);
        request.getRequestDispatcher("desplegarCuestionario.jsp").forward(request, response);
    
    }

    private void modificarPuntoRespuesta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idAlumno=request.getParameter("idAlumno");
        String idPregunta=request.getParameter("idPregunta");
        String puntaje=request.getParameter("newPuntaje");
        String idCuestionario=request.getParameter("idCuestionario");
        String apellido,nombre,PuntajeT,Materia,idC,nombreCurso,idMateria,puntosCuestionario;
        apellido=" ";
        nombre=request.getParameter("nombre");
        PuntajeT=request.getParameter("puntoTotal");
        Materia=request.getParameter("Materia");                
        idC=request.getParameter("idC");
        nombreCurso=request.getParameter("nombreCurso");
        idMateria=request.getParameter("idMateria");
        puntosCuestionario=request.getParameter("puntosObtenido");
         
        RestTest restT=new RestTest();
        restT.updatePuntaje(idPregunta, idAlumno, puntaje);
        String path="ControllerRanking?accion=verRespuesta&idCuestionario="+idCuestionario+"&idAlumno="+idAlumno+""
                 + "&nombre="+nombre+"&apellido="+apellido+"&puntosObtenido="+puntosCuestionario+"&puntoTotal="
              + ""+PuntajeT+"&Materia="+Materia+"&idC="+idC+"&nombreCurso="+nombreCurso+"&idMateria="+idMateria+"";
         
        String path3="ControllerRanking?accion=verRespuesta&idCuestionario="+idCuestionario+"&idAlumno="+idAlumno;
        request.getRequestDispatcher(path).forward(request, response);
         restT.close();
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

    private void rankingPorCuestionario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //To change body of generated methods, choose Tools | Templates.
        String idCuestionario,idCurso,materia,nombreCurso,idMateria;
        idMateria=request.getParameter("idMateria");
        nombreCurso=request.getParameter("nombreCurso");
        idCurso=request.getParameter("idC");
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
        request.setAttribute("idMateria",idMateria);
        request.setAttribute("idC", idCurso);
        request.setAttribute("idCuestionario", idCuestionario);
        request.setAttribute("PuntajeT", PuntoTotal);
        request.setAttribute("nombreCurso",nombreCurso);
        request.setAttribute("lista", list);
        request.setAttribute("Materia",materia);
        
        restP.close();
        request.getRequestDispatcher("RankingCuestionario.jsp").forward(request, response);
    }

   
    private void verEstadisticaCuestionario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String idCuestionario,idCurso,materia,nombreCurso,idMateria;
        idMateria=request.getParameter("idMateria");
        nombreCurso=request.getParameter("nombreCurso");
        idCurso=request.getParameter("idC");
        idCuestionario=request.getParameter("idCuestionario");
        materia=request.getParameter("Materia");
        int PuntoTotal= Integer.valueOf( request.getParameter("puntos"));
        ////
        request.setAttribute("idMateria",idMateria);
        request.setAttribute("idC", idCurso);
        request.setAttribute("idCuestionario", idCuestionario);
        request.setAttribute("PuntajeT", PuntoTotal);
        request.setAttribute("nombreCurso",nombreCurso);
        request.setAttribute("Materia",materia);
         request.getRequestDispatcher("estadisticasCuestionario.jsp").forward(request, response);
    }

    private void reporte(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCuestionario=request.getParameter("idC");
        request.setAttribute("identificador", idCuestionario);
        request.getRequestDispatcher("reporte.jsp").forward(request, response);
    }

    

}
