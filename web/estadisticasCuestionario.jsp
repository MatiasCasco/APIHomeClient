

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

	
</head>
 
    <body>
        
        <%@include file="navbar.jsp" %> 
        <div class="container">
            <div class="mx-auto col-sm-8 main-section" id="myTab" role="tablist">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="ControllerMenuProfesor">Home</a></li>
                    <li class="breadcrumb-item"><a href="ControllerRanking?accion=mostrarMaterias&idC=${idC}&nombreCurso=${nombreCurso}">${nombreCurso}/Materias</a></li>
                    <li class="breadcrumb-item"><a href="ControllerRanking?accion=MostrarCuestionarios&idCurso=${idC}&nombreCurso=${nombreCurso}&idMateria=${idMateria}&Materia=${Materia}">${Materia}/Puntuaciones por Cuestionario</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Estadisticas</li>
                </ol>
                
                <div class="tab-content" id="myTabContent">
                    
                   
                    <!--%@include file="resumenSemestre.jsp" %--> 
                    <%@include file="graficoResumenCuestionario.jsp" %>  
                   
                
                
            </div>
                    
        </div>
                 
          
    </body>
</html>
