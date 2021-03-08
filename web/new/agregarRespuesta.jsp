<%-- 
    Document   : agregarRespuesta
    Created on : 17/09/2020, 04:38:24 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!-- Nuestro css-->
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
	
        
    </head>
    <body>
           <div class="mx-auto col-sm-9 main-section" id="myTab" role="tablist">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Respuesta</a>
		</li>
            </ul>
                    
          <div class="card">
              <div class="card-header">
                  <h4>Agregar Nueva Respueta</h4>
              </div>        
              <div class="card-body"><!--action="UserFormServlet" -->
                  
                  <form class="form"  role="form" action="ControllerRespuesta" method="POST" >
                       <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Respuesta</label>
                          <div class="col-lg-9">
                              <input type="text" name="txtRespuesta" class="form-control"  required autofocus >
                         
                          </div>
                       </div>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Identificador Pregunta</label>
                          <div class="col-lg-9">
                              <input  name="txtIdP" class="form-control" type="text" required autofocus >
                         
                          </div>
                       </div>
                       <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Evaluacion</label>
                         
                       </div>
                       <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Rta Correcta</label>
                          <div class="col-lg-9">
                              <input type="checkbox" name="Bool" value="True">
                             </div>
                       </div>
                    
                    <input type="submit" name="accion" value="Guardar">
                       
                  </form>
              </div>
          </div>
      </div>
        
      
    </body>
</html>
