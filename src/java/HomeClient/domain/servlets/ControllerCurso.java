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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        //processRequest
        //si es profesor
        HttpSession sesion = request.getSession();
        Persona usu=(Persona) sesion.getAttribute("usuario");
        if(usu.getRol()==2){//si es profesor
            CursosProfesor(request,response);
        }else{
        //si es admin
            Listar(request, response);
        }
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

            case "Listado":
                this.Listar(request, response);
            case "Materias":
                this.VerMaterias(request, response);
                break;
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
        //si es profesor
        HttpSession sesion = request.getSession();
        Persona usu=(Persona) sesion.getAttribute("usuario");
        if(usu.getRol()==2){//si es profesor
            CursosProfesor(request,response);
        }
        
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
         restC.close();
        request.getRequestDispatcher("crudCurso.jsp").forward(request, response);
       
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
        //request.getRequestDispatcher("ControllerCurso?accion=Listar").forward(request, response);
        restC.close();
        Listar(request,response);
    }

    private void mostrarDatos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCurso restC = new RestCurso();
        Curso curso = restC.getCurso(Curso.class, request.getParameter("txtid"));
        request.setAttribute("curso", curso);
         restC.close();
        request.getRequestDispatcher("editarCurso.jsp").forward(request, response);
       
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
        restC.close();
        request.getRequestDispatcher("ControllerCurso?accion=Listado").forward(request, response);
        
    }

    private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        RestCurso restC = new RestCurso();         
        restC.removeCurso(request.getParameter("txtid"));
        //request.getRequestDispatcher("ControllerCurso?accion=Listar").forward(request, response);
        restC.close();
        Listar(request,response);
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
        String nombre="";
        nombre = request.getParameter("txtIdP");
        ArrayList value = restC.getCursosProf(ArrayList.class, nombre);
        ArrayList<Curso> list = new ArrayList();
        for(Object pro: value){
            curso = json.fromJson(pro.toString(), Curso.class);
            list.add(curso);
        }
        request.setAttribute("lista", list);
        restC.close();
        request.getRequestDispatcher("crudCurso.jsp").forward(request, response);
        
    }

     private void CursosProfesor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        request.setAttribute("lista", list);
        restC.close();
        request.getRequestDispatcher("crudCurso.jsp").forward(request, response);
     
     
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
         restC.close();
        request.getRequestDispatcher("crudCurso.jsp").forward(request, response);
       
    }

    private void VerMaterias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        String idCurso=request.getParameter("txtid");
        request.setAttribute("curso",idCurso);
        
        request.getRequestDispatcher("ControllerMateria?accion=ListarMateriasDeCurso").forward(request, response);
        //request.getRequestDispatcher("ControllerMateria?accion=MateriasCurso").forward(request, response);
    }

   

}
