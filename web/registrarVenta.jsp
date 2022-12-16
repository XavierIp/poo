
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Reserva-venta</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
<link href="css/stylesventa.css" rel="stylesheet" type="text/css" media="all" />

  <link rel="stylesheet" href="css/stylecart.css">
  

    <link rel="stylesheet" href="css/res/style.css">

    </head>
    <body>
        
 
        
        <!-- Navigation-->
       <%@ include file="nav.jsp"%>
        <!-- Header-->
            
                     <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active" >
                <img src="images/cart/3.png" class="d-block " alt="...">
                <div class="carousel-caption  d-md-block display-4 fw-bolder">
               
                    <h1>Carrito de Reserva</h1>
                  
                  </div>
              </div>
           
            
            </div>
        
          </div>
      
                    
                   
                    
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
               
             <form action="ServletControlador" method="post">
                    
                     <input type="hidden" value="RegistrarVenta" name="accion"/>
                     <div class="form-group">
                                            
                                             <input type="hidden" class="form-control form-control-user" id="recipient-name"   
                                                    name="txtNombre" value="<%
                                                     if (sessionOK.getAttribute("perfil")!=null){
                                                     out.println(nom);  }%>
                                                     
                                                    " readonly="readonly" >
                                             
                                               <input type="hidden" class="form-control form-control-user" id="recipient-name"   
                                                    name="txtcorreo" value="<% out.println(correo); %>" readonly="readonly" >
                                             
                                              <input type="hidden" class="form-control form-control-user" id="recipient-name"   
                                                    name="txtcod" value=<%
                                                     if (sessionOK.getAttribute("perfil")!=null){
                                                     out.println(codigo);  }%>
                                                     
                                                    " readonly="readonly" >
                                               <p class="text-uppercase">Fecha de Reserva:</p>
                                               
                                               <%
                                                           SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();

        Date dateObj = calendar.getTime();
        String formattedDate = dtf.format(dateObj);
      
                                                    %>
                                                    
                                                    
                                              <input type="date" class="form-control form-control-user" id="recipient-name"
                                                    name="txtfecha" value="" required  min=<%out.println(formattedDate); %>" >
                                               <br>
                                                 <p class="text-uppercase">Hora de Reserva</p>
                                               <input type="time" class="form-control form-control-user" id="recipient-name"   
                                                    name="txthora" value=""  required>
                                               <br>
                                                 <p class="text-uppercase">Observaciones:</p>
                                                   <textarea class="form-input" id="contact-first-name" data-constraints="@Required"  name="txtobser" rows="10" cols="40">No Tengo Observaciones</textarea>
                                                                                           <br>
                                        </div>
                     
                                         <br>                        
<div class="">
  <div class="cart shopping">
    <div class="container">
    
        <div class=" col-md-offset-2">
          <div class="block">
            <div class="product-list">
               <div class="table-responsive">
                <table class="table">
                  <thead>
               
                    <tr>
                        <th class=""></th>
                      <th class="">Nombre</th>
                      <th class="">Precio</th>
                      <th class="">Cantidad</th>
                      <th class="">Descuento</th>
                      <th class="">Sub. Total</th>
                       <th class=""></th>
                    </tr>
                    
                  </thead>
                  <tbody>
                                 <%   
                                         double total=0;
                                           double totapago=0;
                                       ArrayList<DetalleVenta> lista= (ArrayList<DetalleVenta>)session.getAttribute("carrito");
                                       if(lista!=null){
                                         for(DetalleVenta d:lista){
                                         
                                     %>   
                    <tr class="">
                      <td class="">
                        <div class="product-info">
                          <img width="80" src="img/<%= d.getProducto().getImagen() %>" alt="" />
                        </div>
                      </td>
                      <td class=""><%= d.getProducto().getNombre() %></td>
                      <td class=""><%= d.getProducto().getPrecio() %></td>
                      <td class=""><%= d.getCantidad() %></td>
                      <td class=""><%= String.format("%.2f",d.getDescuento()) %></td>
                      <td class=""><%= String.format("%.2f",(d.getProducto().getPrecio() *d.getCantidad())-d.getDescuento()) %></td>
                      <td class="">
                        <a class="product-remove" href="#!">Remove</a>
                      </td>
                    </tr>
                      <%   
                                            total=total+(d.getProducto().getPrecio() *d.getCantidad())-d.getDescuento();
                                            totapago=(total*total)/(total*3.96);
                                         }}
                                     %>   
                  
                    
                  </tbody>
                   <td></td>
                     <td></td>
                       <td></td>
                         <td></td>
                           <td>Total</td>
                             <td><%= String.format("%.2f", total) %></td>
                             
                <input type="hidden" value="<%=totapago%>" name="totapago"/>
                 <input type="hidden" value="<%=total%>" name="total"/>
                                  <td>  <input type="submit" value="Registrar Venta" name="btnVenta" class="btn btn-main pull-right"/></td>
                </table>

              </form>
                               
                                  
                               
                             
                              
                               <br>
                             <div class="container">
		<div class="row">
			
		</div>  
            </div>
          </div>   <br>
                               <div class="section-title text-center">
				  <a class="btn btn-solid-border " href="index.jsp">Seguir Comprando</a>
                                   <a class="btn btn-solid-border " href="ServletLogueo?accion=cancelar">Cancelar Compra</a>
			</div>
        </div>
     </div>
    </div>

</div>
                               </div>


                       
               
     
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
