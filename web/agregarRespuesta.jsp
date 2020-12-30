<%-- 
    Document   : agregarRespuesta
    Created on : 17/09/2020, 04:38:24 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
        <div><h3>Agregar Nueva Respuesta</h3></div>
        <hr>
        <br>
        <form action="ControllerRespuesta" method="POST">
            <label>Respuesta</label>
            <input type="text" name="txtRespuesta">
            <label>Identificador Pregunta</label>
            <input type="text" name="txtIdP">
            <label>Evaluacion</label>
            <label>Rta Correcta</label>
            <input type="checkbox" name="Bool" value="True">
            <input type="submit" name="accion" value="Guardar">
        </form>
        </center>
    </body>
</html>
