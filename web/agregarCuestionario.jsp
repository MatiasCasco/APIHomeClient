<%-- 
    Document   : agregarCuestionario
    Created on : 09/02/2021, 11:08:34 AM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
        <script>
            $(function(){
                $('.datepicker').datepicker();
            });
        </script>
    </head>
    <body>
        <center>
        <div><h3>Agregar Nuevo Cuestionario</h3></div>
        <hr>
        <br>
        <form action="ControllerCuestionario" method="POST">
            <label>Identificador Materia</label>
            <input type="text" name="txtIdMateria">
            <label>Fecha Inicio</label>
            <input class="datepicker" type="text" name="txtFechaInicio" data-date-format="yyyy-mm-dd">
            <label>Fecha Cierre</label>
            <input class="datepicker" type="text" name="txtFechaCierre" data-date-format="yyyy-mm-dd">        
            <label>Puntos</label>
            <input type="text" name="txtPuntos">
            <label>Tiempo Limite</label>
            <input type="text" name="txtTiempoLimite">
            <%--<label>Identificador Curso</label>
            <input type="text" name="txtIdCurso">--%>
             <%  
                Gson json = new Gson();
                RestCurso restCurso = new RestCurso();
                ArrayList<Curso> lista = new ArrayList();
                ArrayList value = restCurso.getCursos(ArrayList.class);
                for(Object pro: value){
                    Curso cursos = json.fromJson(pro.toString(), Curso.class);
                    lista.add(new Curso(cursos.getIdCurso(), cursos.getNombre(), cursos.getIdProfesor(), cursos.getClaveProfesor(), cursos.getClaveAlumno()));                   
                }
            %>
            <label for="select1">Seleccionar Curso</label>
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
