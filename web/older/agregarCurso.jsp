<%-- 
    Document   : agregarCurso
    Created on : 30/10/2020, 03:15:42 PM
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
        <div><h3>Agregar Nuevo Curso</h3></div>
        <hr>
        <br>
        <form action="ControllerCurso" method="POST">
            <label>Nombre Curso</label>
            <input type="text" name="txtNombreCurso">
            <label>Identificador Profesor</label>
            <input type="text" name="txtIdProfesor">
            <label>Clave Profesor</label>
            <input type="text" name="txtClaveProfesor">
            <label>Clave Alumno</label>
            <input type="text" name="txtClaveAlumno">
            <input type="submit" name="accion" value="Guardar">
        </form>
        </center>
    </body>
</html>
