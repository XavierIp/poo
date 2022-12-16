
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
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
        <title>Reserva Utp</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
<link href="css/stylesventa.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        
<%@ include file="nav.jsp"%>

       
        <!-- Header-->
      
                    
                     <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active" data-bs-interval="10000">
                <img src="images/cart/3.png" class="d-block " alt="...">
                <div class="carousel-caption  d-md-block display-4 fw-bolder">
                    
                     <%  if (sessionOK.getAttribute("perfil")!=null) {%>
                                  
 <p>Bienvenido,  <%out.println(nom); %> </p>
                    <h5>¿Qué se te antoja hoy?</h5>
                            <%  }%>

                              <%  if (sessionOK.getAttribute("perfil")==null) {%>
                                  
 <p>Hola</p>
                    <h5>¿Qué se te antoja hoy?</h5>
                            <%  }%>
                  
                  </div>
              </div>
              <div class="carousel-item" data-bs-interval="2000">
                <img src="images/cart/1.png" class="d-block " alt="...">
                 <div class="carousel-caption  d-md-block display-4 fw-bolder">
                    <p>Tus reservas a un solo</p>
                    <h5>Click</h5>
                  
                  </div>
              </div>
              <div class="carousel-item">
                <img src="images/cart/2.png" class="d-block " alt="...">
                 <div class="carousel-caption  d-md-block display-4 fw-bolder">
                    <p> Busca tu plato favorito de la semana</p>
                   
                  
                  </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
                    
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                 
    
                    <% 
                            ArrayList<Producto> lista = ProductoDB.obteneProductos();
                            int salto=0;
                            for(Producto p: lista){

                    %>
                                        
           <div class="col mb-5">
                      <div class="card h-100">
                           <!-- Product image-->
       <img class="card-img-top w-100 h-100" src="img/<%= p.getImagen() %>" />
                           <!-- Product details-->
                           <div class="card-body p-4">
                               <div class="text-center">
                                   <!-- Product name-->
                                   <h5 class="fw-bolder"><%= p.getNombre() %></h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small mb-2">
                                     <!--   <div class=" "> vhghjfgj</div>-->
                                    </div>
                                 <!-- Product price-->
                                    S/<%= p.getPrecio() %>
                               </div>
                           </div>
                          <!-- Product actions-->
                          <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="anadirCarrito.jsp?id=<%= p.getCodigoProducto()%>">Agregar</a></div>
                                 <% 
   
if (sessionOK.getAttribute("perfil")!=null && sessionOK.getAttribute("perfil").equals("trabajador") ) {
      
%>
                               <br> <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="actualizarProducto.jsp?id=<%= p.getCodigoProducto()%>">Modificar</a></div>
                               <% } %>
                               
                               
                            </div>
                      </div>
                   </div>
                    
                     <% 
                            }
                    %>
                                          
                  
                  
                    
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-success">
            <div class="container"><p class="m-0 text-center text-dark">Copyright &copy;  2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
      
    </body>
</html>
