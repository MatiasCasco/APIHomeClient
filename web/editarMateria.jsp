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
                <form class="form-inline my-2 my-lg-0" action="ControllerLogg" method="POST">                           
                    <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" name="accion" value="Cerrar Sesion">Cerrar Sesion</button>
                </form>   
            </div>
        </nav>
      <!-- -->
 
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
       
        <div class="mx-auto col-sm-9 main-section" id="myTab" role="tablist">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Materia</a>
                </li>
            </ul>            
            <div class="card">
                <div class="card-header">
                    <h4>Editar Materia</h4>
                </div>        
                <div class="card-body">
                    <form class="form"  role="form" action="ControllerMateria" method="POST">
                        <% Materia materia = (Materia) request.getAttribute("materia");%>
                                              
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Identificador Materia: <%=materia.getIdMateria()%></label>
                            <div class="col-lg-9">
                                <input type="hidden" name="txtIdM"  value="<%=materia.getIdMateria()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                             <label class="col-lg-3 col-form-label form-control-label">Nombre Materia</label>
                             <div class="col-lg-9">
                                 <input class="form-control"  type="text" name="nombreMateria" value= <%=materia.getNombre()%> required autofocus>
                             </div>
                        </div>
                        <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Seleccionar Curso</label>
                          <div class="col-lg-9">                         
                              <select name="curso" class="custom-select" id="selectC" required>
                                  <option value="" selected disabled>Agregar Curso</option>
                                  <%for(Curso elemento: lista){%>               
                                  <option value="<%=elemento.getIdCurso()%>">#<%=elemento.getIdCurso()%> <%=elemento.getNombre()%> prof:<%=elemento.getNombreProfesor()%></option>
                                  <%}%>
                              </select>
                              <script>
                                     document.ready=document.getElementById("selectC").value= <%=materia.getIdCurso()%> ;
                              </script>
                          </div>
                         </div>
                        
                        <input type="submit" name="accion" value="Actualizar">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
