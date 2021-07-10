<%-- 
    Document   : crudCurso
    Created on : 30/10/2020, 03:15:14 PM
    Author     : Matias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
     
   

    </head>
    <body>
        
      <!--===================BARRA DE NAVEGACION=======================-->
       <%@include file="navbar.jsp" %>    
      <!-- -->
 
        
        <div class="container">
            <div class="mx-auto col-sm-15 main-section" id="myTab" role="tablist">
                <ul class="nav nav-tabs justify-content-end">
			<li class="nav-item">
                            <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Curso</a>
			</li>
			
		</ul>
                <div class="tab-content" id="myTabContent">
                    <!--Lista de Cuestionarios-->
                    <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                        <div class="card">
                            <div class="card-header">
                                <h4>Lista de Cursos</h4>
                                 <form class="form-inline" action="ControllerCurso" method="POST">
                                    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" name="accion" value="Nuevo">
                                </form>
			    </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="userList" class="table table-bordered table-hover table-striped">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">ID CURSO</th>
                                                <th scope="col">NOMBRE</th>
                                                <th scope="col">PROFESOR</th>
                                                <!--th scope="col">CLAVE PROFESOR</th>
                                                <th scope="col">CLAVE ALUMNO</th-->
                                                <th scope="col">ACCIONES</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="dato" items="${lista}">
                                                <tr>
                                                    <td>${dato.idCurso}</td>
                                                    <td>${dato.nombre}</td>
                                                    <td>${dato.nombreProfesor}</td>
                                                    <!--td>$ {dato.claveProfesor}</td>
                                                    <td>$ {dato.claveAlumno}</td-->
                                                    <td>
                                                        <form action="ControllerCurso" class="form-inline" method="POST">
                                                            <input type="hidden" name="txtid" value="${dato.idCurso}">
                                                            <input  type="submit" class="btn-info" name="accion" value="Materias">
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
