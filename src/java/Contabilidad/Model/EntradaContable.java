/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.Model;

import java.util.Date;

/**
 *
 * @author Frankmer
 */
public class EntradaContable {
    
    private Integer IdEntradaContable;
    protected String Descripcion;
    protected String ModuloContabilidad;
    protected Integer CuentaContable;
    protected String Origen;
    protected Integer Usuario;
    protected Date FechaAsiento;
    protected Double MontoAsiento;
    protected String Estado;
    protected Integer TipoMoneda;
    
    public EntradaContable(){
        
    }
    
    public EntradaContable(Integer IdEntradaContable, String Descripcion, String ModuloContabilidad, Integer CuentaContable, String Origen, Integer Usuario, Date FechaAsiento, Double MontoAsiento, String Estado, Integer TipoMoneda){
        this.IdEntradaContable = IdEntradaContable;
        this.Descripcion = Descripcion;
        this.ModuloContabilidad = ModuloContabilidad;
        this.CuentaContable = CuentaContable;
        this.Origen = Origen;
        this.Usuario = Usuario;
        this.FechaAsiento = FechaAsiento;
        this.MontoAsiento = MontoAsiento;
        this.Estado = Estado;
        this.TipoMoneda = TipoMoneda;
    }
    
    public EntradaContable(String Descripcion, String ModuloContabilidad, Integer CuentaContable, String Origen, Integer Usuario, Date FechaAsiento, Double MontoAsiento, String Estado, Integer TipoMoneda){
        this.Descripcion = Descripcion;
        this.ModuloContabilidad = ModuloContabilidad;
        this.CuentaContable = CuentaContable;
        this.Origen = Origen;
        this.Usuario = Usuario;
        this.FechaAsiento = FechaAsiento;
        this.MontoAsiento = MontoAsiento;
        this.Estado = Estado;
        this.TipoMoneda = TipoMoneda;
    }
    
    public Integer getIdEntradaContable(){
        return IdEntradaContable;
    }
    
    public void setIdEntradaContable(Integer IdEntradaContable){
        this.IdEntradaContable = IdEntradaContable;
    }
    
    public String getDescripcion(){
        return Descripcion;
    }
    
    public void setDescripcion(String Descripcion){
        this.Descripcion = Descripcion;
    }
    
    public String getModuloContabilidad(){
        return ModuloContabilidad;
    }
    
    public void setModuloContabilidad(String ModuloContabilidad){
        this.ModuloContabilidad = ModuloContabilidad;
    }
    
    public Integer getCuentaContable(){
        return CuentaContable;
    }
    
    public void setCuentaContable(Integer CuentaContable){
        this.CuentaContable = CuentaContable;
    }
    
    public String getOrigen(){
        return Origen;
    }
    
    public void setOrigen(String Origen){
        this.Origen = Origen;
    }
    
    public Date getFechaAsiento(){
        return FechaAsiento;
    }
    
    public Integer getUsuario(){
        return Usuario;
    }
    
    public void setUsuario(Integer Usuario){
        this.Usuario = Usuario;
    }
    
    public void setFechaAsiento(Date FechaAsiento){
        this.FechaAsiento = FechaAsiento;
    }
    
    public Double getMontoAsiento(){
        return MontoAsiento;
    }
    
    public void setMontoAsiento(Double MontoAsiento){
        this.MontoAsiento = MontoAsiento;
    }
    
    public String getEstado(){
        return Estado;
    }
    
    public void setEstado(String Estado){
        this.Estado = Estado;
    }
    
    public Integer getTipoMoneda(){
        return TipoMoneda;
    }
    
    public void setTipoMoneda(Integer TipoMoneda){
        this.TipoMoneda = TipoMoneda;
    }
    
}
