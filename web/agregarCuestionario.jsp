<%-- 
    Document   : agregarCuestionario
    Created on : 06/10/2020, 12:49:33 PM
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
        <div><h3>Agregar Nuevo Cuestionario</h3></div>
        <hr>
        <br>
        <form action="ControllerCuestionario" method="POST">
            <label>Identificador Materia</label>
            <input type="text" name="txtIdMateria">
            <label>Fecha Inicio</label>
            <input type="text" name="txtFechaInicio">
            <label>Fecha Cierre</label>
            <input type="text" name="txtFechaCierre">
            <label>Puntos</label>
            <input type="text" name="txtPuntos">
            <label>Tiempo Limite</label>
            <input type="text" name="txtTiempoLimite">
            <input type="submit" name="accion" value="Guardar">
        </form>
        </center>
    </body>
</html>
