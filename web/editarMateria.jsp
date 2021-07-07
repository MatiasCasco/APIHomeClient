<%-- 
    Document   : editarMateria
    Created on : 01/03/2021, 09:51:48 AM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.Curso"%>
<%@page import="Consumir.Resteasy.RestCurso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.RestMateria"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="HomeClient.domain.model.Materia"%>
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
         <%-- Curso --%>
        <%  
            Gson json = new Gson();
            RestCurso restCurso = new RestCurso();
            ArrayList<Curso> lista = new ArrayList();
            ArrayList value;
            if (usu.getRol()==2){
             String idProfesor=String.valueOf(usu.getId());
             value = restCurso.CursosfindIdProf(ArrayList.class,idProfesor);
            }else{
                value = restCurso.getCursos(ArrayList.class);
            }
            for(Object pro: value){
                Curso cursos = json.fromJson(pro.toString(), Curso.class);
                lista.add(cursos);                   
            }
        %> 
       
        <div class="mx-auto col-sm-9 main-section" id="myTab" role="tablist">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Materia</a>
                </li>
            </ul>            
            <div class="card">
                <div class="card-header">
                    <h4>Editar Materia</h4>
                </div>        
                <div class="card-body">
                    <form class="form"  role="form" action="ControllerMateria" method="POST">
                        <% Materia materia = (Materia) request.getAttribute("materia");%>
                                              
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Identificador Materia: <%=materia.getIdMateria()%></label>
                            <div class="col-lg-9">
                                <input type="hidden" name="txtIdM"  value="<%=materia.getIdMateria()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                             <label class="col-lg-3 col-form-label form-control-label">Nombre Materia</label>
                             <div class="col-lg-9">
                                 <input class="form-control"  type="text" name="nombreMateria" value= <%=materia.getNombre()%> required autofocus>
                             </div>
                        </div>
                        <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Seleccionar Curso</label>
                          <div class="col-lg-9">                         
                              <select name="curso" class="custom-select" id="selectC" required>
                                  
                                  <%for(Curso elemento: lista){%>               
                                  <option value="<%=elemento.getIdCurso()%>">#<%=elemento.getIdCurso()%> <%=elemento.getNombre()%> prof:<%=elemento.getNombreProfesor()%></option>
                                  <%}%>
                              </select>
                              <script>
                                     document.ready=document.getElementById("selectC").value= <%=materia.getIdCurso()%> ;
                              </script>
                          </div>
                         </div>
                        
                        <input type="submit" name="accion" value="Actualizar">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
