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
import jakarta.servlet.http.HttpSession;

import java.sql.*;
import Util.Conexion;
@WebServlet(name = "ServletLogueo", urlPatterns = {"/ServletLogueo"})
public class ServletLogueo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String accion = request.getParameter("accion");
           if (accion.equals("loguin")) {
          
               String usu=request.getParameter("txtUsu");
                String pas=request.getParameter("txtPass");
                try {
                    CallableStatement cl=Conexion.getConnection().prepareCall("{call sp_loguin(?,?)}");
                    cl.setString(1, usu);
                    cl.setString(2, pas);
                    ResultSet rs=cl.executeQuery();
                    if (rs.next()) {
                        HttpSession sessionOK=request.getSession();
                         sessionOK.setAttribute("codigo", (String)rs.getString(1));
                        sessionOK.setAttribute("perfil", (String)rs.getString(5));
                         sessionOK.setAttribute("nom", (String)rs.getString(3));
                          sessionOK.setAttribute("ape", (String)rs.getString(2));
                            sessionOK.setAttribute("dist", (String)rs.getString(4));
                             sessionOK.setAttribute("corr", (String)rs.getString(6));
                          request.getRequestDispatcher("index.jsp").forward(request, response);
                    }else{
                  request.setAttribute("msg", "Error de Usuario o Contraseña");
                     request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
               } catch (Exception e) { System.out.println(e);
               }
           }else if (accion.equals("cerrar")) {
              HttpSession sessionOK=request.getSession();
               request.getSession().removeAttribute("codigo");
              request.getSession().removeAttribute("perfil");
               request.getSession().removeAttribute("nom");
                request.getSession().removeAttribute("ape");
                 request.getSession().removeAttribute("dist");
                request.getSession().removeAttribute("corr");
                sessionOK.invalidate();
                     request.getRequestDispatcher("index.jsp").forward(request, response);
        }else if (accion.equals("cancelar")) {
              HttpSession sessionOK=request.getSession();
              request.getSession().removeAttribute("carrito");
              
                     request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        
        
        
        
        
    




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
