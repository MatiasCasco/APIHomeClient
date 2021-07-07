<%-- 
    Document   : editarCurso
    Created on : 30/10/2020, 03:16:04 PM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Persona"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.PersonaCliente"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="HomeClient.domain.model.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   
        
    </head>
    <body>
         <!--===================BARRA DE NAVEGACION=======================-->
        <%@include file="navbar.jsp" %>    
        <!-- -->
 
        <div class="mx-auto col-sm-9 main-section" id="myTab" role="tablist">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Curso</a>
		</li>
            </ul>
                    
          <div class="card">
              <div class="card-header">
                  <h4>Editar Curso</h4>
              </div>        
              <div class="card-body">
                  <form class="form"  role="form" action="ControllerCurso" method="POST">
                        <% Curso curso = (Curso) request.getAttribute("curso");%>
                        <label>Identificador Curso: <%=curso.getIdCurso()%></label>
                        <input type="hidden" name="txtIdC"  value="<%=curso.getIdCurso()%>">
                        
                        <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Nombre Curso</label>
                          <div class="col-lg-9">
                              <input id="nombre" name="txtNombreCurso" class="form-control" type="text" value=<%=curso.getNombre()%> required autofocus >

                          </div>
                       </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Profesor</label>
                            <div class="col-lg-9">
                                <%if (usu.getRol()!=2){  
                                    Gson json = new Gson();
                                    PersonaCliente prod = new PersonaCliente ();
                                    ArrayList value = prod.getProfesores(ArrayList.class);%>      
                                 <select name="txtIdProfesor" class="custom-select" id="selectP" required>
                                     <option value="" selected disabled>Seleccionar Profesor</option>
                                     <%for(Object pro: value){Persona p = json.fromJson(pro.toString(), Persona.class);%>
                                     <option value="<%=p.getId()%>"><%=p.getId()%>) <%=p.getNombre()%>, <%=p.getApellido()%> </option>
                                     <%} prod.close();%>
                                 </select>
                                 <%}else{%>
                               <label class="col-lg-3 col-form-label form-control-label"><%=usu.getId()%>) <%=usu.getNombre()%> <%=usu.getApellido()%></label>
                              <input type="hidden" name="txtIdProfesor" value="<%=usu.getId()%>" >
                               <%}%>
                                 <script>
                                     document.ready=document.getElementById("selectP").value=<%=curso.getIdProfesor()%> ;
                                 </script>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Clave Profesor</label>
                            <div class="col-lg-9">
                                <input type="text" name="txtClaveProfesor" value="<%=curso.getClaveProfesor()%>" class="form-control"  required autofocus >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Clave Alumno</label>
                            <div class="col-lg-9">
                                <input  name="txtClaveAlumno" class="form-control" value="<%=curso.getClaveAlumno()%>" type="text" required autofocus >
                            </div>
                        </div>               
                            <input type="submit" name="accion" value="Actualizar">
                  </form>
              </div>
          </div>
      </div>
    </body>
</html>
