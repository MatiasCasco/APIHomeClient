<%-- 
    Document   : agregarCuestionario
    Created on : 09/02/2021, 11:08:34 AM
    Author     : User
--%>
<%@page import="Consumir.Resteasy.RestMateria"%>
<%@page import="HomeClient.domain.model.Materia"%>
<%@page import="HomeClient.domain.model.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.RestCurso"%>
<%@page import="com.google.gson.Gson"%>
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
	
        
        
     
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/locales/bootstrap-datepicker.es.min.js" charset="UTF-8"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker3.css"/>
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
       
       
        <script>
        
            function validarFecha() {
              var fechaInicio = document.getElementById('fechaInicio').value;
              var fechaFin = document.getElementById('fechaFin').value;
              if(fechaFin < fechaInicio) {
                alert('Fecha final debe ser mayor a la inicial');
                return false;
              } else{
                return True;
              }  
            }
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
      <div class="mx-auto col-sm-9 main-section" id="myTab" role="tablist">
          <ul class="nav nav-tabs justify-content-end">
              <li class="nav-item">
                  <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Cuestionario</a>
              </li>
          </ul>              
          <div class="card">
              <div class="card-header">
                  <h4>Agregar Cuestionario</h4>
              </div>
              <div class="card-body">                     
                  <form class="form" action="ControllerCuestionario" id="ControllerCuestionario" method="POST" onsubmit=" return validarFecha();">
                      <%Gson json = new Gson();
                      RestMateria restMateria = new RestMateria();
                      ArrayList<Materia> lista2 = new ArrayList();
                      ArrayList valueM = restMateria.getMaterias(ArrayList.class);
                      for(Object pro: valueM){
                          Materia materias = json.fromJson(pro.toString(), Materia.class);
                          lista2.add(materias);                   
                      }%>   
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Seleccionar Materia</label>
                          <div class="col-lg-9">
                                <select name="materia" class="custom-select" required>
                                <option value="" selected disabled>Agregar Materia</option>
                                <%for(Materia elemento: lista2){%>               
                                <option value="<%=elemento.getIdMateria()%>"><%=elemento.getNombre()%></option>
                                <%}%>
                                </select>
                          </div>
                      </div>
                       <div class="form-group row">
                           <label class="col-lg-3 col-form-label form-control-label">Fecha Inicio</label>
                           <div class="col-lg-9">
                               <input id= "fechaInicio" name="txtFechaInicio" class="form-control" type="date" data-date-format="yyyy-mm-dd" required autofocus >
                           </div>
                       </div>
                       <div class="form-group row">
                           <label class="col-lg-3 col-form-label form-control-label">Fecha Cierre</label>
                           <div class="col-lg-9">
                               <input id= "fechafin" name="txtFechaCierre" class="form-control" type="date" data-date-format="yyyy-mm-dd" required autofocus >                          
                           </div>
                       </div>
                       <div class="form-group row">
                           <label class="col-lg-3 col-form-label form-control-label">Puntos</label>
                           <div class="col-lg-9">
                               <input  name="txtPuntos" class="form-control" type="number" value=0 required autofocus >
                           </div>
                       </div>
                       <div class="form-group row">
                           <label class="col-lg-3 col-form-label form-control-label">Tiempo Limite(hh:mm:ss)</label>
                           <div class="col-lg-9">
                                <input type="text" name="txtTiempoLimite" value="00:00:00">                                                    </div>
                           </div>                                                    
                           <input type="submit" name="accion" value="Guardar">
                    </form>
              </div>
           </div>
      </div>
    </body>
</html>