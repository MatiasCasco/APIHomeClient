<%-- 
    Document   : editarCuestionario
    Created on : 30/10/2020, 12:25:08 PM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Materia"%>
<%@page import="Consumir.Resteasy.RestMateria"%>
<%@page import="HomeClient.domain.model.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.RestCurso"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="HomeClient.domain.model.Cuestionario"%>
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
        <div><h3>Modificar Cuestionario</h3></div>
        <hr>
        <br>
        <form action="ControllerCuestionario" method="POST">
            <% Cuestionario cuestionario = (Cuestionario) request.getAttribute("cuestionario");%>
            <label>Identificador Cuestionario</label>
            <input type="text" name="txtIdC" readonly="readonly" value=<%=cuestionario.getIdCuestionario()%>>
            <%--<label>Identificador Materia</label>
            <input type="text" name="txtIdMateria" value=<%=cuestionario.getIdMateria()%>>--%>
            <%  
                Gson json = new Gson();
                RestMateria restMateria = new RestMateria();
                ArrayList<Materia> lista2 = new ArrayList();
                ArrayList valueM = restMateria.getMaterias(ArrayList.class);
                for(Object pro: valueM){
                    Materia materias = json.fromJson(pro.toString(), Materia.class);
                    lista2.add(materias);                   
                }
            %> 
           <label for="select2">Seleccionar Materia</label>
            <select name="materia" class="custom-select" required>
                <option value="" selected disabled>Agregar Materia</option>
                <%            
                for(Materia elementoM: lista2){
                    if(cuestionario.getIdMateria() == elementoM.getIdMateria()){
                %>
                        <option value="<%=elementoM.getIdMateria()%>"selected><%=elementoM.getNombre()%></option>
                <%
                    }else{
                %>
                        <option value="<%=elementoM.getIdMateria()%>"><%=elementoM.getNombre()%></option>
                <%
                    }
                }
                %>
            </select>
            <label>Fecha Inicio</label>
            <input class="datepicker" type="text" name="txtFechaInicio"  data-date-format="yyyy-mm-dd" value=<%=cuestionario.getFechaInicio()%>>
            <label>Fecha Fin</label>
            <input class="datepicker" type="text" name="txtFechaCierre" data-date-format="yyyy-mm-dd" value=<%=cuestionario.getFechaCierre()%>>
            <label>Puntos</label>
            <input type="text" name="txtPuntos" value=<%=cuestionario.getPuntos()%>>
            <label>Tiempo Limite</label>
            <input type="text" name="txtTiempoLimite" value=<%=cuestionario.getTiempoLimite()%>>
            <%--<label>Identificador Curso</label>
            <input type="text" name="txtIdCurso" value=<%=cuestionario.getIdCurso()%>>--%>
            <%-- combox dinamico 
            <%  
                //Gson json = new Gson();
                RestCurso restCurso = new RestCurso();
                ArrayList<Curso> lista = new ArrayList();
                ArrayList value = restCurso.getCursos(ArrayList.class);
                for(Object pro: value){
                    Curso cursos = json.fromJson(pro.toString(), Curso.class);
                    lista.add(new Curso(cursos.getIdCurso(), cursos.getNombre(), cursos.getIdProfesor(), cursos.getClaveProfesor(), cursos.getClaveAlumno()));                   
                }
            %>
            <label for="select1">Seleccionar Curso</label>
            <select name="curso" class="custom-select">
                
                <%
                for(Curso elementoC: lista){
                    if(cuestionario.getIdCurso() == elementoC.getIdCurso()){
                %>        
                        <option value="<%=elementoC.getIdCurso()%>" selected><%=elementoC.getNombre()%></option>
                <%
                    } else {
                %>               
                <option value="<%=elementoC.getIdCurso()%>"><%=elementoC.getNombre()%></option>
                <%
                    }
                }
                %>
            </select>--%>
            <%-- combox dinamico  aqui termina--%>
            <input type="submit" name="accion" value="Actualizar">
        </form>
        </center>
    </body>
</html>
