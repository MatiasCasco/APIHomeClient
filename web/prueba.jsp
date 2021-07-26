<%-- 
    Document   : prueba
    Created on : Jun 21, 2021, 8:58:29 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


<script>
a = 0;
function addCancion(){
        a++;

        var div = document.createElement('div');
        div.setAttribute('class', 'form-inline');
            div.innerHTML = '<div style="clear:both" class="cancion_'+a
                    +' col-md-offset-1 col-md-6"><input class="form-control" name="cancion_'+a
                    +'" type="text"/></div><div class="cancion_'+a+' col-md-2""><input class="form-control" name="duracion_'+a
                    +'" type="text"/></div>';
            document.getElementById('canciones').appendChild(div);document.getElementById('canciones').appendChild(div);
}
</script>


</head>

<body>
<div class="container">
    <h3>Formulario de canciones de CD</h3>
    <form action="formulario2.html" id="formulario" method="get">
    <div class="row">
        <div class="col-md-offset-1 col-md-4"><label>Nombre CD</label></div>
        <div class="col-md-4"><input class="form-control" name="nombre_cd" type="text"/></div>
    </div>
    <div class="row">
        <div class="col-md-offset-1 col-md-6"><label>T&iacute;tulo canci&oacute;n</label></div>
        <div class="col-md-2"><label>Duraci&oacute;n</label></div>
        <div class="col-md-1"><input type="button" class="btn btn-success" id="add_cancion" onClick="addCancion()" value="+" /></div>
    </div>
    <!-- El id="canciones" indica que la función de JavaScript dejará aquí el resultado -->
    <div class="row" id="canciones">
    </div>
    </form>
</div>

</body>
</html>