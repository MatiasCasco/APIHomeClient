<%-- 
    Document   : index
    Created on : 04-ago-2020, 16:33:16
    Author     : Matias
--%>
<%@page import="Consumir.Resteasy.RestPregunta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="HomeClient.domain.model.Pregunta"%>
<%@page import="HomeClient.domain.model.Pregunta"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
	
        <!-- DATA TABLE -->
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">	
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">

        <script type="text/javascript">
	    $(document).ready(function() {
	        //Asegurate que el id que le diste a la tabla sea igual al texto despues del simbolo #
	        $('#userList').DataTable();
                
	    } );
	</script>
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
 

        <div class="container">
            <div class="mx-auto col-sm-19 main-section" id="myTab" role="tablist">
                <ul class="nav nav-tabs justify-content-end">
			<li class="nav-item">
                            <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">List</a>
			</li>
			
		</ul>
                <div class="tab-content" id="myTabContent">
                    <!--Lista de Cuestionarios-->
                    <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                        <div class="card">
                            <div class="card-header">
                                <h4>Lista de Preguntas del Cuestionario: #${idC} </h4>
                               <form class="form-inline float-right"  action="ControllerImagenPregunta" method="POST">
                                   <span class="navbar-text active" ><b>Agregar mas Preguntas: </b> </span> 
                                    <input type="hidden" name="idC" value=${idC}> 
                                    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" name="accion" value="Nuevo">            
                                </form>
			    </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="userList" class="table table-bordered table-hover table-striped">
				    <thead class="thead-light">
				    <tr>
                                        <th scope="col">ID </th>
                                        <th scope="col">PREGUNTA</th>
                                        <th scope="col">FOTO</th>
                                        <th scope="col">ID CUESTIONARIO</th>
                                        <th scope="col">PUNTO ASIGNADO</th>
                                        <th scope="col">PUNTO OBTENIDO</th>
                                        <th scope="col">ACCIONES</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="dato" items="${lista}">
                                            <tr>
                                                <td>${dato.idPregunta}</td>
                                                <td>${dato.pregunta}</td>                                                 
                                                <td><img src = "Imagen?id=${dato.idPregunta}" width="250" height="230"></td>
                                                <td>${dato.idCuestionario}</td>
                                                <td>${dato.puntoAsignado}</td>
                                                <td>${dato.puntoObtenido}</td>
                                                <td>
                                                    <form action="ControllerImagenPregunta" method="POST">
                                                       
                                                        <input type="hidden" name="txtIdP" value="${dato.idPregunta}">
                                                        <input type="hidden" name="Cuestionario" value="${dato.idCuestionario}">
                                                        <input type="submit" name="accion" value="Editar">
                                                        <input type="submit" name="accion" value="Delete" onclick="return confirm('Se eliminaran todas las respuestas relaccionadas a esta pregunta');">
                                                        <input type="submit" name="accion" value="Ver Respuestas">
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>                 
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                   
		</div>
	    </div>
        </div>
                       
    </body>
</html>
