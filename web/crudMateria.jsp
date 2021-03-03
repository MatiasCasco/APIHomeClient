<%-- 
    Document   : crudMateria
    Created on : 01/03/2021, 09:37:01 AM
    Author     : User
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
            <form action="ControllerMateria" method="POST">
                <label>Materia</label>
                <input type="text" name="materia">
                <label>Curso </label>
                <input type="text" name="curso">
                <input type="submit" name="accion" value="Listar">
                <input type="submit" name="accion" value="Nuevo">
                <%--<input type="submit" name="accion" value="Buscar Materia">--%>
            </form>
        </div>
    <center>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>ID MATERIA</th>
                        <th>NOMBRE MATERIA</th>
                        <th>ID CURSO</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="dato" items="${lista}">
                        <tr>
                            <td>${dato.idMateria}</td>
                            <td>${dato.nombre}</td>
                            <td>${dato.idCurso}</td>
                            <td>${dato.nombreCurso}</td>
                            <td>
                                <form action="ControllerMateria" method="POST">
                                    <input type="hidden" name="txtid" value="${dato.idMateria}">
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
