/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Util;

import java.sql.*;

/**
 *
 * @author xibar
 */
public class Conexion {
    
    public static Connection getConnection(){
        Connection cn=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bdventa?useSSL=false&allowPublicKeyRetrieval=true", "root", "123456");
         System.out.println("conexion correcta");
        } catch (Exception e) {
            System.out.println("Error de conexion"+e);
        }
        return cn;
    }

  
    public static void main(String[] args) {
       Conexion.getConnection();
    }
    
}
