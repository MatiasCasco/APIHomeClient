<%-- 
    Document   : agregarCuestionario
    Created on : 09/02/2021, 11:08:34 AM
    Author     : User
--%>
<%@page import="Consumir.Resteasy.RestMateria"%>
<%@page import="HomeClient.domain.model.Materia"%>
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
        <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script> --%>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/locales/bootstrap-datepicker.es.min.js" charset="UTF-8"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker3.css"/>
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
        <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
        <script>
           
            $(function(){
                var today = new Date();
                $('.datepicker').datepicker({
                    language: 'es',
                    today: today,
                    startDate: today
                    
                });
            });
            
        </script>
        <script>
          /*  document.addEventListener("DOMContentLoaded", function() {
                document.getElementById("ControllerCuestionario").addEventListener('submit', validarFecha); 
            });
            function validarFecha(evento) {
              evento.preventDefault();
              var fechaInicio = document.getElementById('fechaInicio').value;
              var fechaFin = document.getElementById('fechaFin').value;
              if(fechaFin < fechaInicio) {
                alert('Fecha final debe ser mayor a la inicial');
                return;
              }
              this.submit();
            }*/
            function validarFecha() {
              var fechaInicio = document.getElementById('fechaInicio').value;
              var fechaFin = document.getElementById('fechaFin').value;
              if(fechaFin < fechaInicio) {
                alert('Fecha final debe ser mayor a la inicial');
                return false;
              } else{
                return True;
              }  
            }
        </script>
    </head>
    <body>
        <center>
        <div><h3>Agregar Nuevo Cuestionario</h3></div>
        <hr>
        <br>
        <form action="ControllerCuestionario" id="ControllerCuestionario" method="POST" onsubmit=" return validarFecha();">
           <%--<label>Identificador Materia</label>
            <input type="text" name="txtIdMateria"> --%>
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
                for(Materia elemento: lista2){    
                %>               
                <option value="<%=elemento.getIdMateria()%>"><%=elemento.getNombre()%></option>
                <%
                }
                %>
            </select>
            <label>Fecha Inicio</label>
            <input class="datepicker" type="text" name="txtFechaInicio" id="fechaInicio" data-date-format="yyyy-mm-dd" required>
            <label>Fecha Cierre</label>
            <input class="datepicker" type="text" name="txtFechaCierre" id="fechaFin" data-date-format="yyyy-mm-dd" required>        
            <label>Puntos</label>
            <input type="text" name="txtPuntos" value="0">
            <label>Tiempo Limite</label>
            <input type="text" name="txtTiempoLimite" value="00:15:00">
            <%--<label>Identificador Curso</label>
            <input type="text" name="txtIdCurso">--%>
            <%-- 
            <%  
                //Gson json = new Gson();
                RestCurso restCurso = new RestCurso();
                ArrayList<Curso> lista = new ArrayList();
                ArrayList valueC = restCurso.getCursos(ArrayList.class);
                for(Object pro: valueC){
                    Curso cursos = json.fromJson(pro.toString(), Curso.class);
                    lista.add(new Curso(cursos.getIdCurso(), cursos.getNombre(), cursos.getIdProfesor(), cursos.getNombreProfesor(), cursos.getClaveProfesor(), cursos.getClaveAlumno()));                   
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
            </select> --%>
            <input type="submit" name="accion" value="Guardar">
        </form>
        </center>
    </body>
</html>