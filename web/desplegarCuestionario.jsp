<%-- 
    Document   : crudCuestionario
    Created on : 05/10/2020, 08:56:58 PM
    Author     : User
--%>
<%@page import="HomeClient.domain.model.Test"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
  

                
    </head>
    <body>
        
          <!--cabecera narvar-->
       <!--===================BARRA DE NAVEGACION=======================-->
       <%@include file="navbar.jsp" %>    
      <!-- -->
 
     
          <div class="container">
                
               
            <div class="mx-auto col-sm-15 main-section" id="myTab" role="tablist">
                <ul class="nav nav-tabs justify-content-end">
			<li class="nav-item">
                            <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Cuestionarios</a>
			</li>
			
		</ul>
                <div class="tab-content" id="myTabContent">
                    <!--Lista de Cuestionarios-->
                    <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
                        <div class="card">
                            <div class="card-header">
                                <h4>Cuestionarios: ${idAlumno} </h4>
                                
			    </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="userListh" class="table table-bordered table-hover table-striped">
				    <thead class="thead-light">
				   
                                        <div class="row">
                                            <div class="col-md-10"><th scope="col">Preguntas</th></div>
                                        </div>
                                     
                                    </thead>
                                    <tbody>
                                        <% List<String> options;
                                        int i=0;%>
                                        <c:forEach var="dato" items="${lista}">
                                            <%  ArrayList<Test> a =(ArrayList<Test>) request.getAttribute("lista");
                                                Test t = a.get(i);
                                                int correcta=t.getAnswer().get(0);
                                                options = t.getOptions();
                                                i=i+1;
                                            %>
                                            <tr>
                                                <td><img src = "Imagen?id=${dato.idquestion}" width="250" height="230"></td>
                                                
                                            </tr>
                                            <tr>
                                                <td><h5><b> ${dato.question}</b></h5></td>
                                                
                                            </tr>
                                            
                                            <tr>
                                                <td>
                                                    <% int s=0;
                                                       String Correctas="\"";
                                                    for(String r : options){%>
                                                    <div class="custom-control custom-radio">                                                        
                                                        <%String id="defaultCheckedDisabled"+s;
                                                            if(t.getMarcadas().contains(s) ){%>
                                                               <input type="radio" class="custom-control-input" id= ${id}   name = "disabledGroupExample" checked disabled>
                                                               <label class="custom-control-label" for="defaultCheckedDisabled2"><%=r%></label>
                                                                <%if(t.getAnswer().contains(s) ){%><img src = "img/correct.png" width="20" height="20"><%}else{%><img src = "img/incorrect.png" width="20" height="20"><%}%>                                        
                                                            <%}else{%>
                                                                <input type="radio" class="custom-control-input" id= ${id}   name = "disabledGroupExample"  disabled>
                                                                <label class="custom-control-label" for="defaultCheckedDisabled2"><%=r%></label></label>
                                                          <%}
                                                            if(t.getAnswer().contains(s) ){	
								Correctas=Correctas+r+"\", ";
                                                            }                                                            
                                                            s=s+1;%>   
                                                      </div>
                                                    <%}%> 
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h6><b>Correctas:</b> <%=Correctas%>  </h6> 
                                                    <h6><b>Total de Puntos:</b> ${dato.assignedscore} <b>Obtenido:</b>${dato.puntoobtenido} </h6> 
                                                    <form class="form-inline" action="ControllerRanking" method="POST">
                                                             <input type="NUMBER" name="puntoObtenido"   VALUE="${dato.puntoobtenido}">
                                                             <input type="hidden" name="idPregunta" VALUE="${dato.id}">
                                                             <input type="hidden" name="idCuestionario" value="${idCuestionario}">
                                                             <input type="hidden" name="idAlumno" value="${idAlumno}">
                                                            <button type="submit"  name="accion" value="modificarPuntoRespuesta" class="btn btn-info mr-1"  id="btnRC">Modificar Punto</button>
                                                    </FORM>
                                                  
                                                    </td>
                                                </Tr>
                                            
                                        </c:forEach>                   
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                   
		</div>
	    </div>
        </div>
    
    </body>
</html>
