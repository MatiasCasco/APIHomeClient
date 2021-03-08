<%-- 
    Document   : UpdatePersona
    Created on : Feb 22, 2021, 1:45:59 PM
    Author     : HP
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
        <!-- Nuestro css-->
	<link rel="stylesheet" type="text/css" href="css/user-form.css"
		th:href="@{/css/user-form.css}">
        
        <!-- FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script 
		src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script 
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	
        
        
     
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
 
        <script>
            $(function(){
                $('.datepicker').datepicker();
            });
        </script>
      
    </head>
    <body>
        
      
        
         <div class="mx-auto col-sm-9 main-section" id="myTab" role="tablist">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Cuestionario</a>
		</li>
            </ul>
                    
          <div class="card">
              <div class="card-header">
                  <h4>Agregar Cuestionario</h4>
              </div>        
              <div class="card-body"><!--action="UserFormServlet" -->
                  
                  <form class="form" method="POST" role="form" action="ControllerCuestionario"  >
                       <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Identificador Materia</label>
                          <div class="col-lg-9">
                              <input name="txtIdMateria" class="form-control" type="text" required autofocus >
                         
                          </div>
                       </div>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Puntos</label>
                          <div class="col-lg-9">
                              <input  name="txtPuntos" class="form-control" type="text" required autofocus >
                         
                          </div>
                       </div>
                       <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Fecha Inicio</label>
                          <div class="col-lg-9">
                              <input name="txtFechaInicio" class="form-control" type="date" data-date-format="yyyy-mm-dd" required autofocus >
                          </div>
                       </div>
                       <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Fecha Cierre</label>
                          <div class="col-lg-9">
                             <input name="txtFechaCierre" class="form-control" type="date" data-date-format="yyyy-mm-dd" required autofocus >                          
                          </div>
                       </div>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Tiempo Limite</label>
                          <div class="col-lg-9">
                            <input name="txtFechaCierre" class="form-control" type="txt" required autofocus >                     
                          </div>
                       </div>
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
                          <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Seleccionar Curso</label>
                          <div class="col-lg-9">
                             <select name="curso" class="custom-select" required>
                                 <option value="" selected disabled>Agregar Curso</option>
                                 <%for(Curso elemento: lista){ %>             
                                    <option value="<%=elemento.getIdCurso()%>"><%=elemento.getNombre()%></option>
                                 <%}%>
                             </select>
                          </div>
                          </div>
                          <input type="submit" name="accion" value="Guardar">
                          
                  </form>
              </div>
          </div>
      </div>
    </body>
</html>
