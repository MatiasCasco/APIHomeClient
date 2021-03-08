<%-- 
    Document   : editarCuestionario
    Created on : 30/10/2020, 12:25:08 PM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Materia"%>
<%@page import="Consumir.Resteasy.RestMateria"%>
<%@page import="HomeClient.domain.model.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.RestCurso"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="HomeClient.domain.model.Cuestionario"%>
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
                        <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Cuestionario</a>
                    </li>
            </ul>              
            <div class="card">
                <div class="card-header">
                    <h4>Editar Cuestionario</h4>
                </div>
                <div class="card-body"> 
                    <form class="form" action="ControllerCuestionario" method="POST" >
                       <% Cuestionario cuestionario = (Cuestionario) request.getAttribute("cuestionario");%>
                       <label>Identificador Cuestionario: <%=cuestionario.getIdCuestionario()%></label>
                       <input type="hidden" name="txtIdC"  value="<%=cuestionario.getIdCuestionario()%>">
                            <%  
                                 Gson json = new Gson();
                                 RestMateria restMateria = new RestMateria();
                                 ArrayList<Materia> lista2 = new ArrayList();
                                 ArrayList valueM = restMateria.getMaterias(ArrayList.class);
                                 for(Object pro: valueM){
                                     Materia materias = json.fromJson(pro.toString(), Materia.class);
                                     lista2.add(materias);                   
                                 }
                                 %>   
                       <div class="form-group row">
                           <label class="col-lg-3 col-form-label form-control-label">Seleccionar Materia</label>
                           <div class="col-lg-9">
                               <select name="materia" class="custom-select" required>                               
                                   <%for(Materia elemento: lista2){%><option value="<%=elemento.getIdMateria()%>"><%=elemento.getNombre()%></option><%}%>
                               </select>
                               <script>document.ready=document.getElementById("selectP").value=<%=cuestionario.getIdMateria()%></script>                                                             
                           </div>
                       </div>
                       <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Fecha Inicio</label>
                                <div class="col-lg-9">
                                    <input id= "fechaInicio" name="txtFechaInicio" class="form-control" type="date" data-date-format="yyyy-mm-dd" value=<%=cuestionario.getFechaInicio()%> required autofocus >
                                </div>
                       </div>
                       <div class="form-group row">
                           <label class="col-lg-3 col-form-label form-control-label">Fecha Cierre</label>
                           <div class="col-lg-9">
                               <input id= "fechafin" name="txtFechaCierre" class="form-control" type="date" data-date-format="yyyy-mm-dd" value=<%=cuestionario.getFechaCierre()%> required autofocus >                          
                           </div>
                       </div>
                       <div class="form-group row">
                           <label class="col-lg-3 col-form-label form-control-label">Puntos</label>
                           <div class="col-lg-9">
                               <input  name="txtPuntos" class="form-control" type="number" value=<%=cuestionario.getPuntos()%> required autofocus >
                           </div>
                       </div>                
                       <div class="form-group row">
                           <label class="col-lg-3 col-form-label form-control-label">Tiempo Limite(hh:mm:ss)</label>
                           <div class="col-lg-9">
                               <input type="text" name="txtTiempoLimite" value=<%=cuestionario.getTiempoLimite()%>>                     
                           </div>
                       </div>
                                             
                       <input type="submit" name="accion" value="Actualizar">
                    </form>
                 </div>
             </div>
        </div>
    </body>
</html>
