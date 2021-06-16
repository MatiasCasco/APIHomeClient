<%-- 
    Document   : Login
    Created on : 12/11/2019, 09:29:22 AM
    Author     : Matias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <!--JQUERY-->
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
	        
                  //$("#msglogout").hide();
                 // $("#msgerror").hide();                 
                   
               
            });
	</script>
                  
                
    <!-- Los iconos tipo Solid de Fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
    <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

    <!-- Nuestro css-->
	<link rel="stylesheet" type="text/css" href="css/index.css">
        <!--link rel="stylesheet" type="text/css" href="css/index.css"
		th:href="@{/index.css}"-->
	
        <title>lOGGIN USER</title>
    </head>
    <body>
      <div class="modal-dialog text-center">
        <div class="col-sm-8 main-section">
            <div class="modal-content">
                <div class="col-12 user-img">
                    <img src="img/user.png"/>
                    <!img src="img/user.png" th:src="@{/user.png}"/>
                </div>
                <form class="col-12" action="ControllerLogg" method="POST">
                    <div class="form-group" id="user-group">
                        <input type="text" class="form-control" placeholder="Nombre de usuario" name="username"/>
                    </div>
                    <div class="form-group" id="contrasena-group">
                        <input type="password" class="form-control" placeholder="Contrasena" name="password"/>
                    </div>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i>  Ingresar </button>
                </form>
                <div class="col-12 forgot">
                    <a href="#">Recordar contrasena?</a>
                </div>
                <%String error;
                        error=(String) request.getAttribute("error");
                  if(error!=null){%>
                <div id="msgerror" class="alert alert-danger" role="alert" >
		           ${error} 
		</div>
                <% } %>
                
                 <% String  logout=(String) request.getAttribute("logout");
                  if(logout!=null){%>
                  <div id="msglogout" class="alert alert-success" role="alert">
		           Sesion Cerrada.
		</div>
                <% } %>
		
            </div>
        </div>
    </div>
</body>
</html>
