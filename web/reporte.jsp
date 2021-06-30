<%-- 
    Document   : reporte
    Created on : 25/06/2021, 10:30:22 AM
    Author     : User
--%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.JFrame"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JRException"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="net.sf.jasperreports.engine.data.JRBeanCollectionDataSource"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.util.JRLoader"%>
<%@page import="HomeClient.domain.model.Reporte"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.Writer"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Consumir.Resteasy.RestTest"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            int idCuestionario = 77;     
            Gson json = new Gson();
            RestTest restT = new RestTest();
            Reporte report = new Reporte();
            ArrayList value = restT.getReporte(ArrayList.class, String.valueOf(idCuestionario));
            ArrayList<Reporte> list = new ArrayList();
            //String jsonS = json.toJson(value);
            for(Object pro: value){
               report = json.fromJson(pro.toString(), Reporte.class);
               list.add(report);
            } 
            // Funciona bien ventana jasperviewer mas formatos de descarga
            /*JasperReport reporte; 
           String path = "C:\\Users\\User\\Documents\\NetBeansProjects\\APIHomeClient\\src\\java\\report\\reportTest.jasper"; //Ponemos la localizacion del reporte creado
            try {
                reporte = (JasperReport) JRLoader.loadObjectFromFile(path); //Se carga el reporte de su localizacion
                JasperPrint jprint = JasperFillManager.fillReport(reporte, null, new JRBeanCollectionDataSource(list)); //Agregamos los parametros para llenar el reporte
                JasperViewer viewer = new JasperViewer(jprint, false); //Se crea la vista del reportes
                viewer.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE); // Se declara con dispose_on_close para que no se cierre el programa cuando se cierre el reporte
                viewer.setVisible(true); //Se vizualiza el reporte
            } catch (JRException ex) {
            }*/
        // Funciona bien este web
        JasperReport reporte; 
        String path = "C:\\Users\\User\\Documents\\NetBeansProjects\\APIHomeClient\\src\\java\\report\\reportTest.jasper"; //Ponemos la localizacion del reporte creado
        try {
            reporte = (JasperReport) JRLoader.loadObjectFromFile(path); //Se carga el reporte de su localizacion
            //JasperPrint jprint = JasperFillManager.fillReport(reporte, null, new JRBeanCollectionDataSource(list));
            byte[] bytes = JasperRunManager.runReportToPdf(reporte, null, new JRBeanCollectionDataSource(list));    
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outs = response.getOutputStream();
            outs.write(bytes,0,bytes.length);
            outs.flush();
            outs.close();
         } catch (JRException ex) {
            }
        %>
        <h1>Hello World! <%=list%></h1>
    </body>
</html>