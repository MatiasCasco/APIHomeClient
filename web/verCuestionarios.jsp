<%-- 
    Document   : crudCuestionario
    Created on : 05/10/2020, 08:56:58 PM
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
        
          <!--cabecera narvar-->
       <!--===================BARRA DE NAVEGACION=======================-->
       <%@include file="navbar.jsp" %>    
      <!-- -->
 
     
          <div class="container">
                
               
            <div class="mx-auto col-sm-15 main-section" id="myTab" role="tablist">
                <ul class="nav nav-tabs justify-content-end">
			<li class="nav-item">
                            <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Cuestionarios</a>
			</li>
			
		</ul>
                <div class="tab-content" id="myTabContent">
                    <!--Lista de Cuestionarios-->
                    <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                        <div class="card">
                            <div class="card-header">
                                <h4>Lista de Cuestionarios</h4>
                                
			    </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="userList" class="table table-bordered table-hover table-striped">
				    <thead class="thead-light">
				    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">NOMBRE MATERIA</th>
                                        <th scope="col">FECHA INICIO</th>
                                        <th scope="col">FECHA FIN</th>
                                        <th scope="col">PUNTOS</th>
                                        <th scope="col">CURSO</th>
                                        <th scope="col">ACCIONES</th>                                      
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="dato" items="${lista}">
                                            <tr>
                                                <td>${dato.idCuestionario}</td>
                                                <td> ${dato.getNombreMateria()}</td>
                                                <td>${dato.fechaInicio}</td>
                                                <td>${dato.fechaCierre}</td>
                                                <td>${dato.puntos}</td>
                                                <td>${dato.getNombreCurso()}</td>
                                                <td>
                                                      <form class="form-inline" action="ControllerRanking" method="POST">
                                                        <input type="hidden" name="idCuestionario" value="${dato.idCuestionario}">
                                                        <input type="hidden" name="puntos" value="${dato.puntos}">
                                                         <input type="hidden" name="Materia" value="${dato.getNombreMateria()}">
                                                        <button type="submit"  name="accion" value="RankingCuestionario" class="btn btn-info mr-1"  id="btnRC">Seleccionar Cuestionario</button>
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