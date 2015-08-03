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
public class Estado {
    private Integer IdEstado;
    protected String Descripcion;
    
    public Estado(){
        
    }
    
    public Estado(Integer IdEstado, String Descripcion){
        this.IdEstado = IdEstado;
        this.Descripcion = Descripcion;
    }
    
    public Integer getIdEstado(){
        return IdEstado;
    }
    
    public void setIdEstado(Integer IdEstado){
        this.IdEstado = IdEstado;
    }
    
    public String getDescripcion(){
        return Descripcion;
    }
    
    public void setDescripcion(String Descripcion){
        this.Descripcion = Descripcion;
    }
}
