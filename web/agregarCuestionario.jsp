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
       
        
     
       
        <script>
        
            function validarFecha() {
              var fechaInicio = document.getElementById('fechaInicio').value;
              var fechaFin = document.getElementById('fechaFin').value;
              if(fechaFin < fechaInicio) {
                alert('Fecha final debe ser mayor a la inicial');
                return false;
              } else{
                return true;
              }  
            }
        </script>
        </head>
    <body>
       <!--===================BARRA DE NAVEGACION=======================-->
       <%@include file="navbar.jsp" %>    
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
                  <form class="form" action="ControllerCuestionario" id="ControllerCuestionario" method="POST" onsubmit="return validarFecha();">
                      <%
                      Gson json = new Gson();
                      RestMateria restMateria = new RestMateria();
                      ArrayList<Materia> lista2 = new ArrayList();
                      //HttpSession son = request.getSession();
                      ArrayList valueM; 
                      Persona us=(Persona) sesion.getAttribute("usuario");
                      if(us.getRol()==2){
                          String idProfesor = String.valueOf(us.getId());
                          valueM = restMateria.getMateriasProfesor(ArrayList.class,idProfesor);
                          
                      }else{
                          valueM = restMateria.getMaterias(ArrayList.class);
                      }
                      for(Object pro: valueM){
                          Materia materias = json.fromJson(pro.toString(), Materia.class);
                          lista2.add(materias);                   
                      }%>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Descripcion</label>
                          <div class="col-lg-9">
                              <input id="descripcion" name="txtDescripcion" class="form-control" type="text" required autofocus >
                         
                          </div>
                       </div>
                      <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Seleccionar Materia</label>
                          <div class="col-lg-9">
                                <select name="materia" class="custom-select" required>
                                <option value="" selected disabled>Agregar Materia</option>
                                <%for(Materia elemento: lista2){%>               
                                <option value="<%=elemento.getIdMateria()%>"><%=elemento.getNombreCurso()%> - <%=elemento.getNombre()%></option>
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
                               <input id= "fechaFin" name="txtFechaCierre" class="form-control" type="date" data-date-format="yyyy-mm-dd" required autofocus >                          
                           </div>
                       </div>
                       <div class="form-group row">
                           <div class="col-lg-9">
                               <input  name="txtPuntos" class="form-control" type="hidden" value=0>
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