<%-- 
    Document   : crudCuestionario
    Created on : 05/10/2020, 08:56:58 PM
    Author     : User
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <form action="ControllerCuestionario" method="POST">
                <label>Nombre Curso</label>
                <input type="text" name="txtNameCurso">
                <label>Identificador Cuestionario</label>
                <input type="text" name="txtIdC">
                <label>Nombre Materia </label>
                <input type="text" name="txtNombreM">
                <input type="submit" name="accion" value="Listar">
                <%--<input type="submit" name="accion" value="Cuestionarios de un curso">
                <input type="submit" name="accion" value="Cuestionarios por materia del curso">
                <input type="submit" name="accion" value="Mostrar Cuestionario">
                <input type="submit" name="accion" value="Cuestionarios de una Materia">--%>
                <input type="submit" name="accion" value="Nuevo">
            </form>
        </div>
    <center>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>ID CUESTIONARIO</th>
                        <th>NOMBRE MATERIA</th>
                        <th>FECHA INICIO</th>
                        <th>FECHA FIN</th>
                        <th>PUNTOS</th>
                        <th>TIEMPO LIMITE</th>
                        <th>CURSO</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dato" items="${lista}">
                        <tr>
                            <td>${dato.idCuestionario}</td>
                            <td>${dato.getNombreMateria()}</td>
                            <td>${dato.fechaInicio}</td>
                            <td>${dato.fechaCierre}</td>
                            <td>${dato.puntos}</td>
                            <td>${dato.getTiempoLimite()}</td>
                            <td>${dato.getNombreCurso()}</td>
                            <td>
                                <form action="ControllerCuestionario" method="POST">
                                    <input type="hidden" name="txtidCuestionario" value="${dato.idCuestionario}">
                                    <input type="submit" name="accion" value="Editar">
                                    <input type="submit" name="accion" value="Delete">
                                    <input type="submit" name="accion" value="Ver Preguntas">
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
