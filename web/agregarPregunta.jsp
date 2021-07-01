<%-- 
    Document   : Pagina2
    Created on : 24-jul-2020, 9:43:10
    Author     : Matias
--%>

<%@page import="HomeClient.domain.model.Cuestionario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.RestCuestionario"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="HomeClient.domain.model.Pregunta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
     
      
    </head>
    <body>
         
        <%  
            Gson json = new Gson();
            RestCuestionario restCurso = new RestCuestionario();
            ArrayList<Cuestionario> lista = new ArrayList();
            ArrayList value = restCurso.getCuestionarios(ArrayList.class);
            for(Object pro: value){
                Cuestionario cuestionario = json.fromJson(pro.toString(), Cuestionario.class);
                
                lista.add(cuestionario);                   
            }
        %> 
        
        
       <!--===================BARRA DE NAVEGACION=======================-->
       <%@include file="navbar.jsp" %>    
      <!-- -->
 
        
    <div class="mx-auto col-sm-9 main-section" id="myTab" role="tablist">
            <ul class="nav nav-tabs justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Pregunta</a>
		</li>
            </ul>
                    
          <div class="card">
              <div class="card-header">
                  <h4>Agregar NuevaPregunta al cuestionario: #${idC}</h4>
                 
              </div>        
              <div class="card-body">
                   <form class="form"  role="form" action="ControllerImagenPregunta" method="POST" enctype="multipart/form-data" >
                         <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Pregunta</label>
                          <div class="col-lg-9">
                              <input name="txtPregunta" class="form-control" type="text" required autofocus >
                         
                          </div>
                       </div>
                       <div class="form-group row">
                           <label class="col-lg-3 col-form-label form-control-label">Seleccionar Cuestionario</label>
                           <div class="col-lg-9">                         
                               <select id="selectC" name="txtIdentificador" class="custom-select" required>
                                   <option value="" selected disabled>Cuestionario</option>
                                   <%for( Cuestionario elemento: lista){%>               
                                   <option value="<%=elemento.getIdCuestionario()%>">#<%=elemento.getIdCuestionario()%> <%=elemento.getNombreCurso()%> - <%=elemento.getNombreMateria()%></option> 
                                   <%}%>
                               </select>
                               <script>
                                   document.ready=document.getElementById("selectC").value= ${idC};
                                </script>
                           </div>
                       </div>
        
            
                        
                        <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Punto Asignado</label>
                          <div class="col-lg-9">
                              <input type="number" name="txtPuntoAsignado" min="1" max="100" class="form-control" required autofocus >
                          </div>
                        </div>
                        <div class="form-group row">
                            
                                
                       </div>
                        <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Imagen</label>
                          <div class="col-lg-6">
                              <input type="file" name="fichero" class="form-control"   >                         
                          </div>
                       </div>
            <input  type="hidden" name="txtPuntoObtenido"  value="0" >
            <input type="hidden" name="Cuestionario" value="${idC}">                    
            <input type="submit" name="accion" value="Guardar">
        </form>
              </div>
          </div>
      </div>
        
    </body>
</html>
