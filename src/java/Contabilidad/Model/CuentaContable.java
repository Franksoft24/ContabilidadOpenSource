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
public class CuentaContable {
    
    private Integer IdCuentaContable;
    protected String Descripcion;
    protected Integer TipoCuenta;
    protected String PermiteTransacciones;
    protected Integer  Nivel;
    protected Integer CuentaMayor;
    protected Double Balance;
    protected String Estado;
    
    public CuentaContable(){
        
    }
    
    public CuentaContable(Integer IdCuentaContable, String Descripcion, Integer TipoCuenta, String PermiteTransacciones, Integer Nivel, Integer CuentaMayor, Double Balance, String Estado){
        this.IdCuentaContable = IdCuentaContable;
        this.Descripcion = Descripcion;
        this.TipoCuenta = TipoCuenta;
        this.PermiteTransacciones = PermiteTransacciones;
        this.Nivel = Nivel;
        this.CuentaMayor = CuentaMayor;
        this.Balance = Balance;
        this.Estado = Estado;
    }
    public CuentaContable(Integer IdCuentaContable, String Descripcion,  String PermiteTransacciones,   Double Balance){
        this.IdCuentaContable = IdCuentaContable;
        this.Descripcion = Descripcion;
        this.PermiteTransacciones = PermiteTransacciones;
        this.Balance = Balance;
    }
    
    
    public CuentaContable(String Descripcion, Integer TipoCuenta, String PermiteTransacciones, Integer Nivel, Integer CuentaMayor, Double Balance, String Estado){
        this.Descripcion = Descripcion;
        this.TipoCuenta = TipoCuenta;
        this.PermiteTransacciones = PermiteTransacciones;
        this.Nivel = Nivel;
        this.CuentaMayor = CuentaMayor;
        this.Balance = Balance;
        this.Estado = Estado;
    }
    
    public Integer getIdCuentaContable(){
        return IdCuentaContable;
    }
    
    public void setIdCuentaContable(Integer IdCuentaContable){
        this.IdCuentaContable = IdCuentaContable;
    }
    
    public String getDescripcion(){
        return Descripcion;
    }
    
    public void setDescripcion(String Descripcion){
        this.Descripcion = Descripcion;
    }
    
    public Integer getTipoCuenta(){
        return TipoCuenta;
    }
    
    public void setTipoCuenta(Integer TipoCuenta){
        this.TipoCuenta = TipoCuenta;
    }
    
    public String getPermiteTransacciones(){
        return PermiteTransacciones;
    }
    
    public void setPermiteTransacciones(String PermiteTransacciones){
        this.PermiteTransacciones = PermiteTransacciones;
    }
    
    public Integer getNivel(){
        return Nivel;
    }
    
    public void setNivel(Integer Nivel){
        this.Nivel = Nivel;
    }
    
    public Integer getCuentaMayor(){
        return CuentaMayor;
    }
    
    public void setCuentaMayor(Integer CuentaMayor){
        this.CuentaMayor = CuentaMayor;
    }
    
    public Double getBalance(){
        return Balance;
    }
    
    public void setBalance(Double Balance){
        this.Balance = Balance;
    }
    
    public String getEstado(){
        return Estado;
    }
    
    public void setEstado(String Estado){
        this.Estado = Estado;
    }
    
}
