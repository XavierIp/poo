

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="java.util.*"%>
<%  String perfil="";
    String nom="";
    String cod="";
     String correo="";
    String distrito="";
    String codigo="";
   HttpSession sessionOK=request.getSession();
   
if (sessionOK.getAttribute("perfil")!=null) {
        nom=(String)sessionOK.getAttribute("ape");
        cod=(String)sessionOK.getAttribute("nom");
        correo=(String)sessionOK.getAttribute("corr");
        distrito=(String)sessionOK.getAttribute("dist");
        perfil=(String)sessionOK.getAttribute("perfil");
        codigo=(String)sessionOK.getAttribute("codigo");
    }
%>
<!DOCTYPE html>

<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Reserva-consulta</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
<link href="css/stylesventa.css" rel="stylesheet" type="text/css" media="all" />


   <link href="css/sb-admin-2.min.css" rel="stylesheet">
   
       <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">


    </head>
    <body>



   
        <!-- Navigation-->
      <%@ include file="nav.jsp"%>
    
        <!-- End of Sidebar -->
        <br>    <br>    <br>    <br>
        <!-- Content Wrapper -->


            <!-- Main Content -->
            <div id="content">

               
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                 <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Detalles</h1>
                                    </div>
                <div class="container">
 <iframe class="container embed-responsive" name="detalle" >
                                        
                                    </iframe>
                    
                    
                    <br> <br> <br> <br>
               
                    <div class="row">
                        <% 
                                  ArrayList<Venta> lista =(ArrayList<Venta>)request.getAttribute("lista");
                                  for(Venta v :lista){
                        
                        %>

                            <!-- Collapsable Card Example -->
                            <div class="card shadow mb-4">
                                <!-- Card Header - Accordion -->
                                <a href="#collapseCardExample<%= v.getCodigoVenta()%>" class="d-block card-header py-3" data-toggle="collapse"
                                    role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">Codigo:  &nbsp; <%= v.getCodigoVenta()%></h6>
                                      <h6 class="m-0 font-weight-bold text-primary">Cliente:  &nbsp; <%= v.getCliente()%></h6>
                                       <h6 class="m-0 font-weight-bold text-primary">Fecha:  &nbsp; <%= v.getFecha()%></h6>
                                        <h6 class="m-0 font-weight-bold text-danger">Fecha Reserva:  &nbsp; <%= v.getFchreser()%></h6>
                                      <h6 class="m-0 font-weight-bold text-danger">Hora Reserva:   &nbsp; <%= v.getHrareser()%></h6>
                                       <h6 class="m-0 font-weight-bold text-danger">observación:  &nbsp; <%= v.getObser()%></h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse" id="collapseCardExample<%= v.getCodigoVenta()%>">
                                    <div class="card-body">

                                        <a class="dropdown-item" href="obtenerdetalle.jsp?cod=<%= v.getCodigoVenta()%>" target="detalle" onclick="topFunction()">Detalle de Pedido</a>
                                     <a class="dropdown-item" href="pedidorealizado.jsp?cod=<%= v.getCodigoVenta()%>">Pedido Realizado</a>
                                       <a class="dropdown-item" href="correoevi.jsp">Eviar correo</a>
                                    
                                    </div>
                                </div>
                            </div>
                             
                            <% 
                                }
                        
                        %>
                            <!-- Large modal -->


                      
                            

                        </div>

                    </div>

                </div>
                <!-- /.container-fluid -->

       
            <!-- End of Main Content -->

             <!-- Footer-->
        <footer class="py-5 bg-success">
            <div class="container"><p class="m-0 text-center text-dark">Copyright &copy;  2022</p></div>
        </footer>
    <!-- Bootstrap core JavaScript-->
    <script src="js/jquery.min.js"></script>
      <script src="js/sb-admin-2.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>

<script>
// Get the button
let mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>