
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="Modelo.*"%>
<%@page session="true" %>
<%  String perfil="";
    String nom="";
    String cod="";
     String correo="";
    String distrito="";
    String codigo="";
    String usu="";
   HttpSession sessionOK=request.getSession();
   
if (sessionOK.getAttribute("perfil")!=null) {
        nom=(String)sessionOK.getAttribute("ape");
        cod=(String)sessionOK.getAttribute("nom");
        correo=(String)sessionOK.getAttribute("corr");
        distrito=(String)sessionOK.getAttribute("dist");
        perfil=(String)sessionOK.getAttribute("perfil");
        codigo=(String)sessionOK.getAttribute("codigo");
    }
    if (sessionOK.getAttribute("perfil")==null) {
%>
<jsp:forward page="login.jsp"/>
<%}else{usu=(String)sessionOK.getAttribute("perfil");}

%>
<% Producto p=ProductoDB.obteneProductos(Integer.parseInt(request.getParameter("id"))); %>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Item - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/stylesventa.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
       <%@ include file="nav.jsp"%>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="img/<%= p.getImagen() %>" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">SKU: <%= p.getCodigoProducto()%></div>
                        <h1 class="display-5 fw-bolder"><%= p.getNombre() %></h1>
                        <div class="fs-5 mb-5">
                     
                            
                            <form action="ServletControlador" method="post">
							
									<span>S/<%= p.getPrecio() %></span>
                                                                         </div>
								<div class="d-flex">
                                                                    <input type="hidden" value="<%= p.getCodigoProducto()%>"  name="txtCodigo" />
                                                                     <input type="hidden" value="<%= p.getNombre() %>"  name="txtNombre" />
                                                                    <input type="hidden" value="<%= p.getPrecio() %>"  name="txtPrecio" />
                                                                    <input type="number" value="1" min="0" value="0" id="form-control text-center me-3" name="txtCantidad"style="max-width: 3rem" /> &nbsp;
                                                                    <input type="submit" value="Añadir" name="btnAnadir" class="btn btn-outline-dark flex-shrink-0"/>
                                                                     <input type="hidden" value="AnadirCarrito" name="accion"/>
									
							
                            </form><!-- comment id="inputQuantity"  -->
                            
                            
                        
                        </div>
                    </div>
                </div>
            </div>
        </section>
     
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
       
    </body>
</html>
