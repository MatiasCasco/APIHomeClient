<%-- 
    Document   : grafico1
    Created on : 17/06/2021, 10:19:44 PM
    Author     : User
    Description: cantidad de cuestionarios por materia
--%>

<%@page import="Consumir.Resteasy.RestMateria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="HomeClient.domain.model.Grafica"%>
<%@page import="com.google.gson.Gson"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <script src="http://code.highcharts.com/modules/exporting.js"></script>
   
    </head>
    <body>

       <%  
        Gson gjson = new Gson();
        RestMateria restM = new RestMateria();
        //Grafica grafica = new Grafica();
        String idCu = (String) request.getAttribute("idC");
        String titles = "Cantidad de contenido por materia del curso:"+(String) request.getAttribute("nombreCurso");
        ArrayList values = restM.getGraficaContenidoMXid(ArrayList.class,idCu );
        String jsonS = gjson.toJson(values);
        %>

<div id="container" style="with: 100%;"></div>
 <script>          
     // Create the chart
     Highcharts.chart('container', {
         chart: {
             type: 'pie'
         },
         title: {
             text: '<%=titles%>'
         },
         subtitle: {
             text: ''
         },
         accessibility: {
             announceNewData: {
                 enabled: true
             },
             point: {
                 valueSuffix: '%'
             }
         },
         plotOptions: {
             series: {
                 dataLabels: {
                     enabled: true,
                     format: '{point.name}: Posee {point.y:.1f} Cuestionarios'
                 }
             }
         },
         tooltip: {
             headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
             pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b>  Total<br/>'
         },
         series: [
             {
                 name: "Materia",
                 colorByPoint: true,
                 data: <%=jsonS%>
             }             
             ],
         }
    );
              
    </script>
    </body>
</html>