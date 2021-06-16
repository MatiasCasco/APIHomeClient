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
          
      
    </head>
    <body>
         <!--===================BARRA DE NAVEGACION=======================-->
        <%@include file="navbar.jsp" %>    
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
                  <h4>Actualizar Pregunta</h4>
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
                        <input type="hidden" name="Cuestionario" value=<%=request.getAttribute("idC")%>>
                        <input type="hidden" name="txtId" value=<%=pre.getIdPregunta()%>>
                        <input type="submit" name="accion" value="Actualizar">
                    </form>
              </div>
          </div>
      </div>
    </body>
</html>
