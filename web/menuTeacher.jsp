<%-- 
    Document   : menuTeacher
    Created on : Jun 7, 2021, 2:18:40 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
       
        
                
    </head>
    <body>
        <%@include file="navbar.jsp" %>    
        <%HttpSession Sesion = request.getSession();
          Persona usuario=(Persona) Sesion.getAttribute("usuario");
          String Nombre= usuario.getNombre();          
         %>
       
       <div class="jumbotron">  
           <center><h1 class="display-6"><b>Bienvenido/a Profe: ${usuario.getNombre()}</b> </h1>
           <p class="lead">En Home Resident tendrás una herramienta de apoyo para tus clases!.</p>
           <hr class="my-4"></center> 
            <div class="container">
            <div class="mx-auto col-sm-10 main-section" id="myTab" role="tablist">
                <ul class="nav nav-tabs justify-content-end">
			<li class="nav-item">
                            <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Calificaciones</a>
			</li>
		
		</ul>
                <div class="tab-content" id="myTabContent">
                    <!--Lista de usuarios-->
                    <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                        <div class="card">
                            <div class="card-header">
                                <h4>${Nombre}</h4>
			    </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                 <table id="userList" class="table table-bordered table-hover table-striped">
				    <thead class="thead-light">
				    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">NOMBRE CURSO</th>
                                        <th scope="col">PROFESOR</th>
                                        <th scope="col">ACCIONES</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="dato" items="${lista}">
                                                <tr>
                                                    <td>${dato.idCurso}</td>
                                                    <td>${dato.nombre}</td>
                                                    <td>${Nombre}</td>
                                                    <td>
                                                        <form action="ControllerMenuProfesor" class="form-inline" method="POST">
                                                            <input type="hidden" name="idC" value="${dato.idCurso}">
                                                            <input type="hidden" name="nombreCurso" value="${dato.nombre}">
                                                            <button type="submit" class="btn btn-info mr-1" name="accion" value="Ranking"> Ver Ranking</button>
                                                            <!--button type="submit" class="btn btn-info mr-1" name="accion" value="Calificaciones">Calificaciones de Cuestionarios</button-->
                                                            
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
        </div>   
      
    
</body>
</html>
