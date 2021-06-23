<%-- 
    Document   : grafico1
    Created on : 17/06/2021, 10:19:44 PM
    Author     : User
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
        <%-- Grafico 1 
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <script src="http://code.highcharts.com/modules/exporting.js"></script> --%>
        <title>JSP Page</title>
    </head>
    <body>


         <%-- Grafico 1
        <div id="grafica"></div>   
       
        <script>
     $(function($){
         $('#grafica').highcharts({
             title:{text:'Nuestra primera gráfica'},
             xAxis:{categories:['2002','2004','2015']},
             yAxis:{title:'Porcentaje %',plotLines:[{value:0,width:1,color:'#808080'}]},
             tooltip:{valueSuffix:'%'},
             legend:{layout:'vertical',align:'right',verticalAlign:'middle',borderWidth:0},
             series:[{type: 'column',name: 'Java',data: [25,23, 21]}, 
             {name: 'C',data: [20,18, 19]}, 
             {type: 'column',name: 'C++',data: [15, 17,11]}, 
             {type: 'spline',name: 'C#',data: [0, 4, 4]},
             {name: 'Objective-C',data: [0,1, 1.5]}
           ],
             plotOptions:{line:{dataLabels:{enabled:true}}}
         });
     });
    </script>--%>
       <%  
        Gson json = new Gson();
        RestMateria restM = new RestMateria();
        //Grafica grafica = new Grafica();
        ArrayList value = restM.getGraficaContenidoM(ArrayList.class, "PrimeroTT");
        String jsonS = json.toJson(value);
        %>

<div id="container" style="with: 100%;"></div>
 <script>
             
// Create the chart
Highcharts.chart('container', {
    chart: {
        type: 'pie'
    },
    title: {
        text: 'Cantidad de contenido por materia del curso: PrimeroTT'
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
});
              
         </script>
    </body>
</html>