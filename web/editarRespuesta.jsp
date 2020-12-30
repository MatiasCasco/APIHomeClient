<%-- 
    Document   : editarRespuesta
    Created on : 05/10/2020, 10:38:00 AM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Respuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
        <div><h3>Modificar Respuesta</h3></div>
        <hr>
        <br>
        <form action="ControllerRespuesta" method="POST">
            <% Respuesta rta = (Respuesta) request.getAttribute("respuesta");%>
            <label>Identificador Cuestionario</label>
            <input type="text" name="txtIdC" readonly="readonly" value=<%=rta.getIdCuestionario()%>>
            <label>Identificador Pregunta</label>
            <input type="text" name="txtIdP" value=<%=rta.getIdPregunta()%>>
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
