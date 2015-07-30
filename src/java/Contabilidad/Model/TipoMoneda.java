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
public class TipoMoneda {
    
    private Integer IdTipoMoneda;
    protected String Descripcion;
    protected Double UltimaTasa;
    protected String Estado;
    
    public TipoMoneda(){
        
    }
    
    public TipoMoneda(String Descripcion, Double UltimaTasa, String Estado){
        this.Descripcion = Descripcion;
        this.UltimaTasa = UltimaTasa;
        this.Estado=Estado;
    }
    
    public TipoMoneda(String Descripcion, Integer IdTipoMoneda){
        this.IdTipoMoneda = IdTipoMoneda;
        this.Descripcion = Descripcion;
    }
    
    public TipoMoneda(Integer IdTipoMoneda, String Descripcion, Double UltimaTasa, String Estado){
        this.IdTipoMoneda = IdTipoMoneda;
        this.Descripcion = Descripcion;
        this.UltimaTasa = UltimaTasa;
        this.Estado=Estado;
    }
    
    public Integer getIdTipoMoneda(){
        return IdTipoMoneda;
    }
    
    public void setIdTipoMoneda(Integer IdTipoMoneda){
        this.IdTipoMoneda = IdTipoMoneda;
    }
    
    public String getDescripcion(){
        return Descripcion;
    }
    
    public void setDescripcion(String Descripcion){
        this.Descripcion = Descripcion;
    }
    
    public Double getUltimaTasa(){
        return UltimaTasa;
    }
    
    public void setUltimaTasa(Double UltimaTasa){
        this.UltimaTasa = UltimaTasa;
    }
    
    public String getEstado(){
        return Estado;
    }
    
    public void setEstado(String Estado){
        this.Estado = Estado;
    }
    
}
