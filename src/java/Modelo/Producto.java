
package Modelo;
public class Producto {
    private int codigoProducto;
    private String nombre;
    private double precio;
    private String imagen;
       private int stock;

    public Producto(int codigoProducto, String nombre, double precio, String imagen,int stock) {
        this.codigoProducto = codigoProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.imagen = imagen;
         this.stock = stock;
        
    }

    public Producto(int codigoProducto, String nombre, double precio,int stock) {
        this.codigoProducto = codigoProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.stock = stock;
    }

    public Producto(String nombre, double precio, String imagen,int stock) {
        this.nombre = nombre;
        this.precio = precio;
        this.imagen = imagen;
          this.stock = stock;
    }

    
    public int getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    
    
}
