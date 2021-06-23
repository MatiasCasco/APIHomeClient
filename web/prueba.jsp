<%-- 
    Document   : prueba
    Created on : Jun 21, 2021, 8:58:29 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
<HEAD>
    <STYLE>
        .hideable { 
            position: relative; visibility: hidden; 
        }
    </STYLE>
    <SCRIPT>
        function Mostrar_Ocultar(hide) {
            if (document.layers)
            /*aqui se cambian los valores 'show' y 'hide' para cultarlo o mostrarlo
            aqui la variable (hide) esta en hide para ocultarlos campos
            document.contenido.visibility = ****variable(hide)**** ? ****estado('hide') **** y despues *****: 'show'; */
                document.contenido.visibility = show ?'show' : 'hide'  ;
            else {
                var g = document.all ? document.all.contenido :
                document.getElementById('contenido');
                g.style.visibility = hide ? 'visible':'hidden' ;
            }
        }
    
        function Mostrar_Ocultarid(hide,idContenido) {
            if (document.layers)
            /*aqui se cambian los valores 'show' y 'hide' para cultarlo o mostrarlo
            aqui la variable (hide) esta en hide para ocultarlos campos
            document.contenido.visibility = ****variable(hide)**** ? ****estado('hide') **** y despues *****: 'show'; */
                document.contenido.visibility = show ?'show' : 'hide'  ;
            else {
                var g = document.all ? document.all.contenido :
                document.getElementById(idContenido);
                g.style.visibility = hide ? 'visible':'hidden' ;
            }
        }
    </SCRIPT>
</HEAD>
<BODY>
    <TABLE>
        <TR>
        <TD VALIGN="top">
            <FORM NAME="form0">
                modificar puntaje
              <INPUT NAME="Accion" TYPE="checkbox" ONCLICK="Mostrar_Ocultar(this.checked);">
            </FORM>
        </TD>
    <TD>
    <SPAN ID="contenido" CLASS="hideable">
        <FORM NAME="form1">
          
            <p>
              <label> mODIFICAR FUNTAJE</label>
              <input type="NUMBER" name="Observaciones" id="Observaciones"    VALUE="1">
              
              
            </p>
        </FORM>
    </SPAN>
    </TD>
</TR>
    
  <TR>
        <TD VALIGN="top">
            <FORM NAME="form0">
                modificar puntaje
                <%String id="id01";%>
              <INPUT NAME="Accion" TYPE="checkbox" ONCLICK="Mostrar_Ocultarid(this.checked,${id});">
            </FORM>
        </TD>
    <TD>
        <SPAN  ID="<%=id%>" CLASS="hideable" >
        <FORM NAME="form1">
          
            <p>
              <label> mODIFICAR FUNTAJE</label>
              <input type="NUMBER" name="Observaciones" id="Observaciones"    VALUE="1">
              
              
            </p>
        </FORM>
    </SPAN>
    </TD>
</TR>

</TABLE>
</BODY>
</HTML>