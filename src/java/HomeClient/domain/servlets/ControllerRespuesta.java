package HomeClient.domain.servlets;

import Consumir.Resteasy.RestRespuesta;
import HomeClient.domain.model.Respuesta;
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
public class ControllerRespuesta extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ControllerRespuesta</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ControllerRespuesta at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
        String accion = request.getParameter("accion");
        String pregunta = request.getParameter("txtIdP");
        String cuestionario = request.getParameter("txtIdC");
        switch (accion){
            case "RespuestasdePregunta":
                this.ListarRespuestaP(request, response);
            case "Listar":
                if (!pregunta.isEmpty()){
                    this.ListarRespuestaP(request, response);
                }
                if(!cuestionario.isEmpty()){
                    this.ListarRespuestaC(request, response);
                } 
                if ((pregunta.isEmpty()) && (cuestionario.isEmpty())){
                    this.Listar(request, response);
                }
//            case "Respuestas de un Cuestionario":
//                this.ListarRespuestaC(request, response);
//            case "Respuestas de una Pregunta":
//                this.ListarRespuestaP(request, response);
            case "Listado":
                this.Listar(request, response);
            case "Nuevo":
                String idPregunta= request.getParameter("idP");
                request.setAttribute("idP", idPregunta);
                request.getRequestDispatcher("agregarRespuesta.jsp").forward(request, response);
            case "Guardar":
                this.agregar(request, response);
            case "Editar":
                this.mostrarDatos(request, response);
            case "Actualizar":
                this.editar(request, response);
            case "Delete":
                this.Eliminar(request, response);    
            default:
                request.getRequestDispatcher("ControllerRespuesta?accion=Listar").forward(request, response);;
        }
    }

    private void Listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Gson json = new Gson();
        RestRespuesta restR = new RestRespuesta();
        Respuesta respuesta = new Respuesta();
        ArrayList value = restR.getRespuestas(ArrayList.class);
        ArrayList<Respuesta> list = new ArrayList();
        for(Object pro: value){
            respuesta = json.fromJson(pro.toString(), Respuesta.class);
            list.add(respuesta);
        }
        request.setAttribute("lista", list);
        restR.close();
        request.getRequestDispatcher("crudRespuesta.jsp").forward(request, response);
        
    }
    
    private void ListarRespuestaP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Gson json = new Gson();
        RestRespuesta restR = new RestRespuesta();
        Respuesta respuesta = new Respuesta();
        String IdP;
        IdP=request.getParameter("txtIdP");
        if(IdP == null)
        {
            IdP= (String) request.getAttribute("txtIdP");
        }
        ArrayList value = restR.getRespuestaPregunta(ArrayList.class, IdP);
        ArrayList<Respuesta> list = new ArrayList();
        for(Object pro: value){
            System.out.println(pro);
            respuesta = json.fromJson(pro.toString(), Respuesta.class);
            list.add(respuesta);
        }
        request.setAttribute("lista", list);
        request.setAttribute("IdP", IdP);
        
        restR.close();
        request.getRequestDispatcher("crudRespuesta.jsp").forward(request, response);
        
    }
    
    private void ListarRespuestaC(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Gson json = new Gson();
        RestRespuesta restR = new RestRespuesta();
        Respuesta respuesta = new Respuesta();
        ArrayList value = restR.getRespuestaCuestionario(ArrayList.class, request.getParameter("txtIdC"));
        ArrayList<Respuesta> list = new ArrayList();
        for(Object pro: value){
            System.out.println(pro);
            respuesta = json.fromJson(pro.toString(), Respuesta.class);
            list.add(respuesta);
        }
        request.setAttribute("lista", list);
        restR.close();
        request.getRequestDispatcher("crudRespuesta.jsp").forward(request, response);
        
    }
    
    private void agregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RestRespuesta restR = new RestRespuesta();
        Respuesta respuesta = null;
        Gson json = new Gson();
        String resp = "\""+new String(request.getParameter("txtRespuesta").getBytes("ISO-8859-1"),"UTF-8")+"\"";
        int idPregunta  = Integer.valueOf(request.getParameter("pregunta"));
       
        String valor = request.getParameter("Bool");
        Boolean Bool = false; 
        if(valor != null){
            Bool = true;
        }
        respuesta =  new Respuesta(1, idPregunta, " ",resp, Bool);
        restR.addRespuesta(respuesta, Respuesta.class);
        //request.getRequestDispatcher("ControllerRespuesta?accion=Listar").forward(request, response);
        restR.close();
        request.setAttribute("txtIdP", request.getParameter("pregunta"));
        this.ListarRespuestaP(request, response);
        
    }
    
    private void mostrarDatos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Gson json = new Gson();
        RestRespuesta restR = new RestRespuesta();         
        Respuesta respuesta = restR.getRespuesta(Respuesta.class,  request.getParameter("txtidRta"));
        String idC=request.getParameter("idC");
        request.setAttribute("idC", idC);
        request.setAttribute("respuesta", respuesta);
        restR.close();
        request.getRequestDispatcher("editarRespuesta.jsp").forward(request, response);
        
    }
    
    private void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Gson json = new Gson();
        RestRespuesta restR = new RestRespuesta();
        Respuesta respuesta = null;
        int idCuestionario  = Integer.valueOf(request.getParameter("txtIdC"));
        int idPregunta = Integer.valueOf(request.getParameter("pregunta"));
        int idRta = Integer.valueOf(request.getParameter("txtIdRta"));
        String resp = "\""+new String(request.getParameter("txtRespuesta").getBytes("ISO-8859-1"),"UTF-8")+"\"";
        String valor = request.getParameter("Bool");
        Boolean Bool = false; 
        if(valor != null){
            Bool = true;
        }
        respuesta =  new Respuesta(idRta, idPregunta, " ",resp, Bool);        
        restR.updateRespuesta(respuesta);    
        restR.close();
        request.setAttribute("txtIdP", request.getParameter("pregunta"));
        this.ListarRespuestaP(request, response);
        //request.getRequestDispatcher("ControllerRespuesta?accion=Listado").forward(request, response);
        
    }
    
    private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RestRespuesta restR = new RestRespuesta();         
        restR.removeRespuesta(request.getParameter("txtidRta"));
        restR.close();
        //request.getRequestDispatcher("ControllerRespuesta?accion=Listado").forward(request, response);
        request.setAttribute("txtIdP", request.getParameter("idP"));
        this.ListarRespuestaP(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
