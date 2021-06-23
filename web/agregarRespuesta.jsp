<%-- 
    Document   : agregarRespuesta
    Created on : 17/09/2020, 04:38:24 PM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Pregunta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.RestPregunta"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!-- Nuestro css-->
	
        
    </head>
    <body>
        <%  
             Gson json = new Gson();
            RestPregunta restPregunta = new RestPregunta();
            ArrayList<Pregunta> lista = new ArrayList();
            String idC=(String) request.getAttribute("idC");
            ArrayList value = restPregunta.getPreguntasCuestionario(ArrayList.class,idC);
            for(Object pro: value){
                Pregunta pregunta = json.fromJson(pro.toString(), Pregunta.class);
                lista.add(new Pregunta(pregunta.getIdPregunta(), pregunta.getIdCuestionario(), pregunta.getPuntoAsignado(), pregunta.getPuntoObtenido(), pregunta.getPregunta()));                   
            }
            restPregunta.close();
        %> 
         <!--===================BARRA DE NAVEGACION=======================-->
       <%@include file="navbar.jsp" %>    
      <!-- -->
 
        <div class="mx-auto col-sm-9 main-section" id="myTab" role="tablist">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Respuesta</a>
                </li>
            </ul>
            <div class="card">
                <div class="card-header">
                    <h4>Agregar Nueva Respueta:</h4>
                </div>        
                <div class="card-body">
                    <form class="form"  role="form" action="ControllerRespuesta" method="POST" >
                        
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Pregunta:</label>
                            <div class="col-lg-9">
                                <select id="selectP" name="pregunta" class="custom-select" required>
                                    <option value="" selected disabled>Agregar pregunta</option>
                                    <%for(Pregunta elemento: lista){%>               
                                    <option value="<%=elemento.getIdPregunta()%>">#<%=elemento.getIdPregunta()%> <%=elemento.getPregunta()%></option>
                                    <%}%>
                                </select>
                                <script>
                                   document.ready=document.getElementById("selectP").value= ${idP};
                                </script>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Respuesta</label>
                            <div class="col-lg-9">
                                <input type="text" name="txtRespuesta" class="form-control"  required autofocus >                        
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Evaluacion:</label>                         
                        </div>
                        <label>Rta Correcta</label>
                        <input type="checkbox" name="Bool" value="True">
                        <div class="form-group row"></div>
                       
                        <input type="submit" name="accion" value="Guardar">
                    </form>
                
                </div>
            </div>
        </div>
                        
       
    </body>
</html>
