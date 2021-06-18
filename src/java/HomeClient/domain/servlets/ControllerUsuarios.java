/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HomeClient.domain.servlets;

import Consumir.Resteasy.PersonaCliente;
import HomeClient.domain.model.Persona;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class ControllerUsuarios extends HttpServlet {

   
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
        //response.setContentType("text/html;charset=UTF-8");
         doPost(request,response);
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
        listUser(request, response);
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
       // processRequest(request, response);
        String action = request.getParameter("action");
        if (action == null)
            action=(String) request.getAttribute("action");
        switch(action)
        {
            case "List":
                listUser(request,response);
                break;
            case "add":
                addUser(request,response);
                break;
            case "Editar":
                editUser(request,response);
                break;
            case "Delete":
                removeUser(request,response);
                break;
            case "update":
                updateUser(request,response);
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

    private void updateUser(HttpServletRequest request, HttpServletResponse response)  {
        try {
            //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            
            String nombre=request.getParameter("nombre");
            String apellido=request.getParameter("apellido");
            String email=request.getParameter("email");
            String loginName = request.getParameter("loginName");
            String descripcion="";
            String password=request.getParameter("pass1");
            int id=Integer.parseInt(request.getParameter("id"));
            int rol=Integer.parseInt(request.getParameter("rol"));
            int idCurso=Integer.parseInt(request.getParameter("idCurso"));
            
            switch(rol){
                case 1:
                    descripcion="Administrador";
                    break;
                case 2:
                    descripcion="Profesor";
                    break;
                case 3:
                    descripcion="Alumno";
                    break;
                case 4:
                    descripcion="Alumno";
                    break;   
                        
            }
            //--------instanciamos un objeto persona para insertar----------------------------------
            //  public Persona(String nombre, String apellido, String email, int rol, String descripcion, String password, Integer id, String loginName,Integer idCurso) {
 
            Persona newPersona=new  Persona( nombre, apellido, email, rol,  descripcion,  password, id,  loginName,idCurso);
            //--------Instanciamos un Cliente
            PersonaCliente pc=new PersonaCliente();
            //--------Insertamos el nuevo usuario
            pc.updatePersona(newPersona);
            
            //-------Cerramos el cliente
            pc.close();
            
            //-------hacemos fordward para regresar a la pagina
            listUser(request,response);
        } catch (ServletException ex) {
            Logger.getLogger(ControllerUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControllerUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    

    private void removeUser(HttpServletRequest request, HttpServletResponse response) throws ServletException {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        PersonaCliente cp= new PersonaCliente();
        String idUsuario= request.getParameter("idUsuario");
        //int id=Integer.parseInt(idUsuario);
        cp.removePersona(idUsuario);
        cp.close();
        try {
            listUser(request,response);
        } catch (IOException ex) {
            Logger.getLogger(ControllerUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            
            String nombre=request.getParameter("nombre");
            String apellido=request.getParameter("apellido");
            String email=request.getParameter("email");
            String loginName = request.getParameter("loginName");
            String descripcion="";
            String password=request.getParameter("pass1");
            int id=1;//Integer.parseInt(request.getParameter("id"));
            int rol=Integer.parseInt(request.getParameter("rol"));
            int idCurso;
            if(rol==4)
                idCurso=Integer.parseInt(request.getParameter("idCurso"));
            else
                 idCurso=0;
            
            switch(rol){
                case 1:
                    descripcion="Administrador";
                    break;
                case 2:
                    descripcion="Profesor";
                    break;
                case 3:
                    descripcion="Alumno";
                    break;                 
                case 4:
                    descripcion="Alumno";
                    break;  
            }
            //--------instanciamos un objeto persona para insertar----------------------------------
            //  public Persona(String nombre, String apellido, String email, int rol, String descripcion, String password, Integer id, String loginName,Integer idCurso) {
 
            Persona newPersona=new  Persona( nombre, apellido, email, rol,  descripcion,  password, id,  loginName,idCurso);
            //--------Instanciamos un Cliente
            PersonaCliente pc=new PersonaCliente();
            //--------Insertamos el nuevo usuario
            pc.addPersona(newPersona,Persona.class);
            
            //-------Cerramos el cliente
            pc.close();
            
            //-------hacemos fordward para regresar a la pagina
            listUser(request,response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Gson json = new Gson();
         PersonaCliente prod = new PersonaCliente ();
         ArrayList<Persona> lista = new ArrayList();
         ArrayList value = prod.getPersonas(ArrayList.class);      
         for(Object pro: value){
             Persona p = json.fromJson(pro.toString(), Persona.class);
             lista.add(p);
           
           
         }
        
        request.setAttribute("lista", lista);
        prod.close();
        try {
            request.getRequestDispatcher("crudUsers.jsp").forward(request, response);
        } catch (IOException ex) {
            Logger.getLogger(ControllerUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
         // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
       String idUsuario= request.getParameter("idUsuario");
        
       Gson json = new Gson();
        PersonaCliente prod = new PersonaCliente ();
        Persona p= prod.getPersona(Persona.class, idUsuario);
        request.setAttribute("persona", p);
        prod.close();
        try {
            request.getRequestDispatcher("UpdatePersona.jsp").forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ControllerUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
