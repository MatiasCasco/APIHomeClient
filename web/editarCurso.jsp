<%-- 
    Document   : editarCurso
    Created on : 30/10/2020, 03:16:04 PM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Persona"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.PersonaCliente"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="HomeClient.domain.model.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Nuestro css-->
        <link rel="stylesheet" type="text/css" href="css/user-form.css"
              th:href="@{/css/user-form.css}">
        
        <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script 
		src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script 
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	
        
    </head>
    <body>
           <!--===================BARRA DE NAVEGACION=======================-->
        <nav class="navbar navbar-expand-lg navbar-dark  bg-dark"> 
            <a class="navbar-brand" href="#">Home Resident Admin</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>            
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item nav-link active" href="ControllerUsuarios">Gestion de Usuarios</a>    
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link active dropdown-toggle" href="ControllerCuestionario" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Cuestionarios
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="ControllerCuestionario">CRUD Cuestionarios</a>
                            <a class="dropdown-item" href="agregarCuestionario.jsp">Agregar</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link active dropdown-toggle" href="ControllerCurso" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Cursos
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="ControllerCurso">Gestion de Cursos</a>
                            <a class="dropdown-item" href="agregarCurso.jsp">Agregar</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link active dropdown-toggle" href="ControllerMateria" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Materias
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="ControllerMateria">Gestion de Materias</a>
                            <a class="dropdown-item" href="agregarMateria.jsp">Agregar</a>
                        </div>
                    </li>      
                </ul>       
            </div>
        </nav>
      <!-- -->
        <div class="mx-auto col-sm-9 main-section" id="myTab" role="tablist">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Curso</a>
		</li>
            </ul>
                    
          <div class="card">
              <div class="card-header">
                  <h4>Agregar Curso</h4>
              </div>        
              <div class="card-body">
                  <form class="form"  role="form" action="ControllerCurso" method="POST">
                        <% Curso curso = (Curso) request.getAttribute("curso");%>
                        <label>Identificador Curso: <%=curso.getIdCurso()%></label>
                        <input type="hidden" name="txtIdC"  value="<%=curso.getIdCurso()%>">
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Nombre Curso</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" required autofocus name="txtNombreCurso" value="<%=curso.getNombre()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Profesor</label>
                            <div class="col-lg-9">
                                <%  Gson json = new Gson();
                                 PersonaCliente prod = new PersonaCliente ();
                                 ArrayList value = prod.getProfesores(ArrayList.class);%>      
                                 <select name="txtIdProfesor" class="custom-select" id="selectP" required>
                                     <option value="" selected disabled>Seleccionar Profesor</option>
                                     <%for(Object pro: value){Persona p = json.fromJson(pro.toString(), Persona.class);%>
                                     <option value="<%=p.getId()%>"><%=p.getId()%>) <%=p.getNombre()%>, <%=p.getApellido()%> </option>
                                     <%} prod.close();%>
                                 </select>
                                 <script>
                                     document.ready=document.getElementById("selectP").value=<%=curso.getIdProfesor()%> ;
                                 </script>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Clave Profesor</label>
                            <div class="col-lg-9">
                                <input type="text" name="txtClaveProfesor" value="<%=curso.getClaveProfesor()%>" class="form-control"  required autofocus >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Clave Alumno</label>
                            <div class="col-lg-9">
                                <input  name="txtClaveAlumno" class="form-control" value="<%=curso.getClaveAlumno()%>" type="text" required autofocus >
                            </div>
                        </div>               
                            <input type="submit" name="accion" value="Actualizar">
                  </form>
              </div>
          </div>
      </div>
    </body>
</html>
