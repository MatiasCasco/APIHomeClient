/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HomeClient.domain.servlets;

import Consumir.Resteasy.PersonaCliente;
import HomeClient.domain.model.Persona;
import HomeClient.domain.model.User;
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
public class ControllerLogg extends HttpServlet {

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
            response.setContentType("text/html;charset=UTF-8");
        String nombre, pass;
        nombre = request.getParameter("username");
        pass = request.getParameter("password");
        Persona p=getUser(nombre);//busaca un usuario con el loginname
        if (nombre.equalsIgnoreCase(p.getLoginName())) {
            if (pass.equalsIgnoreCase(p.getPassword())) {
                /*ok, usuario correcto*/
                User usu = new User(nombre, pass, "Admin");
                HttpSession session = request.getSession();
                //request.setAttribute("logerror", logerror);
                session.setAttribute("usuario", usu);
                request.setAttribute("action", "List");
                request.getRequestDispatcher("ControllerUsuarios").forward(request, response);
            } else {
                /*Pass incorrecto*/
                //logerror= true;
                //request.setAttribute("logerror",logerror );
                request.setAttribute("error","error de contraseña" );
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        }else{
            /*Usuario incorrecto*/
            //logerror= true;
            //request.setAttribute("logerror", logerror);
            request.setAttribute("error","No existe el usuario" );
            
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
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

     private Persona getUser(String nombre){
     Gson json = new Gson();
         PersonaCliente prod = new PersonaCliente ();
         ArrayList value = prod.getPersonas(ArrayList.class); 
         Persona per=new Persona();
         for(Object pro: value){
             Persona p = json.fromJson(pro.toString(), Persona.class);
             if(p.getRol()==1){
                 if(p.getLoginName().equalsIgnoreCase(nombre))
                     per=p;
             }
                 
           
           
         }
         prod.close();
         return per;
         //   throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  
}
