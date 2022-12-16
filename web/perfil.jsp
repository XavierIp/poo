<%-- 
    Document   : perfil
    Created on : 30 oct 2022, 23:51:10
    Author     : xibar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="java.util.*"%>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/stylesventa.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
                
<%@ include file="nav.jsp"%>
       <section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row">
      <div class="col">
       
      </div>
    </div>

    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3"> <%out.println(perfil); %></h5>
           
          </div>
        </div>
       
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Codigo</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%out.println(codigo); %></p>
              </div>
            </div>
               <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Nombre</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%out.println(nom); %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Correo</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%out.println(correo); %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Distrito</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%out.println(distrito); %></p>
              </div>
            </div>
           
    
          </div>
        </div>
     
      </div>
    </div>
  </div>
</section>
              <div class="container py-5">
              <h5 class="my-3 text-center"> Pedidos en Espera</h5>
             </div>
              
                  <% 
                                  ArrayList<Venta> lista =(ArrayList<Venta>)request.getAttribute("listaventa");
                                  for(Venta v :lista){
                        
                        %>
 
  <div class="container py-5 h-100">
   
      
        <div class="card mb-3" style="border-radius: .5rem;">
          <div class="row g-0">
           
           
              <div class="card-body p-4">
                <h6>Codigo de venta: <%= v.getCodigoVenta()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fecha generado: <%= v.getFecha()%></h6>
                <hr class="mt-0 mb-4">
                <div class="row pt-1">
                  <div class="col-6 mb-3">
                    <h6>Fecha Reserva</h6>
                    <p class="text-muted"><%= v.getFchreser()%></p>
                  
                  </div>
                  <div class="col-6 mb-3">
                    <h6>Hora Reserva</h6>
                    <p class="text-muted"><%= v.getHrareser()%></p>
     
                                                 
                  </div>
                </div>
                <h6>Observaciones:</h6>
                <hr class="mt-0 mb-4">
                <p class="text-muted"><%= v.getObser()%></p>
              </div>
          
          </div>
        </div>
      </div>



                         <% 
                                }
                        
                        %>
                  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
