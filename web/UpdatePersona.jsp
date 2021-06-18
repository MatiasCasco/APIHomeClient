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
	
         <style>           
            .enviar{background:#d25959;box-shadow:none;color:white;margin-bottom:0;width:100px}
            .enviar:hover{text-decoration:underline}
            span{display:block;font-size:.8em;margin:0px 0 10px;padding:5px 0 5px 11px;width:200px}
            .confirmacion{background:#C6FFD5;border:1px solid green;}
            .negacion{background:#ffcccc;border:1px solid red}
        </style>
        
        <script type="text/javascript">
	    $(document).ready(function() {
	        //Asegurate que el id que le diste a la tabla sea igual al texto despues del simbolo #
//	         $('select#rol').val(persona.getRol());
                $("#idCurso").hide();
                $('select#rol').on('change',function(){
                   
                var valor= $(this).val();
                if (valor!=="3" || valor != 4) {
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
        <%@include file="navbar.jsp" %>    
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
                                  <option value="4">Alumno Nuevo</option>
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
