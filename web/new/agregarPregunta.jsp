<%-- 
    Document   : Pagina2
    Created on : 24-jul-2020, 9:43:10
    Author     : Matias
--%>

<%@page import="HomeClient.domain.model.Pregunta"%>
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
                    <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Pregunta</a>
		</li>
            </ul>
                    
          <div class="card">
              <div class="card-header">
                  <h4>Agregar NuevaPregunta</h4>
              </div>        
              <div class="card-body"><!--action="UserFormServlet" -->
                  
                  <form class="form"  role="form" action="ControllerImagenPregunta" method="POST" enctype="multipart/form-data" >
                       <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Pregunta</label>
                          <div class="col-lg-9">
                              <input name="txtPregunta" class="form-control" type="text" required autofocus >
                         
                          </div>
                       </div>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Identificador Cuestionario</label>
                          <div class="col-lg-9">
                              <input  name="txtIdentificador" class="form-control" type="text" required autofocus >
                         
                          </div>
                       </div>
                       <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Punto Asignado</label>
                          <div class="col-lg-9">
                              <input name="txtPuntoAsignado" class="form-control" type="txt" required autofocus >
                          </div>
                       </div>
                       <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Punto Obtenido</label>
                          <div class="col-lg-9">
                             <input name="txtPuntoObtenido"class="form-control" type="txt"  required autofocus >                          
                          </div>
                       </div>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Imagen</label>
                          <div class="col-lg-6">
                              <input type="file" name="fichero" class="form-control"   >
                         
                          </div>
                       </div>
                    <input type="submit" name="accion" value="Guardar">
                       
                  </form>
              </div>
          </div>
      </div>
        
    
    </body>
</html>
