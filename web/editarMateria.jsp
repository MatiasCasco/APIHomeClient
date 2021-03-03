<%-- 
    Document   : editarMateria
    Created on : 01/03/2021, 09:51:48 AM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Curso"%>
<%@page import="Consumir.Resteasy.RestCurso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.RestMateria"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="HomeClient.domain.model.Materia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
         <%-- Curso --%>
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
        <div><h3>Modificar Materia</h3></div>
        <hr>
        <br>
        <form action="ControllerMateria" method="POST">
            <% Materia materia = (Materia) request.getAttribute("materia");%>
            <label>Identificador Materia</label>
            <input type="text" name="txtIdM" readonly="readonly" value=<%=materia.getIdMateria()%>>
            <label>Nombre</label>
            <input type="text" name="txtNombreMateria" value=<%=materia.getNombre()%>>           
            <%--<label>Identificador Curso</label>
            <input type="text" name="txtIdCurso"  value=<%=materia.getIdCurso()%> >--%>
            <label for="select2">Seleccionar Curso</label>
            <select name="curso" class="custom-select" required>
                <option value="" selected disabled>Agregar curso</option>
                <%            
                for(Curso elemento: lista){
                    if(materia.getIdCurso() == elemento.getIdCurso()){
                %>
                        <option value="<%=elemento.getIdCurso()%>"selected><%=elemento.getNombre()%></option>
                <%
                    }else{
                %>
                               
                <option value="<%=elemento.getIdCurso()%>"><%=elemento.getNombre()%></option>
                <%
                    }
                }
                %>
            </select>
            <input type="submit" name="accion" value="Actualizar">
        </form>
        </center>
    </body>
</html>
