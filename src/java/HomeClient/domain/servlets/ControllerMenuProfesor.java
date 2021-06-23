/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HomeClient.domain.servlets;

import Consumir.Resteasy.RestCurso;
import HomeClient.domain.model.Curso;
import HomeClient.domain.model.Persona;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class ControllerMenuProfesor extends HttpServlet {

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
        ///doGet(request,response);
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
         processRequest(request, response);
        verMenu(request, response);
        
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
        request.setAttribute("idC", idC);
        
        switch (accion){
            case "Ranking":
                request.getRequestDispatcher("ControllerRanking?accion=mostrarMaterias").forward(request, response);
                break;

            case "verMenu":
                this.verMenu(request, response);
                 
            default:
                this.verMenu(request, response);
//                request.getRequestDispatcher("ControllerRespuesta?accion=Listar").forward(request, response);;
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

    private void verMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCurso restC = new RestCurso();
        Curso curso = new Curso();
        
        HttpSession sesion = request.getSession();
        Persona usu=(Persona) sesion.getAttribute("usuario");
        String idProfesor = String.valueOf(usu.getId());
        
        ArrayList value = restC.CursosfindIdProf(ArrayList.class, idProfesor);
        ArrayList<Curso> list = new ArrayList();
        for(Object pro: value){
            curso = json.fromJson(pro.toString(), Curso.class);
            list.add(curso);
        }
        String prueba=usu.getNombre()+" "+usu.getApellido();
        request.setAttribute("lista", list);
        request.setAttribute("Nombre", prueba);
        
        restC.close();
        request.getRequestDispatcher("menuTeacher.jsp").forward(request, response);
    }

}
