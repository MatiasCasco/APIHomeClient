<%-- 
    Document   : index
    Created on : 04-ago-2020, 16:33:16
    Author     : Matias
--%>
<%@page import="Consumir.Resteasy.RestPregunta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="HomeClient.domain.model.Pregunta"%>
<%@page import="HomeClient.domain.model.Pregunta"%>
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
            <form action="ControllerImagenPregunta" method="POST">
                <input type="submit" name="accion" value="Listar">
                <input type="submit" name="accion" value="Nuevo">
            </form>
        </div>
    <center>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>PREGUNTA</th>
                        <th>FOTO</th>
                        <th>ID CUESTIONARIO</th>
                        <th>PUNTO ASIGNADO</th>
                        <th>PUNTO OBTENIDO</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="dato" items="${lista}">
                        <tr>
                            <td>${dato.idPregunta}</td>
                            <td>${dato.pregunta}</td>
                            <td><img src = "Imagen?id=${dato.idPregunta}" width="250" height="230"></td>
                            <td>${dato.idCuestionario}</td>
                            <td>${dato.puntoAsignado}</td>
                            <td>${dato.puntoObtenido}</td>
                            <td>
                                <form action="ControllerImagenPregunta" method="POST">
                                    <input type="hidden" name="txtid" value="${dato.idPregunta}">
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
