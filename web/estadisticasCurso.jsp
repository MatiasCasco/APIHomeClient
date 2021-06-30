

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

	
</head>
 
    <body>
        
        <%@include file="navbar.jsp" %> 
        <div class="container">
            <div class="mx-auto col-sm-8 main-section" id="myTab" role="tablist">
                
                <div class="tab-content" id="myTabContent">
                    
                    <%@include file="resumenSemestres.jsp" %> 
                    <!--%@include file="resumenSemestre.jsp" %--> 
                    <%@include file="graficoCuestionariosXCurso.jsp" %>  
                   
                
                
            </div>
                    
        </div>
                 
          
    </body>
</html>
