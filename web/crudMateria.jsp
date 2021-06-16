<%-- 
    Document   : crudMateria
    Created on : 01/03/2021, 09:37:01 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Materia</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <!--Lista de Materias-->
                    <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                        <div class="card">
                            <div class="card-header">
                                <h4>Lista de Materias</h4>
                                 <form class="form-inline float-right"  action="ControllerMateria" method="POST">
                                   <span class="navbar-text active" ><b>Agregar Materia: |</b> </span> 
                                    <input type="hidden" name="idC" value=${idC}> 
                                    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" name="accion" value="Nuevo">            
                                </form>
			    </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="userList" class="table table-bordered table-hover table-striped">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">ID MATERIA</th>
                                                <th scope="col">NOMBRE MATERIA</th>
                                                <th scope="col">ID CURSO</th>
                                                <th scope="col">NOMBRE CURSO</th>
                                                <th scope="col">ACCIONES</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="dato" items="${lista}">
                                                <tr>
                                                    <td>${dato.idMateria}</td>
                                                    <td>${dato.nombre}</td>
                                                    <td>${dato.idCurso}</td>
                                                    <td>${dato.nombreCurso}</td>
                                                    <td>
                                                        <form class="form-inline" action="ControllerMateria" method="POST">
                                                            <input type="hidden" name="txtid" value="${dato.idMateria}">
                                                            <input  type="submit" class="btn-info" name="accion" value="Cuestionarios">                                                            
                                                            <input type="submit" class="btn-info" name="accion" value="Editar">
                                                            <input type="submit" class="btn-danger" name="accion" value="Delete">
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
