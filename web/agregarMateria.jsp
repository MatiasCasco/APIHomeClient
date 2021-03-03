<%-- 
    Document   : agregarMateria
    Created on : 01/03/2021, 09:47:57 AM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.RestCurso"%>
<%@page import="com.google.gson.Gson"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            Gson json = new Gson();
            RestCurso restCurso = new RestCurso();
            ArrayList<Curso> lista = new ArrayList();
            ArrayList value = restCurso.getCursos(ArrayList.class);
            for(Object pro: value){
                Curso cursos = json.fromJson(pro.toString(), Curso.class);
                lista.add(cursos);                   
            }
        %> 
        <center>
        <div><h3>Agregar Nueva Materia</h3></div>
        <hr>
        <br>
        <form action="ControllerMateria" method="POST">
            <label>Nombre Materia</label>
            <input type="text" name="nombreMateria">
            <%--<label>Curso</label>
            <input type="text" name="curso">--%>
            <label for="select2">Seleccionar Curso</label>
            <select name="curso" class="custom-select" required>
                <option value="" selected disabled>Agregar Curso</option>
                <%            
                for(Curso elemento: lista){    
                %>               
                <option value="<%=elemento.getIdCurso()%>"><%=elemento.getNombre()%></option>
                <%
                }
                %>
            </select>
            <input type="submit" name="accion" value="Guardar">
        </form>
        </center>
    </body>
</html>
