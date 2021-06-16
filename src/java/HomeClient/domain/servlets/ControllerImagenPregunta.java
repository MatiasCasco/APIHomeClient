/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HomeClient.domain.servlets;

import Consumir.Resteasy.RestPregunta;
import HomeClient.domain.model.Pregunta;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Base64;
import org.apache.commons.io.IOUtils;

/**
 * 
 * @author Matias
 */
@MultipartConfig 
public class ControllerImagenPregunta extends HttpServlet {
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       //processRequest(request, response);
        this.Listar(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {
            String accion = request.getParameter("accion");
            if(accion.equalsIgnoreCase("Nuevo")){
                String idCuestionario= request.getParameter("idC");
                request.setAttribute("idC", idCuestionario);
                request.getRequestDispatcher("agregarPregunta.jsp").forward(request, response);
            }else if(accion.equalsIgnoreCase("Guardar")){                    
                this.agregar(request, response);                
            }
            if(accion.equalsIgnoreCase("Listar")){
                this.Listar(request, response);
            }
            if(accion.equalsIgnoreCase("ListarP")){
                this.ListarP(request, response);
            }
            if(accion.equalsIgnoreCase("Editar")){                    
                this.mostrarDatos(request, response);
            } else if(accion.equalsIgnoreCase("Actualizar")){
                this.editar(request, response);
            }
            if(accion.equalsIgnoreCase("Delete")){
                this.Eliminar(request, response);
            }
            if(accion.equalsIgnoreCase("Ver Preguntas")){
                this.MostrarPreguntas(request, response);
            }
            if(accion.equalsIgnoreCase("Ver Respuestas")){
                request.getRequestDispatcher("ControllerRespuesta?accion=RespuestasdePregunta").forward(request, response);
            }
// referencia por default el servlet y la accion
//            request.getRequestDispatcher("ControllerImagenPregunta?accion=Listar").forward(request, response);
            
        } catch(Exception ex){}          
    }
  
    private void agregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RestPregunta restP = new RestPregunta();
        Pregunta pregunta = null;
        Gson json = new Gson();
        String preg = "\""+new String(request.getParameter("txtPregunta").getBytes("ISO-8859-1"),"UTF-8")+"\"";
        int id  = Integer.valueOf(request.getParameter("txtIdentificador"));
        int puntoAsignado = Integer.valueOf(request.getParameter("txtPuntoAsignado"));
        int puntoObtenido = Integer.valueOf(request.getParameter("txtPuntoObtenido"));
        Part part = request.getPart("fichero");        
        InputStream inputStream = part.getInputStream();        
        byte[] bytes = IOUtils.toByteArray(inputStream);
        String encoded = Base64.getEncoder().encodeToString(bytes);        
        pregunta =  new Pregunta(1, id, puntoAsignado, puntoObtenido, preg, encoded, "Probando");
        request.setAttribute("idC", request.getParameter("Cuestionario"));
        restP.addPregunta(pregunta, Pregunta.class); 
        restP.close();
        request.getRequestDispatcher("ControllerImagenPregunta?accion=ListarP").forward(request, response);      
    }

    private void mostrarDatos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Gson json = new Gson();
        RestPregunta restP = new RestPregunta();
        request.setAttribute("idC", request.getParameter("Cuestionario"));
        Pregunta pregunta = restP.getPregunta(Pregunta.class, request.getParameter("txtIdP"));    
        request.setAttribute("pregunta", pregunta);
        boolean boo = false;
        if (pregunta.getArchivoimg2().length > 0) {
            boo = true;
        }
        request.setAttribute("row", boo);
        restP.close();
        request.getRequestDispatcher("editarPregunta.jsp").forward(request, response);
        
    }
    
    private void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Gson json = new Gson();
        RestPregunta restP = new RestPregunta();
        String preg = "\""+new String(request.getParameter("txtPregunta").getBytes("ISO-8859-1"),"UTF-8")+"\"";
        int idPregunta = Integer.valueOf(request.getParameter("txtId"));
        int idCuestionario  = Integer.valueOf(request.getParameter("txtIdentificador"));
        int puntoAsignado = Integer.valueOf(request.getParameter("txtPuntoAsignado"));
        int puntoObtenido = Integer.valueOf(request.getParameter("txtPuntoObtenido"));
        Part part = request.getPart("fichero");        
        InputStream inputStream = null;
        inputStream = part.getInputStream();        
        byte[] bytes = IOUtils.toByteArray(inputStream);
        String encoded = Base64.getEncoder().encodeToString(bytes);
        Pregunta pregunta = null;   
        if(part.getSize() > 0) {
           pregunta = new Pregunta(idPregunta, idCuestionario, puntoAsignado, puntoObtenido, preg, encoded, "Probando"); 
           restP.updatePreguntaImagen(pregunta);
        } else {
            pregunta = new Pregunta(idPregunta, idCuestionario, puntoAsignado, puntoObtenido, preg);
            restP.updatePregunta(pregunta);
        }
        String idC=request.getParameter("Cuestionario");
        request.setAttribute("idC",idC);
        restP.updatePregunta(pregunta); 
        restP.close(); 
        request.getRequestDispatcher("ControllerImagenPregunta?accion=ListarP").forward(request, response);
        //this.MostrarPreguntas(request, response);
//++++request.getRequestDispatcher("ControllerImagenPregunta?accion=Ver Preguntas").forward(request, response);  
                
        //request.getRequestDispatcher("ControllerImagenPregunta?accion=Listar").forward(request, response);
        
    }

    
     private void Listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Gson json = new Gson();
        RestPregunta restP = new RestPregunta();
        Pregunta pregunta = new Pregunta();
        ArrayList value = restP.getPreguntas(ArrayList.class);
        ArrayList<Pregunta> list = new ArrayList();
        for(Object pro: value){
            pregunta = json.fromJson(pro.toString(), Pregunta.class);
            list.add(pregunta);
        }
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ControllerRespuesta</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ControllerRespuesta at "+ list + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
        request.setAttribute("lista", list);
          restP.close();
        request.getRequestDispatcher("/indexPregunta.jsp").forward(request, response);
      
    }
    
    private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RestPregunta restP = new RestPregunta();         
        restP.removePregunta(request.getParameter("txtIdP"));
        request.setAttribute("idC", request.getParameter("Cuestionario"));
        restP.close();
        request.getRequestDispatcher("ControllerImagenPregunta?accion=ListarP").forward(request, response);
       
    } 
    
     private void MostrarPreguntas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestPregunta restP = new RestPregunta();
        Pregunta pregunta = new Pregunta();
        String idC;
        //
        if(request.getParameter("txtidCuestionario")!=null){
            idC=request.getParameter("txtidCuestionario");
            request.setAttribute("idC", request.getParameter("txtidCuestionario"));
        }else{
            idC=(String) request.getAttribute("idC");
        }
        ArrayList value = restP.getPreguntasCuestionario(ArrayList.class, idC);
        ArrayList<Pregunta> list = new ArrayList();
        for(Object pro: value){
            pregunta = json.fromJson(pro.toString(), Pregunta.class);
            list.add(pregunta);
        }
        String idCuestionario= request.getParameter("txtidCuestionario");
        request.setAttribute("lista", list);
        request.setAttribute("idC", idCuestionario);
        restP.close();
        request.getRequestDispatcher("indexPregunta.jsp").forward(request, response);
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void ListarP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
        RestPregunta restP = new RestPregunta();
        Pregunta pregunta = new Pregunta();
        ArrayList value = restP.getPreguntasCuestionario(ArrayList.class, request.getParameter("Cuestionario"));
        ArrayList<Pregunta> list = new ArrayList();
        for(Object pro: value){
            pregunta = json.fromJson(pro.toString(), Pregunta.class);
            list.add(pregunta);
        }
//        String idCuestionario= request.getParameter("Cuestionario");
        request.setAttribute("lista", list);
        restP.close();
        request.getRequestDispatcher("indexPregunta.jsp").forward(request, response);
        
    }

    

}
