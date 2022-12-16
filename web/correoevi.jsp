
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Modelo.*"%>
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
       <div class="container">  
 <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
                <form class="form-horizontal" form action="ServletControlador" method="post">
                      <input type="hidden" value="enviodecorreopersola" name="accion"/>
                    <fieldset>
                        <legend class="text-center header">Envio de correo:</legend>
                        
                         <input type="text" class="form-control form-control-user" id="recipient-name"   
                                                    name="txtNombre" value="<%
                                                     if (sessionOK.getAttribute("perfil")!=null){
                                                     out.println(nom);  }%>
                                                     
                                                    " readonly="readonly" >

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                            <div class="">
                                <input id="fname" name="corr" type="text"  class="form-control" value="<% out.println(correo); %>" readonly="readonly" >
                            </div>
                        </div>
                              <br>
                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                            <div class="">
                                <input id="lname" name="Asusto" type="text" placeholder="Asusto" class="form-control" required="">
                            </div>
                        </div>

                        
                        <br>
                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
                            <div class="">
                                <textarea class="form-control" id="message" name="message" placeholder="Agregar contenido" rows="7" required=""></textarea>
                            </div>
                        </div>
   <br>   <br>
                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary btn-lg">Enviar</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
  
</div>
    </body>
</html>
