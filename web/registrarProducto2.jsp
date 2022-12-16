<%-- 
    Document   : registrarProducto2
    Created on : 16 oct 2022, 17:34:57
    Author     : xibar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    


 
%>
<!DOCTYPE html>

<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
<link href="css/stylesventa.css" rel="stylesheet" type="text/css" media="all" />
 <link href="css/sb-admin-2.min.css" rel="stylesheet">
    </head>
    <body>
        
 
        
        <!-- Navigation-->
      <%@ include file="nav.jsp"%>
        <!-- Header-->
      
                    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
        <img src="images/das.png" class="d-block w-100" alt="...">
    </div>
    
  </div>
</div>
        <!-- Section-->
        <section class="py-5">

                    
                        <div class="container col-lg-6">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="">
                       <!--     <div class="">
                                <img  class="d-block w-100" src="img/>" />
                            </div> -->
                            <div class="">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Registrar Producto</h1>
                                    </div>
                                    <form action="ServletControlador" method="get" class="user">
                                      <% String img=request.getParameter("img"); %>
                                        
                                      <div class="form-group">
                                             <label  class="col-form-label">NombreImagen</label>
                                             <input type="text" class="form-control form-control-user" id="recipient-name"   
                                                    name="txtNombreIMG" >
                                        </div>
                                        <div class="form-group">
                                             <label  class="col-form-label">Nombre</label>
                                             <input type="text" class="form-control form-control-user" id="recipient-name"   
                                                    name="txtNombre" >
                                        </div>
                                                    <div class="form-group">
                                             <label  class="col-form-label">Precio</label>
                                             <input type="num" class="form-control form-control-user" id="recipient-name"  value="0"  
                                                    name="txtPrecio" >
                                        </div>
                                         <div class="form-group">
                                             <label  class="col-form-label">Stock</label>
                                             <input type="num" class="form-control form-control-user" id="recipient-name"  value="0"  
                                                    name="txtStock" >
                                        </div>
                                        
                                                     <hr>
                                                      <input type="submit" name="CargarImagen" value="Registrar" class="btn btn-primary btn-user btn-block"/>
                                                                  <input type="hidden" name="txtImagen" value="<%=img%>"/>

                                                      <input type="hidden" name="accion" value="RegistrarProducto"/>
            

           
                                     
                                       
                                    </form>
                                  
                                  
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
