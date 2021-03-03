/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HomeClient.domain.servlets;

import Consumir.Resteasy.RestCurso;
import HomeClient.domain.model.Curso;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Matias
 */
public class ControllerCurso extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ControllerCurso</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ControllerCurso at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
        String profesor = request.getParameter("txtIdP");
        String curso = request.getParameter("txtNombreC");
        switch (accion){
            case "Listar":
                if (!profesor.isEmpty()){
                    this.CursosDelProfesor(request, response);
                }
                if(!curso.isEmpty()){
                    this.mostrarCursos(request, response);
                } 
                if ((profesor.isEmpty()) && (curso.isEmpty())){
                    this.Listar(request, response);
                }
//            case "Mostrar Cursos del Profesor":
//                this.CursosDelProfesor(request, response);
//            case "Buscar Curso":
//                this.mostrarCursos(request, response);
            case "Listado":
                this.Listar(request, response);
            case "Nuevo":
                request.getRequestDispatcher("agregarCurso.jsp").forward(request, response);
            case "Guardar":
                this.agregar(request, response);
            case "Editar":
                this.mostrarDatos(request, response);
            case "Actualizar":
                this.editar(request, response);
            case "Delete":
                this.Eliminar(request, response);    
            default:
//                request.getRequestDispatcher("ControllerRespuesta?accion=Listar").forward(request, response);;
                break;
        }
    }

    
    private void Listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCurso restC = new RestCurso();
        Curso curso = new Curso();
        ArrayList value = restC.getCursos(ArrayList.class);
        ArrayList<Curso> list = new ArrayList();
        for(Object pro: value){
            curso = json.fromJson(pro.toString(), Curso.class);
            list.add(curso);
        }
        request.setAttribute("lista", list);
        request.getRequestDispatcher("crudCurso.jsp").forward(request, response);
        restC.close();
    }

    private void agregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        RestCurso restC = new RestCurso();
        Curso curso = null;
        Gson json = new Gson();
        String Nombre  = request.getParameter("txtNombreCurso");
        int idProfesor  = Integer.valueOf(request.getParameter("txtIdProfesor"));
        String claveProfesor  = request.getParameter("txtClaveProfesor");
        String claveAlumno  = request.getParameter("txtClaveAlumno");
        curso =  new Curso(1, Nombre, idProfesor, " ",claveProfesor, claveAlumno);
        restC.addCurso(curso, Curso.class);
        request.getRequestDispatcher("ControllerCurso?accion=Listar").forward(request, response);
        restC.close();
    }

    private void mostrarDatos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCurso restC = new RestCurso();
        Curso curso = restC.getCurso(Curso.class, request.getParameter("txtid"));
        request.setAttribute("curso", curso);
        request.getRequestDispatcher("editarCurso.jsp").forward(request, response);
        restC.close();
    }

    private void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCurso restC = new RestCurso();
        Curso curso = null;
        int idCurso  = Integer.valueOf(request.getParameter("txtIdC"));
        String nombre  = request.getParameter("txtNombreCurso");
        int idProfesor  = Integer.valueOf(request.getParameter("txtIdProfesor"));
        String claveProfesor  = request.getParameter("txtClaveProfesor");
        String claveAlumno  = request.getParameter("txtClaveAlumno");
        curso =  new Curso(idCurso, nombre, idProfesor, " ",claveProfesor, claveAlumno);
        restC.updateCurso(curso);       
        request.getRequestDispatcher("ControllerCurso?accion=Listado").forward(request, response);
        restC.close();
    }

    private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        RestCurso restC = new RestCurso();         
        restC.removeCurso(request.getParameter("txtid"));
        request.getRequestDispatcher("ControllerCurso?accion=Listar").forward(request, response);
        restC.close();
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void CursosDelProfesor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCurso restC = new RestCurso();
        Curso curso = new Curso();
        String nombre = request.getParameter("txtIdP");//Cambiar este 
        ArrayList value = restC.getCursosProf(ArrayList.class, nombre);
        ArrayList<Curso> list = new ArrayList();
        for(Object pro: value){
            curso = json.fromJson(pro.toString(), Curso.class);
            list.add(curso);
        }
        request.setAttribute("lista", list);
        request.getRequestDispatcher("crudCurso.jsp").forward(request, response);
        restC.close();
    }

    private void mostrarCursos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCurso restC = new RestCurso();
        Curso curso = new Curso();
        ArrayList value = restC.getCursoName(ArrayList.class, request.getParameter("txtNombreC"));
        ArrayList<Curso> list = new ArrayList();
        for(Object pro: value){
            curso = json.fromJson(pro.toString(), Curso.class);
            list.add(curso);
        }
        request.setAttribute("lista", list);
        request.getRequestDispatcher("crudCurso.jsp").forward(request, response);
        restC.close();
    }

}
