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
                
                <div class="tab-content" id="myTabContent">
                    <!--Lista de usuarios-->
                    <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                        <div class="card">
                            <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                      <li class="breadcrumb-item"><a href="ControllerMenuProfesor">Home</a></li>
                                      <li class="breadcrumb-item active" aria-current="page">${nombreCurso}/Materias</li>
                                    </ol>
                                  </nav>
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
                                                            <input type="hidden" name="nombreCurso" value="${nombreCurso}">
                                                            <button type="submit"  name="accion" value="RankingGlobal" class="btn btn-info mr-1"  id="btnRG">Ranking Global de la materia</button>
                                                            <button type="submit"  name="accion" value="MostrarCuestionarios" class="btn btn-info mr-1"  id="btnRC">Puntuaciones por Cuestionarios</button>
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
