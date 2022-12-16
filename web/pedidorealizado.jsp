
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="java.util.*"%>
<%@page session="true"%>

<% 
    int valor= Integer.parseInt(request.getParameter("cod"));
Venta v=VentaDB.obteneventa(Integer.parseInt(request.getParameter("cod"))); 

boolean listpo =VentaDB.realizadoventa(Integer.parseInt(request.getParameter("cod")));
%>

<!DOCTYPE html>
<html lang="es">
    <head>
       <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
<link href="css/stylesventa.css" rel="stylesheet" type="text/css" media="all" />
 <link rel="stylesheet" href="css/stylecart.css">
 
    </head>

    <body>
        
        <section class="page-wrapper success-msg">
  <div class="container">
    <div class="row">
      <div class="">
        <div class="block text-center">
     
        	<i class="bi bi-check-circle" width="10" height="10"></i>
          <h2 class="text-center">        
<h1>Pedido # <% out.println(valor);%> Realizado correctamente</h1>
          <p></p>
 
          <a href="ServletControlador?accion=MostrarVentas" class="btn btn-main mt-20">Volver</a>
          


        </div>
      </div>
    </div>
  </div>
</section><!-- /.page-warpper -->

    </body>
</html>
