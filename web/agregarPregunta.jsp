<%-- 
    Document   : Pagina2
    Created on : 24-jul-2020, 9:43:10
    Author     : Matias
--%>

<%@page import="HomeClient.domain.model.Pregunta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <div><h3>Agregar Nueva Pregunta</h3></div>
        <hr>
        <br>
        <form action="ControllerImagenPregunta" method="POST" enctype="multipart/form-data">
            <label>Pregunta</label>
            <input type="text" name="txtPregunta">
            <label>Identificador Cuestionario</label>
            <input type="text" name="txtIdentificador">
            <label>Punto Asignado</label>
            <input type="text" name="txtPuntoAsignado">
            <label>Punto Obtenido</label>
            <input type="text" name="txtPuntoObtenido">
            <label>Imagen</label>
            <input type="file" name="fichero">
            <input type="submit" name="accion" value="Guardar">
        </form>
    </center>
    </body>
</html>
