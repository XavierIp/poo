 <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
               
                <a class="navbar-brand" href="#!">
                    <img src="images/cart/chico titu.png" alt="alt" width="" height="34" class="d-inline-block align-text-top" />
                    &nbsp;Reservas
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Menu</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Destacado</a></li>
                        <% 
   
if (sessionOK.getAttribute("perfil")!=null && sessionOK.getAttribute("perfil").equals("trabajador") ) {
      
%>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="registrarproducto.jsp">Registrar Producto</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="ServletControlador?accion=MostrarVentas">Consultar Venta</a></li>
                             
                            </ul>
                        </li>
                        
                        <% } %>
                    </ul>
                        <% 
   
if (sessionOK.getAttribute("perfil")!=null) {
      
%>
                    <form class="d-flex">
                        <a class="btn btn-outline-dark" href="registrarVenta.jsp">
                            <i class="bi-cart-fill me-1"></i>
                            Carrito
                        </a>
                      
                   
                    </form>
                       <% } %>
                    <ul class="navbar-nav  mb-2 mb-lg-0 ms-lg-4">
                      <li class="nav-item dropdown">
                          <%  if (sessionOK.getAttribute("perfil")!=null) {%>
                                  
                          <a class="nav-link dropdown-toggle text-dark" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> <i class="bi bi-person-fill me-1"></i><%out.println(nom); %></a>

                            <%  }%>

                              <%  if (sessionOK.getAttribute("perfil")==null) {%>
                                  
                            <a class="nav-link dropdown-toggle text-dark" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> <i class="bi bi-person-fill me-1"></i>Iniciar Sección</a>

                            <%  }%>
                          
                            
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                               
                           <%  if (sessionOK.getAttribute("perfil")!=null) {%>
                              
                                   <form action="ServletControlador?accion=perfil" method="POST">
                     <input type="hidden" class="form-control form-control-user" id="recipient-name"   
                                                    name="codusu" value=<%
                                                     if (sessionOK.getAttribute("perfil")!=null){
                                                     out.println(codigo);  }%>
                                                     
                                                    " readonly="readonly" >
                       
                        
              <input type="submit"  value="Perfil" class="dropdown-item"/>

                                   <li><hr class="dropdown-divider" /></li>
                                   
                   
                                   </form>
                                     <%  }%>
                                     <%  if (sessionOK.getAttribute("perfil")==null) {%>
                                <li><a class="dropdown-item" href="login.jsp">Ingresar</a></li> 
                                <%  }%>
                                 <%  if (sessionOK.getAttribute("perfil")!=null) {%>
                                <li><a class="dropdown-item" href="ServletLogueo?accion=cerrar">Cerrar Sección</a></li> 
                                <%  }%>
                            </ul>
                        </li>
                    
                </div>
                
            </div>
        </nav>    