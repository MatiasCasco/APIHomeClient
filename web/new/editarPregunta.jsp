<%-- 
    Document   : editar
    Created on : 03/09/2020, 10:58:06 PM
    Author     : User
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
        <% 
            boolean icono = false;
            try {
                icono = (Boolean) request.getAttribute("row");
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        %>
        <center>
        <div><h3>Modificar Pregunta</h3></div>
        <hr>
        <br>
        <form action="ControllerImagenPregunta" method="POST" enctype="multipart/form-data">
            <% Pregunta pre = (Pregunta) request.getAttribute("pregunta");%>
            <label>Pregunta</label>
            <input type="text" name="txtPregunta" value=<%=pre.getPregunta()%>>
            <label>Identificador Cuestionario</label>
            <input type="text" name="txtIdentificador" value=<%=pre.getIdCuestionario()%>>
            <label>Punto Asignado</label>
            <input type="text" name="txtPuntoAsignado" value=<%=pre.getPuntoAsignado()%>>
            <label>Punto Obtenido</label>
            <input type="text" name="txtPuntoObtenido" value=<%=pre.getPuntoObtenido()%>>
   
            <label>Imagen</label> 
            <%
                if (icono) {
            %>
            <a href="Imagen?id=<%out.print(pre.getIdPregunta()); %>" target="_blank"> Ver Imagen</a>
            <%
                } else {
                    out.print("Sin Imagen");
                }
            %>
            <input type="file" name="fichero" value="">           
            <input type="hidden" name="txtId" value=<%=pre.getIdPregunta()%>>
            <input type="submit" name="accion" value="Actualizar">
        </form>
    </center>
    </body>
</html>
