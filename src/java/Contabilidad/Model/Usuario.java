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
public class Usuario {
    
    private Integer IdUsuario;
    protected String Usuario;
    protected String Mail;
    protected String Password;
    protected Integer Rol;
    protected Integer Estado;
    
    public Usuario(){
    
    }
    
    public Usuario(Integer IdUsuario, Integer Rol, String Usuario, Integer Estado){
        this.IdUsuario = IdUsuario;
        this.Usuario = Usuario;
        this.Rol = Rol;
        this.Estado = Estado;
    }
    
    public Usuario(Integer IdUsuario, String Usuario, String Mail, String Password, Integer Rol, Integer Estado){
        this.IdUsuario = IdUsuario;
        this.Usuario = Usuario;
        this.Mail = Mail;
        this.Password = Password;
        this.Rol = Rol;
        this.Estado = Estado;
    }
    
    public Usuario(String Usuario, String Mail, String Password, Integer Rol, Integer Estado){
        this.Usuario = Usuario;
        this.Mail = Mail;
        this.Password = Password;
        this.Rol = Rol;
        this.Estado = Estado;
    }
    
    public Usuario(String Usuario, String Password, Integer Estado){
        this.Usuario = Usuario;
        this.Password = Password;
        this.Estado = Estado;
    }
    
    public Integer getIdUsuario(){
        return IdUsuario;
    }
    
    public void setIdUsuario(Integer IdUsuario){
        this.IdUsuario = IdUsuario;
    }
    
    public String getUsuario(){
        return Usuario;
    }
    
    public void setUsuario(String Usuario){
        this.Usuario = Usuario;
    }
    
    public String getMail(){
        return Mail;
    }
    
    public void setMail(String Mail){
        this.Mail = Mail;
    }
    
    public String getPassword(){
        return Password;
    }
    
    public void setPassword(String Password){
        this.Password = Password;
    }
    
    public Integer getRol(){
        return Rol;
    }
    
    public void setRol(Integer Rol){
        this.Rol = Rol;
    }
    
    public Integer getEstado(){
        return Estado;
    }
    
    public void setEstado(Integer Estado){
        this.Estado = Estado;
    }
    
}
