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
        
        //si encontro verificar el rol sea 1 Admin o 2 Profesor
        if(p.getRol()==3){
            request.setAttribute("error","Usuario invalido para la aplicacion" );
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        if (nombre.equalsIgnoreCase(p.getLoginName())||nombre.equalsIgnoreCase(p.getEmail())) {
            if (pass.equalsIgnoreCase(p.getPassword())) {//cambiar esto por dios!!1
                /*ok, usuario correcto*/
                //verificar si es profesor o Administrador
                if(p.getRol()==1){
                   // User usu = new User(nombre, pass, 1);
                    HttpSession session = request.getSession();
                    //session.setAttribute("tipo", 1);
                    //session.setAttribute("usuario", usu);
                    session.setAttribute("usuario", p);
                    request.setAttribute("action", "List");
                    request.getRequestDispatcher("ControllerUsuarios").forward(request, response);
                }else{
                    User usu = new User(nombre, pass, 2);
                    HttpSession session = request.getSession();
                    session.setAttribute("tipo", 2);
                    session.setAttribute("usuario", p);
                    request.getRequestDispatcher("ControllerMenuProfesor?accion=verMenu").forward(request, response);
                    
                }
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
        //processRequest(request, response);
        CerrarSesion(request,response);
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
        //CerrarSesion(request,response);
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
            if(p.getLoginName().equalsIgnoreCase(nombre)){
                per=p;
            }else if(p.getEmail().equalsIgnoreCase(nombre)){
                 per=p;    
            }
         }
         prod.close();
         return per;
         //   throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     
     
     private void isLog(){
     }
     
     private void CerrarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
      HttpSession session = request.getSession();
        session.removeAttribute("usuario");
        request.getSession().invalidate();
        request.setAttribute("logout","SESION CERRADA" );
        request.getRequestDispatcher("Login.jsp").forward(request, response);
     }
  
}
