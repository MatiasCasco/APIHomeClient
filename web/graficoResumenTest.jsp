<%-- 
    Document   : graficoResumenTest
    Created on : 21/06/2021, 01:29:33 PM
    Author     : User
--%>

<%@page import="Consumir.Resteasy.RestCuestionario"%>
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
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        int idCuestionario = 73;     
        Gson json = new Gson();
        RestCuestionario restC = new RestCuestionario();
        ArrayList value = restC.getResumenTest(ArrayList.class, String.valueOf(idCuestionario));
        String jsonS = json.toJson(value);
        %>

        <div id="container" style="with: 100%;"></div>
         <script>
            Highcharts.chart('container', {
                chart: {
                    type: 'pie'
                },
                title: {
                    text: 'Resumen del cuestionario con el id <%=idCuestionario%>'
                },
                subtitle: {
                    text: 'Cantidad de alumnos con un porcentaje de puntos mayor 70% y menor a 70%'
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
                            format: '{point.name}: Posee {point.y:.1f} alumnos'
                        }
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> alumnos en total<br/>'
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