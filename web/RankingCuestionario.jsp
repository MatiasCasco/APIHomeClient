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
            <div class="mx-auto col-sm-10 main-section justify-content-center" id="myTab" role="tablist">
                <ul class="nav nav-tabs justify-content-end">
                    <li class="nav-item">
                        <form  action="Controller Ranking" method="POST">
                            <input type="hidden" name="idC" value="${idCuestionario}">
                            <button type="submit" class="btn btn-info mr-1" name="accion" value="Reporte">Ver Reporte</button>
                                                       
                        </form>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <!--Lista de usuarios-->
                    <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                        <div class="card">
                            <ol class="breadcrumb">
                                      <li class="breadcrumb-item"><a href="ControllerMenuProfesor">Home</a></li>
                                      <li class="breadcrumb-item"><a href="ControllerRanking?accion=mostrarMaterias&idC=${idC}&nombreCurso=${nombreCurso}">${nombreCurso}/Materias</a></li>
                                       <li class="breadcrumb-item"><a href="ControllerRanking?accion=MostrarCuestionarios&idCurso=${idC}&nombreCurso=${nombreCurso}&idMateria=${idMateria}&Materia=${Materia}">${Materia}/Puntuaciones por Cuestionario</a></li>
                                      <li class="breadcrumb-item active" aria-current="page">Puntajes</li>
                            </ol>
                            <div class="card-header">
                                <h4>${materia}</h4>
			    </div>
                              <div class="card-body">
                               <div class="table-responsive justify-content-center">
                                <table id="userList" class="table table-bordered table-hover table-striped">
				    <thead class="thead-light">
				    <tr>
                                        <th scope="col">Pos</th>
                                        <th scope="col" > Nombre Apellido </th>
                                         <th scope="col" >Puntos</th>
                                        <th scope="col">       Porcentaje del Total:  ${PuntajeT} puntos </th>
                                    </tr>
                                    </thead>
                                    <tbody>                                      
                                      <%int i=0;%>
                                          <c:forEach var="dato" items="${lista}">
                                              <%i=i+1;%>
                                                <tr>
                                                    <th scope="col"><%= i %></th>
                                                    <td> ${dato.nombre} ${dato.apellido}</td>
                                                    <td scope="row"> <a href="ControllerRanking?accion=verRespuesta&idCuestionario=${idCuestionario}&idAlumno=${dato.id}&nombre=${dato.nombre}&apellido=${dato.apellido}&puntosObtenido=${dato.puntos}&puntoTotal=${PuntajeT}"> ${dato.puntos} </a> </td>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: ${dato.puntosObtenido}%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"> ${dato.puntosObtenido} %</div>
                                                        </div>
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
