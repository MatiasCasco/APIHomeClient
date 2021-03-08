/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HomeClient.domain.servlets;

import Consumir.Resteasy.RestCuestionario;
import Consumir.Resteasy.RestMateria;
import HomeClient.domain.model.Cuestionario;
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
public class ControllerCuestionario extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ControllerCuestionario</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ControllerCuestionario at " + request.getContextPath() + "</h1>");
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
        String cuestionario = request.getParameter("txtIdC");
        String materia = request.getParameter("txtNombreM");
        String curso = request.getParameter("txtNameCurso");
        try{
        switch (accion){
            case "Listar":
                if (!curso.isEmpty()){
                    this.ListarCuestionariosDeCurso(request, response);
                }
                if(!materia.isEmpty()){
                    this.ListarCuestionariosPorMateria(request, response);
                }
                if(!cuestionario.isEmpty()){
                    this.MostrarCuestionario(request, response);
                } 
                if (!(curso.isEmpty()) && (materia.isEmpty())){
                    this.ListarCuestionariosDeCursoPorMateria(request, response);
                }
                if(curso.isEmpty() && materia.isEmpty() && cuestionario.isEmpty()){
                    this.Listar(request, response);
                }
//            case "Cuestionarios de un curso":
//                this.ListarCuestionariosDeCurso(request, response);
//            case "Cuestionarios por materia del curso":
//                this.ListarCuestionariosDeCursoPorMateria(request, response);
//            case "Mostrar Cuestionario":
//                this.MostrarCuestionario(request, response);
//            case "Cuestionarios de una Materia":
//                this.ListarCuestionariosPorMateria(request, response);
                break;
            case "Listado":
                this.Listar(request, response);
                break;
            case "Nuevo":
                request.getRequestDispatcher("agregarCuestionario.jsp").forward(request, response);
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
             case "Ver Preguntas":
                request.getRequestDispatcher("ControllerImagenPregunta?accion=Ver Preguntas").forward(request, response);  
                 break;
            default:
              request.getRequestDispatcher("ControllerCuestionario?accion=Listado").forward(request, response);
                break;
        }
        }catch(ServletException | IOException ex){}
    }
    
    private void ListarCuestionariosDeCurso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCuestionario restC = new RestCuestionario();
        Cuestionario cuestionario = new Cuestionario();
        String curso = request.getParameter("txtNameCurso");
        ArrayList value = restC.getCuestionariosOfCurso(ArrayList.class, curso);
        ArrayList<Cuestionario> list = new ArrayList();
        for(Object pro: value){
            cuestionario = json.fromJson(pro.toString(), Cuestionario.class);
            list.add(cuestionario);
        }
        request.setAttribute("lista", list);
        restC.close();
        request.getRequestDispatcher("crudCuestionario.jsp").forward(request, response);
        
    }
    
    private void ListarCuestionariosDeCursoPorMateria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCuestionario restC = new RestCuestionario();
        Cuestionario cuestionario = new Cuestionario();
        String curso = request.getParameter("txtNameCurso");
        String materia = request.getParameter("txtNombreM");
        ArrayList value = restC.getCuestionariosOfCursoAndMateria(ArrayList.class, curso, materia);
        ArrayList<Cuestionario> list = new ArrayList();
        for(Object pro: value){
            cuestionario = json.fromJson(pro.toString(), Cuestionario.class);
            list.add(cuestionario);
        }
        request.setAttribute("lista", list);
        restC.close();
        request.getRequestDispatcher("crudCuestionario.jsp").forward(request, response);
        
    }
    
    private void ListarCuestionariosPorMateria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCuestionario restC = new RestCuestionario();
        Cuestionario cuestionario = new Cuestionario();
        String materia = request.getParameter("txtNombreM");
        ArrayList value = restC.getCuestionariosOFmateria(ArrayList.class, materia);
        ArrayList<Cuestionario> list = new ArrayList();
        for(Object pro: value){
            cuestionario = json.fromJson(pro.toString(), Cuestionario.class);
            list.add(cuestionario);
        }
        request.setAttribute("lista", list);
         restC.close();
        request.getRequestDispatcher("crudCuestionario.jsp").forward(request, response);
       
    }
    
    private void MostrarCuestionario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCuestionario restC = new RestCuestionario();
        Cuestionario cuestionario = new Cuestionario();
        cuestionario = restC.getCuestionario(Cuestionario.class, request.getParameter("txtIdC"));
        ArrayList<Cuestionario> list = new ArrayList();
        list.add(cuestionario);
        request.setAttribute("lista", list);
        restC.close();
        request.getRequestDispatcher("crudCuestionario.jsp").forward(request, response);
        
    }
    private void Listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCuestionario restC = new RestCuestionario();
        Cuestionario cuestionario = new Cuestionario();
        ArrayList value = restC.getCuestionarios(ArrayList.class);
        ArrayList<Cuestionario> list = new ArrayList();
        for(Object pro: value){
            cuestionario = json.fromJson(pro.toString(), Cuestionario.class);
            list.add(cuestionario);
        }
        request.setAttribute("lista", list);
        restC.close();
        request.getRequestDispatcher("crudCuestionario.jsp").forward(request, response);
        
    }

    private void agregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        RestCuestionario restC = new RestCuestionario();
        Cuestionario cuestionario = null;
        Gson json = new Gson();
        int idMateria  = Integer.valueOf(request.getParameter("materia"));
        String fechaInicio  = request.getParameter("txtFechaInicio");
        String fechaFin  = request.getParameter("txtFechaCierre");
        int puntos  = Integer.valueOf(request.getParameter("txtPuntos"));
        String tiempoLimite = request.getParameter("txtTiempoLimite");
//        int idCurso  = Integer.valueOf(request.getParameter("txtIdCurso"));
//        int idCurso  = Integer.valueOf(request.getParameter("curso"));
        String [] aux = tiempoLimite.split(":");
        tiempoLimite = aux[0] +"-"+ aux[1] +"-"+ aux[2];
        cuestionario =  new Cuestionario(1, idMateria, " ",fechaFin, fechaInicio, puntos, tiempoLimite, 0, " ");
        restC.addCuestionario(cuestionario, Cuestionario.class);
         restC.close();
        request.getRequestDispatcher("ControllerCuestionario?accion=Listado").forward(request, response);
       
    }

    private void mostrarDatos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCuestionario restC = new RestCuestionario();
        Cuestionario cuestionario = restC.getCuestionario(Cuestionario.class, request.getParameter("txtidCuestionario"));       
        request.setAttribute("cuestionario", cuestionario);
         restC.close();
        request.getRequestDispatcher("editarCuestionario.jsp").forward(request, response);
       
    }

    private void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestCuestionario restC = new RestCuestionario();
        Cuestionario cuestionario = null;
        int idCuestionario  = Integer.valueOf(request.getParameter("txtIdC"));
//        int idMateria  = Integer.valueOf(request.getParameter("txtIdMateria"));
        int idMateria  = Integer.valueOf(request.getParameter("materia"));
        String fechaInicio  = request.getParameter("txtFechaInicio");
        String fechaFin  = request.getParameter("txtFechaCierre");
        int puntos  = Integer.valueOf(request.getParameter("txtPuntos"));
        String tiempoLimite = request.getParameter("txtTiempoLimite");
//        int idCurso = Integer.valueOf(request.getParameter("txtIdCurso"));
//        int idCurso = Integer.valueOf(request.getParameter("curso"));
        String [] aux = tiempoLimite.split(":");
        tiempoLimite = aux[0] +"-"+ aux[1] +"-"+ aux[2];
        cuestionario =  new Cuestionario(idCuestionario, idMateria, "",fechaFin, fechaInicio, puntos, tiempoLimite, 0, " ");
        restC.updateCuestionario(cuestionario);  
        restC.close();
        request.getRequestDispatcher("ControllerCuestionario?accion=Listado").forward(request, response);
        
    }

    private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        RestCuestionario restC = new RestCuestionario();         
        restC.removeCuestionario(request.getParameter("txtidCuestionario"));
        restC.close();
        request.getRequestDispatcher("ControllerCuestionario?accion=Listado").forward(request, response);
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
