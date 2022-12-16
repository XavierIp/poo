/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Modelo.*;
import java.util.ArrayList;
import jakarta.servlet.http.HttpSession;



@WebServlet(name = "ServletControlador", urlPatterns = {"/ServletControlador"})
public class ServletControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String accion = request.getParameter("accion");
           if (accion.equals("AnadirCarrito")) {
            this.anadirCarrito(request, response);
           }else if (accion.equals("ModificarProducto")) {
            this.actualizarProducto(request, response);
           }else if (accion.equals("RegistrarProducto")) {
            this.regisProducto(request, response);
           }else if (accion.equals("RegistrarVenta")) {
            this.registrarVenta(request, response);
           }else if (accion.equals("MostrarVentas")) {
            this.MostrarVentas(request, response);
           }else if (accion.equals("perfil")) {
            this.perfi(request, response);
           }else if (accion.equals("enviodecorreopersola")) {
            this.enviodecorreopersola(request, response);
           }
        
    }
    private void anadirCarrito(HttpServletRequest request,HttpServletResponse response)
             throws ServletException, IOException {
               HttpSession sesion = request.getSession();
               ArrayList<DetalleVenta> carrito;
               if (sesion.getAttribute("carrito")==null) {
            carrito =new ArrayList<DetalleVenta>();
        } else {
                 carrito =(ArrayList<DetalleVenta>) sesion.getAttribute("carrito");
        }
               Producto p=ProductoDB.obteneProductos(Integer.parseInt(request.getParameter("txtCodigo")));
               DetalleVenta d=new DetalleVenta();
               
               d.setCodigoProducto(Integer.parseInt(request.getParameter("txtCodigo")));
               d.setProducto(p);
               d.setCantidad(Double.parseDouble(request.getParameter("txtCantidad")));
               double subTotal=p.getPrecio()*d.getCantidad();
               if (subTotal>50) {
                   d.setDescuento(subTotal*0.05);
            
        }else{
               d.setDescuento(0);}
               int indice=-1;
               for (int i = 0; i < carrito.size(); i++) {
              DetalleVenta det=carrito.get(i);
                   if (det.getCodigoProducto()==p.getCodigoProducto()) {
                       indice=1;
                       break;
                   }
        }
               if (indice==-1) {
            carrito.add(d);
        }
               sesion.setAttribute("carrito", carrito);
               response.sendRedirect("registrarVenta.jsp");
    
    }
    
     private void actualizarProducto(HttpServletRequest request,HttpServletResponse response)
             throws ServletException, IOException {
                    Producto p=new Producto(Integer.parseInt(request.getParameter("txtCodigo")),
                            request.getParameter(("txtNombre").toString()),
                            Double.parseDouble(request.getParameter("txtPrecio")),Integer.parseInt(request.getParameter("txtStock")));
                            boolean rpta=ProductoDB.actualizarProductos(p);
                            if (rpta) {
             response.sendRedirect("mensaje.jsp?men=Se Actualizo el Producto Correctamente");
         } else {
                                   response.sendRedirect("mensaje.jsp?men=Error no Actualizo el Producto");
         }
     
     
     }
     
      private void regisProducto(HttpServletRequest request,HttpServletResponse response)
             throws ServletException, IOException {
          
          String pro=request.getParameter("txtNombre");
          double pre=Double.parseDouble(request.getParameter("txtPrecio"));
           String img=request.getParameter("txtNombreIMG");
            int stock=Integer.parseInt(request.getParameter("txtStock"));
          
          
                    Producto p=new Producto(pro,pre,img,stock);
                          
                            boolean rpta=ProductoDB.insertarProducto(p);
                            if (rpta) {
             response.sendRedirect("mensaje.jsp?men=Se Registro el Producto Correctamente");
         } else {
                                   response.sendRedirect("mensaje.jsp?men=Error no se Registro el Producto");
         }
     
     
     }
      
      
   
     
       
     private void registrarVenta(HttpServletRequest request,HttpServletResponse response)
             throws ServletException, IOException {
                    HttpSession sesion = request.getSession();
                    String correo=request.getParameter("txtcorreo");
Venta v=new Venta();

v.setCodusu(Integer.parseInt(request.getParameter("txtcod").toUpperCase()));
v.setCliente(request.getParameter("txtNombre").toUpperCase());
v.setFchreser(request.getParameter("txtfecha").toUpperCase());
v.setHrareser(request.getParameter("txthora").toUpperCase());
v.setObser(request.getParameter("txtobser").toUpperCase());


 correoDB email=new correoDB();
 int codigo=Integer.parseInt(request.getParameter("txtcod"));
  String nombre=request.getParameter("txtNombre");
   String FECHA=request.getParameter("txtfecha");
    String HORA=request.getParameter("txthora");
    String OBSERVA=request.getParameter("txtobser");
 String de="poo.grupo1.2022@gmail.com";
String clave="mlmuxponggezlzts";
String para=correo;

 ArrayList<DetalleVenta> detalle=( ArrayList<DetalleVenta>)sesion.getAttribute("carrito");
              
               
    String mensaje="Hola "+nombre+"\n Su Reserva con el codigo # "+codigo+" se realizo correctamente\n"+
        "\n"+
        "=====================\n"+
        "DIA: " + FECHA+"\n"+
        "HORA: " + HORA+"\n"+
        "OBSERVACION: "+ OBSERVA+"\n"+
        "=====================\n";
            
String asunto="Reserva Utp ";

boolean resultado= email.enviarcorreo(de, clave, para, mensaje, asunto);


  


              
               boolean rpta=VentaDB.insertarVenta(v, detalle);    
               double totapago=Double.parseDouble(request.getParameter("totapago"));
                 double total=Double.parseDouble(request.getParameter("total"));
                 
                 
               if (rpta) {
                   request.getSession().removeAttribute("carrito");
                  
                   response.sendRedirect("formulariopago.jsp?totapago="+totapago+"&total="+total);
                        //        response.sendRedirect("mensaje.jsp?men=Se Registro la venta Correctamente");

             
         }else{
                                               response.sendRedirect("mensaje.jsp?men=Error no se Registro la venta ");

               
               }


     }
     
     private void MostrarVentas(HttpServletRequest request,HttpServletResponse response)
             throws ServletException, IOException {
              ArrayList<Venta> lista =new ArrayList<>();
              lista=VentaDB.obtenerventas();
              request.setAttribute("lista", lista);
              request.getRequestDispatcher("consultarventa.jsp").forward(request, response);
        }
     
      private void perfi(HttpServletRequest request,HttpServletResponse response)
             throws ServletException, IOException {
              ArrayList<Venta> listaventa =new ArrayList<>();
              listaventa=VentaDB.obteneventacod(Integer.parseInt(request.getParameter("codusu")));
              request.setAttribute("listaventa", listaventa);
              request.getRequestDispatcher("perfil.jsp").forward(request, response);
        }
      
       private void enviodecorreopersola(HttpServletRequest request,HttpServletResponse response)
             throws ServletException, IOException {
            correoDB email2=new correoDB();
            
String correo2=request.getParameter("corr");
String texto=request.getParameter("message");
String Asusto=request.getParameter("Asusto");
 String de2="poo.grupo1.2022@gmail.com";
String clave2="mlmuxponggezlzts";
String para2=correo2;
  String mensaje2="Hola "+texto;
            
String asunto2=Asusto;
boolean resultado= email2.enviarcorreo(de2, clave2, para2, mensaje2, asunto2);
  response.sendRedirect("mensaje.jsp?men=Correo enviado correctamente");
        }
     
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
