/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HomeClient.domain.servlets;

import Consumir.Resteasy.RestMateria;
import HomeClient.domain.model.Materia;
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
 * @author User
 */
public class ControllerMateria extends HttpServlet {

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
//            out.println("<title>Servlet ControllerMateria</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ControllerMateria at " + request.getContextPath() + "</h1>");
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
        Listar(request, response);
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
        String materia = " "; 
        materia = request.getParameter("materia");
        String curso = " ";
        curso = request.getParameter("curso");
        switch (accion){
            case "Listar":
                if (!curso.isEmpty()){
                    this.ListarMateriasPorCurso(request, response);
                }
                if(!materia.isEmpty()){
                    this.ListarCursosConLaMateria(request, response);
                } 
                if ((curso.isEmpty()) && (materia.isEmpty())){
                    this.Listar(request, response);
                }
               
            case "Listado":
                 
                this.Listar(request, response);
                break;
                
            case "Nuevo":
                request.getRequestDispatcher("agregarMateria.jsp").forward(request, response);
                break;
            case "Guardar":
                this.agregar(request, response);
                break;
            case "Editar":
                this.mostrarDatos(request, response);
                break;
            case "Actualizar":
                this.editar(request, response);
                break;
            case "Delete":
                this.Eliminar(request, response);  
                break;
            default:
                request.getRequestDispatcher("ControllerMateria?accion=Listar").forward(request, response);
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

     private void Listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestMateria restM = new RestMateria();
        Materia materia = new Materia();
        ArrayList value = restM.getMaterias(ArrayList.class);
        ArrayList<Materia> list = new ArrayList();
        for(Object pro: value){
            materia = json.fromJson(pro.toString(), Materia.class);
            list.add(materia);
        }
        request.setAttribute("lista", list);
        restM.close();
        request.getRequestDispatcher("crudMateria.jsp").forward(request, response);
      
    }
    
    private void agregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        RestMateria restM = new RestMateria();
        Materia materia = null;
        Gson json = new Gson();
        //String nombreMateria = "\""+request.getParameter("nombreMateria")+"\"";
        String nombreMateria = request.getParameter("nombreMateria");
        int idCurso  = Integer.valueOf(request.getParameter("curso"));
        materia =  new Materia(1, nombreMateria, idCurso," ");
        restM.addMateria(materia, Materia.class);
        restM.close();
        Listar(request,response);
       // request.getRequestDispatcher("ControllerMateria?accion=Listar").forward(request, response);
        
    }

    private void mostrarDatos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestMateria restM = new RestMateria();         
        Materia materia = restM.getMateria(Materia.class,  request.getParameter("txtid"));
        request.setAttribute("materia", materia);
         restM.close();
        request.getRequestDispatcher("editarMateria.jsp").forward(request, response);
       
    }

    private void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
         Gson json = new Gson();
        RestMateria restM = new RestMateria();
        Materia materia = null;
        int idMateria  = Integer.valueOf(request.getParameter("txtIdM"));
        String nombre  = request.getParameter("txtNombreMateria");
        int idCurso  = Integer.valueOf(request.getParameter("curso"));
        materia = new Materia(idMateria, nombre, idCurso, " ");
        request.setAttribute("editar", "editar");
        restM.updateMateria(materia);
        restM.close();
        request.getRequestDispatcher("ControllerMateria?accion=Listado").forward(request, response);
        
    }

    private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        RestMateria restM = new RestMateria();         
        restM.removeMateria(request.getParameter("txtid"));
        //request.getRequestDispatcher("ControllerMateria?accion=Listar").forward(request, response);
        restM.close();
        request.getRequestDispatcher("ControllerMateria?accion=Listado").forward(request, response);
       // Listar(request,response);
    }

    private void ListarMateriasPorCurso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestMateria restM = new RestMateria();
        Materia materia = new Materia();
        ArrayList value = restM.getMateriasCurso(ArrayList.class, request.getParameter("curso"));
        ArrayList<Materia> list = new ArrayList();
        for(Object pro: value){
            materia = json.fromJson(pro.toString(), Materia.class);
            list.add(materia);
        }
        request.setAttribute("lista", list);
         restM.close();
        request.getRequestDispatcher("crudMateria.jsp").forward(request, response);
       
    }

    private void ListarCursosConLaMateria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestMateria restM = new RestMateria();
        Materia materia = new Materia();
        ArrayList value = restM.getMateriaInCursos(ArrayList.class, request.getParameter("materia"));
        ArrayList<Materia> list = new ArrayList();
        for(Object pro: value){
            materia = json.fromJson(pro.toString(), Materia.class);
            list.add(materia);
        }
        request.setAttribute("lista", list);
          restM.close();
        request.getRequestDispatcher("crudMateria.jsp").forward(request, response);
      
    }

}
