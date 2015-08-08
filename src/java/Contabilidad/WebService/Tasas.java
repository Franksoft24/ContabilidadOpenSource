/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.WebService;


import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
/**
 *
 * @author alberto
 */
public class Tasas {
    
    private String TasaCode;
    protected Double Compra;
    protected Double Venta;
    
    public String getTasaCode(){
        return TasaCode;
    }
    
    public void setTasaCode(String TasaCode){
        this.TasaCode = TasaCode;
    }
    
    public Double getCompra(){
        return Compra;
    }
    
    public void setCompra(Double Compra){
        this.Compra = Compra;
    }
    
    public Double getVenta(){
        return Venta;
    }
    
    public void setVenta(Double Venta){
        this.Venta = Venta;
    }
    
}
