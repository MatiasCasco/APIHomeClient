<%-- 
    Document   : grafico2
    Created on : 18/06/2021, 11:31:35 AM
    Author     : User
--%>

<%@page import="Consumir.Resteasy.RestCuestionario"%>
<%@page import="Consumir.Resteasy.RestCurso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="HomeClient.domain.model.Grafica"%>
<%@page import="Consumir.Resteasy.RestMateria"%>
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
        Gson json = new Gson();
        RestCuestionario restCue = new RestCuestionario();
        ArrayList value = restCue.getCuestionarioAlumnos(ArrayList.class, String.valueOf(idCuestionario));
        String jsonS = json.toJson(value);
        RestCurso restC = new RestCurso();
        int alumnos = restC.getAlumnosCurso(int.class, "PrimeroTT");
        %>
       
        <div id="container" style="with: 100%;"></div>
        <script>
                // Create the chart
                Highcharts.chart('container', {
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Cuantos alumnos resolvieron cuestionarios N° 1 perteneciente al curso: PrimeroTT'
                    },
                    subtitle: {
                        text: 'En el curso existen <%=alumnos%> Alumnos'
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
                                format: '{point.name}: {point.y:.1f} alumnos'
                            }
                        }
                    },

                    tooltip: {
                        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b>  Total<br/>'
                    },

                    series: [
                        {
                            name: "Cuestionario",
                            colorByPoint: true,
                            data: <%=jsonS%>
                        }
                    ],
                });
        </script>

    </body>
</html>
