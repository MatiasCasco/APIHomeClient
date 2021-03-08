<%-- 
    Document   : crudRespuesta
    Created on : 16/09/2020, 08:50:33 AM
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
         <div>TODO write content</div>
        <div>
            <form action="ControllerRespuesta" method="POST">
                <label>Identificador de la pregunta</label>
                <input type="text" name="txtIdP">
                <label>Identificador del cuestionario </label>
                <input type="text" name="txtIdC">
                <input type="submit" name="accion" value="Listar">
                <%--<input type="submit" name="accion" value="Respuestas de una Pregunta">
                <input type="submit" name="accion" value="Respuestas de un Cuestionario">--%>
                <input type="submit" name="accion" value="Nuevo">
            </form>
        </div>
    <center>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>ID CUESTIONARIO</th>
                        <th>ID PREGUNTA</th>
                        <th>PREGUNTA</th>
                        <th>ID RTA</th>
                        <th>RESPUESTA</th>
                        <th>EVALUACION</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dato" items="${lista}">
                        <tr>
                            <td>${dato.idCuestionario}</td>
                            <td>${dato.idPregunta}</td>
                            <td>${dato.pregunta}</td>
                            <td>${dato.idRta}</td>
                            <td>${dato.respuesta}</td>
                            <td>${dato.evaluacion}</td>
                            <td>
                                <form action="ControllerRespuesta" method="POST">
                                    <input type="hidden" name="txtidRta" value="${dato.idRta}">
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
