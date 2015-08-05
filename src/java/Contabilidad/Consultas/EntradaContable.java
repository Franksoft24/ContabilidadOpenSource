/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.Consultas;

import java.util.Date;

/**
 *
 * @author Frankmer
 */
public class EntradaContable {
    
    private Integer CodigoCuentaContable;
    protected String CuentaContable;
    private Integer IdEntrada;
    protected String Moneda;
    protected String Origen;
    protected String Modulo;
    protected Date Fecha;
    protected Double Monto;
    protected String Estado;
    protected String Usuario;
    
    
    public EntradaContable(){
        
    }
    
//    public EntradaContable(Integer IdEntrada, String CuentaContable, String Modulo, Integer CuentaContable, String Origen, Integer Usuario, Date FechaAsiento, Double MontoAsiento, Integer Estado, Integer TipoMoneda, Integer NumeroDocumento){
//        this.IdEntradaContable = IdEntradaContable;
//        this.Descripcion = Descripcion;
//        this.ModuloContabilidad = ModuloContabilidad;
//        this.CuentaContable = CuentaContable;
//        this.Origen = Origen;
//        this.Usuario = Usuario;
//        this.FechaAsiento = FechaAsiento;
//        this.MontoAsiento = MontoAsiento;
//        this.Estado = Estado;
//        this.TipoMoneda = TipoMoneda;
//        this.NumeroDocumento = NumeroDocumento;
//    }
//    
//    public EntradaContable(String Descripcion, String ModuloContabilidad, Integer CuentaContable, String Origen, Integer Usuario, Date FechaAsiento, Double MontoAsiento, Integer Estado, Integer TipoMoneda, Integer NumeroDocumento){
//        this.Descripcion = Descripcion;
//        this.ModuloContabilidad = ModuloContabilidad;
//        this.CuentaContable = CuentaContable;
//        this.Origen = Origen;
//        this.Usuario = Usuario;
//        this.FechaAsiento = FechaAsiento;
//        this.MontoAsiento = MontoAsiento;
//        this.Estado = Estado;
//        this.TipoMoneda = TipoMoneda;
//        this.NumeroDocumento = NumeroDocumento;
//    }
//    
    public Integer getIdEntrada(){
        return IdEntrada;
    }
    
    public void setIdEntrada(Integer IdEntrada){
        this.IdEntrada = IdEntrada;
    }
    
    public String getCuentaContable(){
        return CuentaContable;
    }
    
    public void setCuentaContable(String CuentaContable){
        this.CuentaContable = CuentaContable;
    }
    
    public String getModulo(){
        return Modulo;
    }
    
    public void setModulo(String Modulo){
        this.Modulo = Modulo;
    }
    
    public Integer getCodigoCuentaContable(){
        return CodigoCuentaContable;
    }
    
    public void setCodigoCuentaContable(Integer CodigoCuentaContable){
        this.CodigoCuentaContable = CodigoCuentaContable;
    }
    
    public String getOrigen(){
        return Origen;
    }
    
    public void setOrigen(String Origen){
        this.Origen = Origen;
    }
    
    public Date getFecha(){
        return Fecha;
    }
    
    public void setFecha(Date Fecha){
        this.Fecha = Fecha;
    }
    
    public String getUsuario(){
        return Usuario;
    }
    
    public void setUsuario(String Usuario){
        this.Usuario = Usuario;
    }
    
    public Double getMonto(){
        return Monto;
    }
    
    public void setMonto(Double Monto){
        this.Monto = Monto;
    }
    
    public String getEstado(){
        return Estado;
    }
    
    public void setEstado(String Estado){
        this.Estado = Estado;
    }
    
    public String getMoneda(){
        return Moneda;
    }
    
    public void setMoneda(String Moneda){
        this.Moneda = Moneda;
    }
    
}
