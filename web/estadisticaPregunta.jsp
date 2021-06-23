<%-- 
    Document   : estadisticaPregunta
    Created on : 22/06/2021, 02:36:48 PM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.EstadisticaPregunta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="HomeClient.domain.model.resumenEstructura"%>
<%@page import="java.util.List"%>
<%@page import="Consumir.Resteasy.RestPregunta"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <script src="http://code.highcharts.com/modules/exporting.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <% 
            int idCuestionario = 77;
            String name = " ";
            List indice = new ArrayList();
            List prom = new ArrayList();
            List correcto = new ArrayList();
            List incorrecto = new ArrayList();
            Gson json = new Gson();
            EstadisticaPregunta estadistica = new EstadisticaPregunta();
            RestPregunta restP = new RestPregunta();
            ArrayList value = restP.getEstadisticas(ArrayList.class, String.valueOf(idCuestionario));
            ArrayList<EstadisticaPregunta> list = new ArrayList();
            ArrayList<resumenEstructura> serie = new ArrayList();
            for(Object pro: value){
               estadistica = json.fromJson(pro.toString(), EstadisticaPregunta.class);
               list.add(estadistica);
            }
            try {
             for(int a=0;a<list.size();a++){
                indice.add(a+1);
                prom.add(list.get(a).getProm());
                correcto.add(list.get(a).getCorrecta());
                incorrecto.add(list.get(a).getIncorrecta());
            }
            serie.add(new resumenEstructura("'column'","'Promedio en puntaje'",prom));
            serie.add(new resumenEstructura("'column'","'Rta Correcta en %'",correcto));
            serie.add(new resumenEstructura("'column'","'Rta Incorrecta en %'",incorrecto));
            } catch(Exception ex){}
        %>
        <%--<h1>Hello World!<%=serie%></h1>--%>
        <div id="grafica"></div>   
        <script>
         $(function($){
                 $('#grafica').highcharts({
                     title:{text:'Estadistica por pregunta'},
                     xAxis:{tile:'Pregunta',categories:<%=indice%>},
                     yAxis:{title:'',plotLines:[{value:0,width:1,color:'#808080'}]},
                     tooltip:{
                         headerFormat: '<span style="font-size:11px">Pregunta</span><br>',
                         valueSuffix:''},
                     legend:{layout:'vertical',align:'right',verticalAlign:'middle',borderWidth:0},
                     series:<%=serie%>,
                     plotOptions:{line:{dataLabels:{enabled:true}}}
                 });
             });
        </script>
    </body>
</html>
