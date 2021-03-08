<%-- 
    Document   : editarRespuesta
    Created on : 05/10/2020, 10:38:00 AM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Pregunta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.RestPregunta"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="HomeClient.domain.model.Respuesta"%>
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
        <div><h3>Modificar Respuesta</h3></div>
        <hr>
        <br>
        <form action="ControllerRespuesta" method="POST">
            <% Respuesta rta = (Respuesta) request.getAttribute("respuesta");%>
            <label>Identificador Cuestionario</label>
            <input type="text" name="txtIdC" readonly="readonly" value=<%=rta.getIdCuestionario()%>>
            <%--<label>Identificador Pregunta</label>
            <input type="text" name="txtIdP" value=<%=rta.getIdPregunta()%>>--%>
            <label for="select2">Seleccionar Pregunta</label>
            <select name="pregunta" class="custom-select" required>
                <option value="" selected disabled>Agregar pregunta</option>
                <%            
                for(Pregunta elemento: lista){
                    if(rta.getIdPregunta() == elemento.getIdPregunta()){
                %>
                        <option value="<%=elemento.getIdPregunta()%>"selected><%=elemento.getPregunta()%></option>
                <%
                    }else{
                %>
                               
                <option value="<%=elemento.getIdPregunta()%>"><%=elemento.getPregunta()%></option>
                <%
                    }
                }
                %>
            </select>
            <label>Identificador Respuesta</label>
            <input type="text" name="txtIdRta" readonly="readonly" value=<%=rta.getIdRta()%> >
            <label>Respuesta</label>
            <input type="text" name="txtRespuesta" value=<%=rta.getRespuesta()%>>
            <label>Evaluacion</label>
            <input type="checkbox" name="Bool" value="True" <%if(rta.getEvaluacion()){%> checked <%} %>>           
            <input type="submit" name="accion" value="Actualizar">
        </form>
    </center>
    </body>
</html>
