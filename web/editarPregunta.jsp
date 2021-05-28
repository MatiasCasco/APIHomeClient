<%-- 
    Document   : editar
    Created on : 03/09/2020, 10:58:06 PM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Cuestionario"%>
<%@page import="Consumir.Resteasy.RestCuestionario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
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
 
        <% 
            boolean icono = false;
            try {
                icono = (Boolean) request.getAttribute("row");
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        %>
        <% Pregunta pre = (Pregunta) request.getAttribute("pregunta");%>
        
         <%///lista de cuestionarios  
            Gson json = new Gson();
            RestCuestionario restCurso = new RestCuestionario();
            ArrayList<Cuestionario> lista = new ArrayList();
            ArrayList value = restCurso.getCuestionarios(ArrayList.class);
            for(Object pro: value){
                Cuestionario cuestionario = json.fromJson(pro.toString(), Cuestionario.class);
                
                lista.add(cuestionario);                   
            }
        %> 
        
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
              <div class="card-body">
                   <form class="form"  role="form" action="ControllerImagenPregunta" method="POST" enctype="multipart/form-data" >
                        <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Pregunta</label>
                          <div class="col-lg-9">
                              <input name="txtPregunta" class="form-control" type="text" value= <%=pre.getPregunta()%> required >
                          </div>
                       </div>
                       <div class="form-group row">
                           <label class="col-lg-3 col-form-label form-control-label">Seleccionar Cuestionario</label>
                           <div class="col-lg-9">                         
                               <select name="txtIdentificador" class="custom-select" id="selectC"required>
                                   <option value="" selected disabled>Cuestionario</option>
                                   <%for( Cuestionario elemento: lista){%>               
                                   <option value="<%=elemento.getIdCuestionario()%>">#<%=elemento.getIdCuestionario()%> <%=elemento.getNombreCurso()%> - <%=elemento.getNombreMateria()%></option> 
                                   <%}%>
                               </select>
                           </div>
                       </div>
                        <script>
                            document.ready=document.getElementById("selectC").value=<%=pre.getIdCuestionario()%> ;
                        </script>
                       <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Punto Asignado</label>
                          <div class="col-lg-9">
                              <input type="number" name="txtPuntoAsignado" min="1" max="100" class="form-control"  value="<%=pre.getPuntoAsignado()%>"  >
                          </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Punto Obtenido</label>
                            <div class="col-lg-9">
                                <input  type="number" name="txtPuntoObtenido" class="form-control" value=<%=pre.getPuntoObtenido()%>  max="100" required autofocus >                          
                            </div>
                        </div>
                        
                        <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Cambiar Imagen</label>
                          <div class="col-lg-6">                           
                              <%if (icono) {%>
                              <img src = "Imagen?id=<%=pre.getIdPregunta() %>" width="250" height="230">                            
                            <!--a href="Imagen?id=<!%out.print(pre.getIdPregunta()); %>" target="_blank"> Ver Imagen</a-->
                            <%} else {
                                  out.print("Sin Imagen");
                            }%>
                            <input type="file" name="fichero" class="form-control" >  
                         </div>
                       </div>
                        <input type="hidden" name="txtId" value=<%=pre.getIdPregunta()%>>
                        <input type="submit" name="accion" value="Actualizar">
                    </form>
              </div>
          </div>
      </div>
    </body>
</html>
