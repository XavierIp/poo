
package Modelo;
  import java.sql.*;
  import java.util.ArrayList;
  import Util.Conexion;
public class ProductoDB {
    public static ArrayList<Producto> obteneProductos(){
    ArrayList<Producto> lista=new ArrayList<Producto>(); 
        try {
            CallableStatement cl=Conexion.getConnection().prepareCall("select * from producto where stock >0");
            ResultSet rs=cl.executeQuery();
            while (rs.next()) {
                Producto p=new Producto(rs.getInt(1),rs.getString(2),
                rs.getDouble(3),rs.getString(4),rs.getInt(5));
                lista.add(p);
            }
        } catch (Exception e) {}
    return lista;
    }
    
      public static Producto obteneProductos(int codigo){
    Producto p=null;
          try {
           CallableStatement cl=Conexion.getConnection().prepareCall("{call sp_ProductoCod(?)}");
           cl.setInt(1, codigo);
           ResultSet rs=cl.executeQuery();
            while (rs.next()) {
                p=new Producto(rs.getInt(1),rs.getString(2),
                rs.getDouble(3),rs.getString(4),rs.getInt(5));
            }
              
          } catch (Exception e) { }
    return p; 
    }
       public static boolean actualizarProductos(Producto varProducto){
       boolean rpta=false;
       
           try {
               Connection cn=Conexion.getConnection();
                CallableStatement cl=cn.prepareCall("{call sp_actualizarPro(?,?,?,?)}");
               cl.setInt(1, varProducto.getCodigoProducto());
               cl.setString(2, varProducto.getNombre());
               cl.setDouble(3, varProducto.getPrecio());
                cl.setInt(4, varProducto.getStock());
               int i=cl.executeUpdate();
               if (i==1) {
                   rpta=true;
               }else{
                    rpta=false;
               }
                
           } catch (Exception e) {
           }
       
       return rpta;
       }
       
         public static boolean insertarProducto(Producto p){
       boolean rpta=false;
       
           try {
               Connection cn=Conexion.getConnection();
                CallableStatement cl=cn.prepareCall("{call sp_insertarPro(?,?,?,?)}");
               cl.setString(1, p.getNombre());
               cl.setDouble(2, p.getPrecio());
               cl.setString(3, p.getImagen());
                cl.setInt(4, p.getStock());
               int i=cl.executeUpdate();
               if (i==1) {
                   rpta=true;
               }else{
                    rpta=false;
               }
                
           } catch (Exception e) {
           }
       
       return rpta;
       }
         
         
}
