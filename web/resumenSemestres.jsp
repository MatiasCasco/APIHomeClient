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
        
	<script type="text/javascript">
	    $(document).ready(function() {
                 //script del select
                $("#primerS").hide();
                $("#segundoS").hide();
                $('select#rol').on('change',function(){
                    var valor= $(this).val();
                    if (valor==="1") {
                        $("#primerS").show();
                    } else {
                         $("#primerS").hide();
                    }
                    if (valor==="2") {
                        $("#segundoS").show();
                    } else {
                         $("#segundoS").hide();
                    }
                    
                });
           
            
	    } );
	</script>
</head>
       
    <body>

        <%   
            String idCurso =  (String) request.getAttribute("idC");
            String name = " ";
            //segundo semestre 
            List categoria = Arrays.asList("'JUL'","'AGO'","'SET'","'OCT'","'NOV'","'DIC'");;
            int temp[] = {0,0,0,0,0,0};
            List<Integer> prueba = Arrays.asList(0,0,0,0,0,0);

            Gson json = new Gson();
            RestCurso restC = new RestCurso();
            resumenSemestre resumenS = new resumenSemestre();
            ArrayList value = restC.getResumenCurso(ArrayList.class, idCurso, "7", "12");
            ArrayList<resumenSemestre> list = new ArrayList();
            ArrayList<resumenEstructura> serie = new ArrayList();
            for(Object pro: value){
                resumenS = json.fromJson(pro.toString(), resumenSemestre.class);
                list.add(resumenS);
            }
            try{
            name = list.get(0).getMateria();
            for(int a=0;a<list.size();a++){
                if(name.equalsIgnoreCase(list.get(a).getMateria()) == true){
                    
                        prueba.set(list.get(a).getMes()-7, list.get(a).getPromedio());
                    
                } else {
                    name = "'"+name+"'";
                    serie.add(new resumenEstructura("'column'",name,prueba));
                    name = list.get(a).getMateria();
                    prueba = Arrays.asList(0,0,0,0,0,0);
                   
                        prueba.set(list.get(a).getMes()-7, list.get(a).getPromedio());
                    
                }
                if(a == list.size()-1){
                    name = "'"+name+"'";
                    serie.add(new resumenEstructura("'column'",name,prueba));
                }
            }  }catch(Exception e){
                
            }
        %>
        
        <%
            
            List categoriaP =  Arrays.asList("'ENE'","'FEB'","'MAR'","'ABR'","'MAY'","'JUN'");
            resumenSemestre resumenP = new resumenSemestre();
            name="";
            ArrayList valueP = restC.getResumenCurso(ArrayList.class, idCurso, "1", "6");
            ArrayList<resumenSemestre> listP = new ArrayList();
            ArrayList<resumenEstructura> serieP = new ArrayList();///este
            for(Object pro: valueP){
                resumenP = json.fromJson(pro.toString(), resumenSemestre.class);
                listP.add(resumenP);
            }
            try{
            name = listP.get(0).getMateria();
            for(int a=0;a<listP.size();a++){
                if(name.equalsIgnoreCase(listP.get(a).getMateria()) == true){
                        prueba.set(listP.get(a).getMes()-1, listP.get(a).getPromedio());
                } else {
                    name = "'"+name+"'";
                    serieP.add(new resumenEstructura("'column'",name,prueba));
                    name = listP.get(a).getMateria();
                    prueba = Arrays.asList(0,0,0,0,0,0);
                    prueba.set(listP.get(a).getMes()-1, listP.get(a).getPromedio());
                }
                if(a == listP.size()-1){
                    name = "'"+name+"'";
                    serieP.add(new resumenEstructura("'column'",name,prueba));
                }
            } 
             }catch(Exception e){
                
            }
        %>
        
         <div class="container">
           
                <div class="tab-content" id="myTabContent">
                    Resumen por Semestre
                    <select name = "rol" id="rol" >
                                                <option value="0">SeleccionarSemestre</option>
                                                <option value="1">Primer Semestre</option>
                                                <option value="2">Segundo Semestre</option>
                   </select>  
                    
                </div>
                
                <div class="tab-content" id="myTabContent">
                    <div  id="primerS" >
                    <b>Primer Semestre</b>  
                     <div id="grafica"></div> </div>  
                    
                </div>
                <div class="tab-content" id="myTabContent">
                     <div  id="segundoS" >
                     <b>Segundo Semestre</b>   
                     <div id="grafica2"></div>   
                     </div>
                </div>
                    
        </div>
        
        
        
        
        
        
       
        <script>
             $(function($){
                 $('#grafica').highcharts({
                     title:{text:'Promedio de rendimiento de los alumnos por mes en el semestre'},
                     xAxis:{categories:<%=categoriaP%>},
                     yAxis:{title:'Porcentaje %',plotLines:[{value:0,width:1,color:'#808080'}]},
                     tooltip:{valuePrefix:'PROM: '},
                     legend:{layout:'vertical',align:'right',verticalAlign:'middle',borderWidth:0},
                     series:<%=serieP%>,
                     plotOptions:{line:{dataLabels:{enabled:true}}}
                 });
                $('#grafica2').highcharts({
                     title:{text:'Promedio de rendimiento de los alumnos por mes en el semestre'},
                     xAxis:{categories:<%=categoria%>},
                     yAxis:{title:'Porcentaje %',plotLines:[{value:0,width:1,color:'#808080'}]},
                     tooltip:{valuePrefix:'PROM:  '},
                     legend:{layout:'vertical',align:'right',verticalAlign:'middle',borderWidth:0},
                     series:<%=serie%>,
                     plotOptions:{line:{dataLabels:{enabled:true}}}
                 });
               
             });
        </script>
    </body>
</html>
