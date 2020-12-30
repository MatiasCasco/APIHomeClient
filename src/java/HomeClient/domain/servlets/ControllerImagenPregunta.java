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
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {
            String accion = request.getParameter("accion");
            if(accion.equalsIgnoreCase("Nuevo")){
                request.getRequestDispatcher("agregarPregunta.jsp").forward(request, response);
            }else if(accion.equalsIgnoreCase("Guardar")){                    
                this.agregar(request, response);                
            }
            if(accion.equalsIgnoreCase("Listar")){
                this.Listar(request, response);
            }
            if(accion.equalsIgnoreCase("Editar")){                    
                this.mostrarDatos(request, response);
            } else if(accion.equalsIgnoreCase("Actualizar")){
                this.editar(request, response);
            }
            if(accion.equalsIgnoreCase("Delete")){
                this.Eliminar(request, response);
            }
            // referencia por default el servlet y la accion
//            request.getRequestDispatcher("ControllerImagenPregunta?accion=Listar").forward(request, response);
            
        } catch(Exception ex){}          
    }
    
    private void agregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RestPregunta restP = new RestPregunta();
        Pregunta pregunta = null;
        Gson json = new Gson();
        String preg = "\""+request.getParameter("txtPregunta")+"\"";
        int id  = Integer.valueOf(request.getParameter("txtIdentificador"));
        int puntoAsignado = Integer.valueOf(request.getParameter("txtPuntoAsignado"));
        int puntoObtenido = Integer.valueOf(request.getParameter("txtPuntoObtenido"));
        Part part = request.getPart("fichero");        
        InputStream inputStream = part.getInputStream();        
        byte[] bytes = IOUtils.toByteArray(inputStream);
        String encoded = Base64.getEncoder().encodeToString(bytes);        
        pregunta =  new Pregunta(1, id, puntoAsignado, puntoObtenido, preg, encoded, "Probando");
        restP.addPregunta(pregunta, Pregunta.class);       
        request.getRequestDispatcher("ControllerImagenPregunta?accion=Listar").forward(request, response);
        restP.close();
    }

    private void mostrarDatos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Gson json = new Gson();
        RestPregunta restP = new RestPregunta();         
        Pregunta pregunta = restP.getPregunta(Pregunta.class, request.getParameter("txtid"));
        request.setAttribute("pregunta", pregunta);
        boolean boo = false;
        if (pregunta.getArchivoimg2().length > 0) {
            boo = true;
        }
        request.setAttribute("row", boo);
        request.getRequestDispatcher("editarPregunta.jsp").forward(request, response);
        restP.close();
    }
    
    private void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Gson json = new Gson();
        RestPregunta restP = new RestPregunta();
        String preg = "\""+request.getParameter("txtPregunta")+"\"";
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
        restP.updatePregunta(pregunta);       
        request.getRequestDispatcher("ControllerImagenPregunta?accion=Listar").forward(request, response);
        restP.close();
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
        request.setAttribute("lista", list);
        request.getRequestDispatcher("/indexPregunta.jsp").forward(request, response);
        restP.close();
    }
    
    private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RestPregunta restP = new RestPregunta();         
        restP.removePregunta(request.getParameter("txtid"));
        request.getRequestDispatcher("ControllerImagenPregunta?accion=Listar").forward(request, response);
        restP.close();
    } 
     
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
