<%-- 
    Document   : resumenSemestre
    Created on : 21/06/2021, 03:42:22 PM
    Author     : User
--%>

<%@page import="HomeClient.domain.model.resumenEstructura"%>
<%@page import="HomeClient.domain.model.resumenSemestre"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.RestCurso"%>
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
            int semestre = 2;
            int idCurso = 1;
            int inicio = 0;
            int cierre = 0;
            int posicion = 0;
            String name = " ";
            List<String> s1 = Arrays.asList("'ENE'","'FEB'","'MAR'","'ABR'","'MAY'","'JUN'");
            List<String> s2 = Arrays.asList("'JUL'","'AGO'","'SET'","'OCT'","'NOV'","'DIC'");
            List categoria = null;
            int temp[] = {0,0,0,0,0,0};
            List<Integer> prueba = Arrays.asList(0,0,0,0,0,0);
            if(semestre == 1) {
                inicio = 1;
                cierre = 6;
                categoria = s1;
            } else {
                inicio = 7;
                cierre = 12;
                categoria = s2;
            }
            Gson json = new Gson();
            RestCurso restC = new RestCurso();
            resumenSemestre resumenS = new resumenSemestre();
            ArrayList value = restC.getResumenCurso(ArrayList.class, String.valueOf(idCurso), String.valueOf(inicio), String.valueOf(cierre));
            ArrayList<resumenSemestre> list = new ArrayList();
            ArrayList<resumenEstructura> serie = new ArrayList();
            for(Object pro: value){
                resumenS = json.fromJson(pro.toString(), resumenSemestre.class);
                list.add(resumenS);
            }
            name = list.get(0).getMateria();
            for(int a=0;a<list.size();a++){
                if(name.equalsIgnoreCase(list.get(a).getMateria()) == true){
                    if(semestre ==1){
                        prueba.set(list.get(a).getMes()-1, list.get(a).getPromedio());
                    }
                    if(semestre == 2){
                        prueba.set(list.get(a).getMes()-7, list.get(a).getPromedio());
                    }
                } else {
                    name = "'"+name+"'";
                    serie.add(new resumenEstructura("'column'",name,prueba));
                    name = list.get(a).getMateria();
                    prueba = Arrays.asList(0,0,0,0,0,0);
                    if(semestre ==1){
                        prueba.set(list.get(a).getMes()-1, list.get(a).getPromedio());
                    }
                    if(semestre == 2){
                        prueba.set(list.get(a).getMes()-7, list.get(a).getPromedio());
                    }
                }
                if(a == list.size()-1){
                    name = "'"+name+"'";
                    serie.add(new resumenEstructura("'column'",name,prueba));
                }
            } 
        %>
         <%--<h1>Hello World! <%=list%></h1>
         <h1>Hello World! <%=serie%></h1>--%>
        <div id="grafica"></div>   
        <script>
             $(function($){
                 $('#grafica').highcharts({
                     title:{text:'Promedio de rendimiento de los alumnos por mes en el semestre'},
                     xAxis:{categories:<%=categoria%>},
                     yAxis:{title:'Porcentaje %',plotLines:[{value:0,width:1,color:'#808080'}]},
                     tooltip:{valueSuffix:'%'},
                     legend:{layout:'vertical',align:'right',verticalAlign:'middle',borderWidth:0},
                     series:<%=serie%>,
                     plotOptions:{line:{dataLabels:{enabled:true}}}
                 });
             });
        </script>
    </body>
</html>
