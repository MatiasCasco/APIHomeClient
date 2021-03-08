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
    </head>
    <body>
        <%  
            Gson json = new Gson();
            RestPregunta restPregunta = new RestPregunta();
            ArrayList<Pregunta> lista = new ArrayList();
            ArrayList value = restPregunta.getPreguntas(ArrayList.class);
            for(Object pro: value){
                Pregunta pregunta = json.fromJson(pro.toString(), Pregunta.class);
                lista.add(new Pregunta(pregunta.getIdPregunta(), pregunta.getIdCuestionario(), pregunta.getPuntoAsignado(), pregunta.getPuntoObtenido(), pregunta.getPregunta()));                   
            }
        %> 
        <center>
        <div><h3>Agregar Nueva Respuesta</h3></div>
        <hr>
        <br>
        <form action="ControllerRespuesta" method="POST">
            <label>Respuesta</label>
            <input type="text" name="txtRespuesta">
            <%--<label>Identificador Pregunta</label>
            <input type="text" name="txtIdP">--%>
            <label for="select2">Seleccionar Pregunta</label>
            <select name="pregunta" class="custom-select" required>
                <option value="" selected disabled>Agregar pregunta</option>
                <%            
                for(Pregunta elemento: lista){    
                %>               
                <option value="<%=elemento.getIdPregunta()%>"><%=elemento.getPregunta()%></option>
                <%
                }
                %>
            </select>
            <label>Evaluacion</label>
            <label>Rta Correcta</label>
            <input type="checkbox" name="Bool" value="True">
            <input type="submit" name="accion" value="Guardar">
        </form>
        </center>
    </body>
</html>
