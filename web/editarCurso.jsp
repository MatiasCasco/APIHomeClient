<%-- 
    Document   : editarCurso
    Created on : 30/10/2020, 03:16:04 PM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
        <div><h3>Modificar Curso</h3></div>
        <hr>
        <br>
        <form action="ControllerCurso" method="POST">
            <% Curso curso = (Curso) request.getAttribute("curso");%>
            <label>Identificador Curso</label>
            <input type="text" name="txtIdC" readonly="readonly" value=<%=curso.getIdCurso()%>>
            <label>Nombre</label>
            <input type="text" name="txtNombreCurso" value=<%=curso.getNombre()%>>
            <label>Identificador Profesor</label>
            <input type="text" name="txtIdProfesor"  value=<%=curso.getIdProfesor()%> >
            <label>Clave Profesor</label>
            <input type="text" name="txtClaveProfesor" value=<%=curso.getClaveProfesor()%>>
            <label>Clave Alumno</label>
            <input type="text" name="txtClaveAlumno" value=<%=curso.getClaveAlumno()%>>
            <input type="submit" name="accion" value="Actualizar">
        </form>
        </center>
    </body>
</html>
