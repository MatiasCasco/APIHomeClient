/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HomeClient.domain.servlets;

import Consumir.Resteasy.RestPregunta;
import HomeClient.domain.model.Pregunta;
import com.google.gson.Gson;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Matias
 */
public class Imagen extends HttpServlet {

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
            this.ExtraerImagen(request.getParameter("id"), response);
    }
    
     private void ExtraerImagen(String id, HttpServletResponse response)
            throws ServletException, IOException {
        Gson json = new Gson();
        RestPregunta restP = new RestPregunta();
	 try{         
        Pregunta pregunta = restP.getPregunta(Pregunta.class, id);
            if (pregunta.getArchivoimg2().length > 0) {


                 ByteArrayOutputStream output = new ByteArrayOutputStream();
                 output.write(pregunta.getArchivoimg2());
                 response.setContentType("image/*");
                 response.setContentLength(output.size());
                 OutputStream out = response.getOutputStream();
                 output.writeTo(out);
                 out.flush();
                 out.close();
                 
            
            } else {//C:\Users\HP\Documents\NetBeansProjects\Cliente terminado+css\APIHomeClient\web\img
                File file = new File("C:\\Users\\HP\\Documents\\NetBeansProjects\\img\\DefaultImage.png");
                InputStream inputStream = new FileInputStream(file);        
                byte[] bytes = IOUtils.toByteArray(inputStream);
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                output.write(bytes);
                response.setContentType("image/*");
                response.setContentLength(output.size());
                OutputStream out = response.getOutputStream();
                output.writeTo(out);
                out.flush();
                out.close();
            }
        }catch(Exception e){}
            restP.close();
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

}
