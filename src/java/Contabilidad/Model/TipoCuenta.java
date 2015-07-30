/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.Model;

/**
 *
 * @author Frankmer
 */
public class TipoCuenta {
    
    private Integer IdTipoCuenta;
    protected String Descripcion;
    protected String Origen;
    protected String Estado;
    
    public TipoCuenta(){
        
    }
    
    public TipoCuenta(Integer IdTipoCuenta, String Descripcion, String Origen, String Estado){
        this.IdTipoCuenta = IdTipoCuenta;
        this.Descripcion = Descripcion;
        this.Origen = Origen;
        this.Estado = Estado;
    }
    
    public TipoCuenta(String Descripcion, String Origen, String Estado){
        this.Descripcion = Descripcion;
        this.Origen = Origen;
        this.Estado = Estado;
    }
    
    public Integer getIdTipoCuenta(){
        return IdTipoCuenta;
    }
    
    public void setIdTipoCuenta(Integer IdTipoCuenta){
        this.IdTipoCuenta = IdTipoCuenta;
    }
    
    public String getDescripcion(){
        return Descripcion;
    }
    
    public void setDescripcion(String Descripcion){
        this.Descripcion = Descripcion;
    }
    
    public String getOrigen(){
        return Origen;
    }
    
    public void setOrigen(String Origen){
        this.Origen = Origen;
    }
    public String getEstado(){
        return Estado;
    }
    
    public void setEstado(String Estado){
        this.Estado = Estado;
    }
    
}
