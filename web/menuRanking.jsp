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
                                <h4>${nombreCurso}</h4>
			    </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                 <table id="userList" class="table table-bordered table-hover table-striped">
				    <thead class="thead-light">
				    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">NOMBRE</th>
                                        <th scope="col">ACCIONES</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="dato" items="${lista}">
                                                <tr>
                                                    <td>${dato.idMateria}</td>
                                                    <td>${dato.nombre}</td>
                                                    
                                                    <td>
                                                        <form class="form-inline" action="ControllerRanking" method="POST">
                                                            <input type="hidden" name="idMateria" value="${dato.idMateria}">
                                                            <input type="hidden" name="Materia" value="${dato.nombre}">
                                                            <input type="hidden" name="idCurso" value="${dato.idCurso}">
                                                            <button type="submit"  name="accion" value="RankingGlobal" class="btn btn-info mr-1"  id="btnRG">Ranking Global de la materia</button>
                                                            <button type="submit"  name="accion" value="MostrarCuestionarios" class="btn btn-info mr-1"  id="btnRC">Ranking por Cuestionarios</button>
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
