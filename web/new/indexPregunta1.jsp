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
        <div>TODO write content</div>
        <div>
            <form action="ControllerImagenPregunta" method="POST">
                <input type="submit" name="accion" value="Listar">
                <input type="submit" name="accion" value="Nuevo">
            </form>
        </div>
        
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
                                <h4>Lista de Preguntas</h4>
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
                                       <c:forEach var=" dato" items="${lista}">
                                           <tr>
                                               <td>${dato.idPregunta}</td>
                                               <td>${dato.pregunta}</td>
                                               <td><img src = "Imagen?id=${dato.idPregunta}" width="250" height="230"></td>
                                               <td>${dato.idCuestionario}</td>
                                               <td>${dato.puntoAsignado}</td>
                                               <td>${dato.puntoObtenido}</td>
                                               <td>
                                                   <form action="ControllerImagenPregunta" method="POST">
                                                       <input type="hidden" name="txtid" value="${dato.idPregunta}">
                                                       <input type="hidden" name="txtIdP" value="${dato.idPregunta}">
                                                       <input type="submit" name="accion" value="Editar">
                                                       <input type="submit" name="accion" value="Delete">
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
