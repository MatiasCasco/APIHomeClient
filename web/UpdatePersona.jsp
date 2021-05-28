<%-- 
    Document   : UpdatePersona
    Created on : Feb 22, 2021, 1:45:59 PM
    Author     : HP
--%>

<%@page import="HomeClient.domain.model.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Nuestro css-->
	<link rel="stylesheet" type="text/css" href="css/user-form.css"
		th:href="@{/css/user-form.css}">
         <style>           
            .enviar{background:#d25959;box-shadow:none;color:white;margin-bottom:0;width:100px}
            .enviar:hover{text-decoration:underline}
            span{display:block;font-size:.8em;margin:0px 0 10px;padding:5px 0 5px 11px;width:200px}
            .confirmacion{background:#C6FFD5;border:1px solid green;}
            .negacion{background:#ffcccc;border:1px solid red}
        </style>
          <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script 
		src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script 
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	
        
        
        <script type="text/javascript">
	    $(document).ready(function() {
	        //Asegurate que el id que le diste a la tabla sea igual al texto despues del simbolo #
//	         $('select#rol').val(persona.getRol());
                $("#idCurso").hide();
                $('select#rol').on('change',function(){
                   
                var valor= $(this).val();
                if (valor!=="3") {
                    $("#idCurso").hide();
                } else {
                     $("#idCurso").show();
                }  

                 });
                $('#update').attr("disabled", true);
                var pass1 = $('[name=pass1]');
                var pass2 = $('[name=pass2]');
                var confirmacion = "Las contraseñas si coinciden";
                var negacion = "No coinciden las contraseñas";
                var vacio = "La contraseña no puede estar vacía";
                //oculto por defecto el elemento span
                var span = $('<span></span>').insertAfter(pass2);
                span.hide();
            //función que comprueba las dos contraseñas
                function coincidePassword(){
                    var valor1 = pass1.val();
                    var valor2 = pass2.val();
                    //muestro el span
                    span.show().removeClass();
                    //condiciones dentro de la función
                    if(valor1 != valor2){
                        span.text(negacion).addClass('negacion');
                        $('#update').attr("disabled", true);
                    }
                    if(valor1.length==0 || valor1==""){
                        span.text(vacio).addClass('negacion');
                        $('#update').attr("disabled", true);
                    }	
                    if(valor1.length!=0 && valor1==valor2){
                        span.text(confirmacion).removeClass("negacion").addClass('confirmacion');
                        $('#update').attr("disabled", false);
                    }
                }
            //ejecuto la función al soltar la tecla
                pass2.keyup(function(){
                coincidePassword();
            });
            });
	</script>
        
      
        
      
    </head>
    <body>
        <!--===================BARRA DE NAVEGACION=======================-->
        <nav class="navbar navbar-expand-lg navbar-dark  bg-dark"> 
            <a class="navbar-brand" href="#">Home Resident Admin</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>            
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    
                    <li class="nav-item">
                        <a class="nav-item nav-link active" href="ControllerUsuarios">Gestion de Usuarios</a>    
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link active dropdown-toggle" href="ControllerCuestionario" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Cuestionarios
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="ControllerCuestionario">CRUD Cuestionarios</a>
                            <a class="dropdown-item" href="agregarCuestionario.jsp">Agregar</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link active dropdown-toggle" href="ControllerCurso" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Cursos
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="ControllerCurso">Gestion de Cursos</a>
                            <a class="dropdown-item" href="agregarCurso.jsp">Agregar</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link active dropdown-toggle" href="ControllerMateria" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Materias
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="ControllerMateria">Gestion de Materias</a>
                            <a class="dropdown-item" href="agregarMateria.jsp">Agregar</a>
                        </div>
                    </li>                                     
                 
                </ul>   
                <form class="form-inline my-2 my-lg-0" action="ControllerLogg" method="POST">                           
                    <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" name="accion" value="Cerrar Sesion">Cerrar Sesion</button>
                </form>   
            </div>
        </nav>
      <!-- -->
 
        
        
        
        
        
        <% Persona persona = (Persona) request.getAttribute("persona");%>
        
         <div class="mx-auto col-sm-9 main-section" id="myTab" role="tablist">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">User</a>
		</li>
            </ul>
                    
          <div class="card">
              <div class="card-header">
                  <h4>Update User</h4>
              </div>        
              <div class="card-body"><!--action="UserFormServlet" -->
                  
                  <form class="form" method="POST" role="form" action="ControllerUsuarios" >
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Nombre</label>
                          <div class="col-lg-9">
                              <input name="nombre" class="form-control" type="text" value=<%=persona.getNombre()%> required autofocus >
                          </div>
                      </div>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label" >Apellido</label>
                          <div class="col-lg-9">
                              <input name="apellido" class="form-control" type="text" value=<%=persona.getApellido()%> required autofocus>
                          </div>
                      </div>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Email</label>
                          <div class="col-lg-9">
                              <input name="email" class="form-control" type="email" value=<%=persona.getEmail()%> required autofocus>
                          </div>
                      </div>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">LoginName</label>
                          <div class="col-lg-9">
                              <input name="loginName" class="form-control" type="text" value=<%=persona.getLoginName()%> required autofocus>
                          </div>
                      </div>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Escribe la contraseña</label>
                          <div class="col-lg-9">
                              <input type="password" name="pass1" autofocus="autofocus"  placeholder="Escriba la contraseña" value=<%=persona.getPassword()%> />
                          </div>
                      </div>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Vuelve a escribir la contraseña</label>
                          <div class="col-lg-9">
                              <input type="password" name="pass2" placeholder="Vuelva a escribir la contraseña" value=<%=persona.getPassword()%> />
                          </div>
                      </div>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Rol</label>
                          <div class="col-lg-9">
                              <select name = "rol" id="rol" >
                                  <option value="2">Profesor</option>
                                  <option value="3">Alumno</option>
                                  <option value="1">Administrador</option>
                              </select>
                              <script>
                                  document.ready=document.getElementById("rol").value=<%=persona.getRol()%> ;
                              </script>
                          </div>
                      </div>
                      <div class="form-group row" id="idCurso" >
                          <label class="col-lg-3 col-form-label form-control-label" >IdCurso</label>
                          <div class="col-lg-9">
                              <input type="text" name="idCurso" value=<%=persona.getIdCurso()%> >
                          </div>
                      </div>
                      <input type="hidden" name="id" value=<%=persona.getId()%> >
                      <input type="submit" name="action" value="update" id="update"/>
                  </form>
              </div>
          </div>
      </div>
    </body>
</html>
