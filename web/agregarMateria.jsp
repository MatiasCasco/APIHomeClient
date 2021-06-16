<%-- 
    Document   : agregarMateria
    Created on : 01/03/2021, 09:47:57 AM
    Author     : User
--%>

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
      
        
    </head>
    <body>
        
      <!--===================BARRA DE NAVEGACION=======================-->
       <%@include file="navbar.jsp" %>    
      <!-- -->
 
        <%  
            Gson json = new Gson();
            RestCurso restCurso = new RestCurso();
            ArrayList<Curso> lista = new ArrayList();
            ArrayList value = restCurso.getCursos(ArrayList.class);
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
                     <h4>Agregar Materia</h4>
                 </div>        
                 <div class="card-body">
                     <form class="form"  role="form" action="ControllerMateria" method="POST">
                         <div class="form-group row">
                             <label class="col-lg-3 col-form-label form-control-label">Nombre Materia</label>
                             <div class="col-lg-9">
                                 <input type="text" name="nombreMateria" class="form-control"  required >
                             </div>
                         </div>
                         <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Seleccionar Curso</label>
                          <div class="col-lg-9">                         
                              <select name="curso" class="custom-select" required>
                                  <option value="" selected disabled>Agregar Curso</option>
                                  <%for(Curso elemento: lista){%>               
                                  <option value="<%=elemento.getIdCurso()%>"><%=elemento.getNombre()%></option>
                                  <%}%>
                              </select>
                          </div>
                         </div>
                         <input type="submit" name="accion" value="Guardar">
                    </form>
                </div>
          </div>
      </div>
    </body>
</html>
