<%-- 
    Document   : graficoResumenTest
    Created on : 21/06/2021, 01:29:33 PM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.resumenEstructura"%>
<%@page import="Consumir.Resteasy.RestPregunta"%>
<%@page import="HomeClient.domain.model.EstadisticaPregunta"%>
<%@page import="java.util.List"%>
<%@page import="Consumir.Resteasy.RestCurso"%>
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
        String  idCuestionario=  (String) request.getAttribute("idCuestionario");
        int puntajeT= (int) request.getAttribute("PuntajeT");
        Gson json = new Gson();
        RestCuestionario restC = new RestCuestionario();
        ArrayList value = restC.getResumenTest(ArrayList.class, idCuestionario);
        String jsonS = json.toJson(value);
        %>
        
        <% 
        String idCurso =  (String) request.getAttribute("idC");
        RestCuestionario restCue = new RestCuestionario();
        ArrayList values= restCue.getCuestionarioAlumnos(ArrayList.class, idCuestionario);
        String respuestas = json.toJson(values);
        RestCurso restCurso = new RestCurso();
        int alumnos = restCurso.getAlumnosXidCurso(int.class, idCurso);
        %>

        <% 
            String name = " ";
            List indice = new ArrayList();
            List prom = new ArrayList();
            List correcto = new ArrayList();
            List incorrecto = new ArrayList();
            EstadisticaPregunta estadistica = new EstadisticaPregunta();
            RestPregunta restP = new RestPregunta();
            ArrayList valueP = restP.getEstadisticas(ArrayList.class, idCuestionario);
            ArrayList<EstadisticaPregunta> list = new ArrayList();
            ArrayList<resumenEstructura> serie = new ArrayList();
            for(Object pro: valueP){
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
        
        
       
          <div class="container">
             <div class="tab-content" id="myTabContent"> 
                 
                 <div id="promedios" style="with: 50%;"></div>
                 
             </div>
             <div class="tab-content" id="myTabContent">
               
                 <div id="container" style="with: 50%;"></div>
                 
             </div> 
               <div class="tab-content" id="myTabContent">
               
                 <div id="estadisticaPregunta"></div>  
                 
             </div> 
   
        </div>
       
        
        <script>
            Highcharts.chart('promedios', {
                chart: {
                    type: 'pie'
                },
                title: {
                    text: 'Resumen del cuestionario con el id <%=idCuestionario%>'
                },
                subtitle: {
                    text: 'Total de puntos del cuestionario: <%=puntajeT%>'
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
                            name: "Cantidad de Alumnos",
                            colorByPoint: true,
                            data: <%=respuestas%>
                        }
                    ],
                });
        </script>
        
        <script>
         $(function($){
                 $('#estadisticaPregunta').highcharts({
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