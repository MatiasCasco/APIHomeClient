<%-- 
    Document   : editarRespuesta
    Created on : 05/10/2020, 10:38:00 AM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Pregunta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.RestPregunta"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="HomeClient.domain.model.Respuesta"%>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
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
            </div>
        </nav>
      <!-- -->
        <%  
            Gson json = new Gson();
            RestPregunta restPregunta = new RestPregunta();
            ArrayList<Pregunta> lista = new ArrayList();
            ArrayList value = restPregunta.getPreguntas(ArrayList.class);
            for(Object pro: value){
                Pregunta pregunta = json.fromJson(pro.toString(), Pregunta.class);
                lista.add(new Pregunta(pregunta.getIdPregunta(), pregunta.getIdCuestionario(), pregunta.getPuntoAsignado(), pregunta.getPuntoObtenido(), pregunta.getPregunta()));                   
            }
        %> 
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
                <div class="card-body">
                       <form class="form"  role="form" action="ControllerRespuesta" method="POST" >
                        
                        <% Respuesta rta = (Respuesta) request.getAttribute("respuesta");%>
                        <div class="form-group row">
                            <label class="col-lg-5 col-form-label form-control-label">Identificador Cuestionario:<%=rta.getIdCuestionario()%></label>
                            <div class="col-lg-9">
                                <input type="hidden" name="txtIdC" class="form-control" value="<%=rta.getIdCuestionario()%>" >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Seleccionar Pregunta</label>
                            <div class="col-lg-9">
                                <select name="pregunta" class="custom-select" id="selectP"required>
                                    <option value="" selected disabled>Agregar pregunta</option>
                                    <%for(Pregunta elemento: lista){%>               
                                    <option value="<%=elemento.getIdPregunta()%>"><%=elemento.getPregunta()%></option>
                                    <%}%>
                                </select>
                                <script>
                                     document.ready=document.getElementById("selectP").value=<%=rta.getIdPregunta()%> ;
                                </script>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-5 col-form-label form-control-label"> Identificador Respuesta: <%=rta.getIdRta()%></label>
                            <div class="col-lg-9">
                                <input type="hidden"  class="form-control"  name="txtIdRta"  value= "<%=rta.getIdRta()%>" >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Respuesta</label>
                            <div class="col-lg-9">
                                <input type="text" name="txtRespuesta" class="form-control" value=<%=rta.getRespuesta()%> required autofocus >                        
                            </div>
                        </div>
                       <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Evaluacion:</label>                         
                        </div>
                        <label>Rta Correcta</label>
                        <input type="checkbox" name="Bool" value="True" <%if(rta.getEvaluacion()){%> checked <%} %>>           
                        <input type="submit" name="accion" value="Actualizar">
                    </form>
                </div>
            </div>
        </div>
   
    </body>
</html>
