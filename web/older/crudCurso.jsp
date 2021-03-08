<%-- 
    Document   : crudCurso
    Created on : 30/10/2020, 03:15:14 PM
    Author     : Matias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <form action="ControllerCurso" method="POST">
                <label>Nombre Profesor</label>
                <input type="text" name="txtIdP">
                <label>Nombre Curso </label>
                <input type="text" name="txtNombreC">
                <input type="submit" name="accion" value="Listar">
                <input type="submit" name="accion" value="Nuevo">
                <%--<input type="submit" name="accion" value="Mostrar Cursos del Profesor">
                <input type="submit" name="accion" value="Buscar Curso">--%>
            </form>
        </div>
    <center>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>ID CURSO</th>
                        <th>NOMBRE</th>
                        <th>PROFESOR</th>
                        <th>CLAVE PROFESOR</th>
                        <th>CLAVE ALUMNO</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="dato" items="${lista}">
                        <tr>
                            <td>${dato.idCurso}</td>
                            <td>${dato.nombre}</td>
                            <td>${dato.nombreProfesor}</td>
                            <td>${dato.claveProfesor}</td>
                            <td>${dato.claveAlumno}</td>
                            <td>
                                <form action="ControllerCurso" method="POST">
                                    <input type="hidden" name="txtid" value="${dato.idCurso}">
                                    <input type="submit" name="accion" value="Editar">
                                    <input type="submit" name="accion" value="Delete">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>   
                </tbody>
            </table>
        </div
    </center>
    </body>
</html>
