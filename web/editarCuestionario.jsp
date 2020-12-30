<%-- 
    Document   : editarCuestionario
    Created on : 30/10/2020, 12:25:08 PM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Cuestionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
        <div><h3>Modificar Cuestionario</h3></div>
        <hr>
        <br>
        <form action="ControllerCuestionario" method="POST">
            <% Cuestionario cuestionario = (Cuestionario) request.getAttribute("cuestionario");%>
            <label>Identificador Cuestionario</label>
            <input type="text" name="txtIdC" readonly="readonly" value=<%=cuestionario.getIdCuestionario()%>>
            <label>Identificador Materia</label>
            <input type="text" name="txtIdMateria" value=<%=cuestionario.getIdMateria()%>>
            <label>Fecha Inicio</label>
            <input type="text" name="txtFechaInicio"  value=<%=cuestionario.getFechaInicio()%> >
            <label>Fecha Fin</label>
            <input type="text" name="txtFechaCierre" value=<%=cuestionario.getFechaCierre()%>>
            <label>Puntos</label>
            <input type="text" name="txtPuntos" value=<%=cuestionario.getPuntos()%>>
            <label>Tiempo Limite</label>
            <input type="text" name="txtTiempoLimite" value=<%=cuestionario.getTiempoLimite()%>>
            <input type="submit" name="accion" value="Actualizar">
        </form>
        </center>
    </body>
</html>
