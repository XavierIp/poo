/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.*;
import java.util.*;
import Util.Conexion;
public class DetalleVentaDB {
    
    public static ArrayList<DetalleVenta> obtenerdetalleVenta(int num){
     ArrayList<DetalleVenta> lista =new ArrayList<DetalleVenta>();
     
        try {
             CallableStatement cl=Conexion.getConnection().prepareCall("{call sp_detalleVenta(?)}");
             cl.setInt(1, num);
              ResultSet rs=cl.executeQuery();
              while (rs.next()) {                
                DetalleVenta v=new DetalleVenta(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getDouble(4));
                lista.add(v);
            }
        } catch (Exception e) {
        }
     
     
     
     return lista;
     }
}
