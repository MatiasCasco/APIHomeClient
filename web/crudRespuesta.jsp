<%-- 
    Document   : crudRespuesta
    Created on : 16/09/2020, 08:50:33 AM
    Author     : User
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      
       
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
        <%@include file="navbar.jsp" %>    
        <!-- -->
 
        
      
        
        <div class="container">
            <div class="mx-auto col-sm-15 main-section" id="myTab" role="tablist">
                <ul class="nav nav-tabs justify-content-end">
                    <li class="nav-item">
                        <form  action="ControllerCuestionario" method="POST">
                                                        <input type="hidden" name="txtidCuestionario" value="${idC}">
                                                        <button type="submit" class="btn btn-outline-success my-2 my-sm-0" name="accion" value="Ver Preguntas"> Volver al Cuestionario</button>
                                                       
                        </form>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <!--Lista de Respuestas-->
                    <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                        <div class="card">
                            <div class="card-header">
                                <h4> #${IdP} Lista de Respuestas:  </h4>
                                
                                <form class="form-inline float-right" action="ControllerRespuesta" method="POST">
                                    <span class="navbar-text active" ><b>Agregar mas Respuestas:  </b></span> 
                                    <!--input class="form-control mr-sm-2" placeholder="Identificador de la pregunta" type="text" name="txtIdP">
                                    <input class="form-control mr-sm-2" placeholder="Identificador del cuestionario" type="text" name="txtIdC">
                                    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" name="accion" value="Listar"-->
                                    <input type="hidden" name="idP" value=${IdP} >
                                    <input type="hidden" name="idC" value=${idC} > 
                                    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" name="accion" value="Nuevo">
                                </form>
			    </div>
                            <div class="card-body">
                                <div class="table-responsive">    
                                    <table id="userList" class="table table-bordered table-hover table-striped">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">ID RESPUESTA</th>
                                                <th scope="col">ID CUESTIONARIO</th>
                                                <th scope="col">ID PREGUNTA</th>
                                                <th scope="col">PREGUNTA</th>
                                                <th scope="col">RESPUESTA</th>
                                                <th scope="col">EVALUACION</th>
                                                <th scope="col">ACCIONES</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="dato" items="${lista}">
                                                <tr>
                                                    <td>${dato.idRta}</td>
                                                    <td>${dato.idCuestionario}</td>
                                                    <td>${dato.idPregunta}</td>
                                                    <td>${dato.pregunta}</td>
                                                    <td>${dato.respuesta}</td>
                                                    <td>${dato.evaluacion}</td>
                                                    <td>
                                                        <form action="ControllerRespuesta" method="POST">
                                                            <input type="hidden" name="txtidRta" value="${dato.idRta}">
                                                            <input type="hidden" name="idP" value="${dato.idPregunta}">
                                                             <input type="hidden" name="idC" value="${dato.idCuestionario}">
                                                             <input type="submit" name="accion" value="Editar">
                                                            <input type="submit" name="accion" value="Delete">
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
