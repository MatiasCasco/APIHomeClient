<%-- 
    Document   : menuTeacher
    Created on : Jun 7, 2021, 2:18:40 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="mx-auto col-sm-8 main-section" id="myTab" role="tablist">
                <ul class="nav nav-tabs justify-content-end">
			<li class="nav-item">
                            <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Calificaciones</a>
			</li>
			<li class="nav-item">
                            <a class="nav-link" id="form-tab" data-toggle="tab" href="#form" role="tab" aria-controls="form" aria-selected="true">Rankings</a>				   	
			</li>
		</ul>
                <div class="tab-content" id="myTabContent">
                    <!--Lista de usuarios-->
                    <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                        <div class="card">
                            <div class="card-header">
                                <h4>CALIFICACIONES</h4>
			    </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                 <table id="userList" class="table table-bordered table-hover table-striped">
				    <thead class="thead-light">
				    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Curso</th>
                                        
                                        <th> </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <!--c:forEach var="dato" items=""-->
                                            <tr>
                                                
                                                  <th scope="row">1</th>
                                                  <td>Primero Turno Mañana</td>
                                                  
                                                  <td>
                                                      <form action="" method="">
                                                          <a>
                                                          <i><input  type="submit" class="btn-info" name="action" value="Seleccionar Materia"></i></a>
                                                      </form>
                                                  </td>
                                              </tr>
                                          <!--/c:forEach-->
                                      </tbody>
                                 </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="form" role="tabpanel" aria-labelledby="form-tab">
                        <div class="card">
                            <div class="card-header">
				<h4>RANKINGS</h4>
			    </div>
                            <div class="card-body">
                               <div class="table-responsive">
                                 <table id="userList" class="table table-bordered table-hover table-striped">
				    <thead class="thead-light">
				    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Curso</th>
                                        
                                        <th> </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <!--c:forEach var="dato" items=""-->
                                            <tr>
                                                
                                                  <th scope="row">1</th>
                                                  <td>Primero Turno Mañana</td>
                                                  
                                                  <td>
                                                      <form action="" method="">
                                                          <a>
                                                          <i><input  type="submit" class="btn-info" name="action" value="Seleccionar Materia"></i></a>
                                                      </form>
                                                  </td>
                                              </tr>
                                          <!--/c:forEach-->
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
