

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Reserva-registrar</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
<link href="css/stylesventa.css" rel="stylesheet" type="text/css" media="all" />
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
               
                    <h1>Agregar Producto</h1>
                  
                  </div>
              </div>
           
            
            </div>
        
          </div>
        
           <section class="py-5">

                    
                        <div class="container col-lg-6">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="">
                          
                            <div class="">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Imagen</h1>
                                    </div>
                                    <form action="subirImagen.jsp" method="POST" class="user" enctype="multipart/form-data">
                                        <div class="form-group">
                                           
                                             <input type="file" class="form-control form-control-user" id="recipient-name" 
                                                    name="file">
                                        
                                        
                                                     <hr>
                                                     <div class="text-center">
        
                          
                                                      <input type="submit" name="CargarImagen" value="Registrar" class="btn btn-primary btn-user btn-block"/>
            </div>
           
                                     
                                       
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
                                                    
                                                    
                    
        <!-- Section-->
     
        <!-- Footer-->
        <footer class="py-5 bg-success">
            <div class="container"><p class="m-0 text-center text-dark">Copyright &copy;  2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
      
    </body>
</html>

