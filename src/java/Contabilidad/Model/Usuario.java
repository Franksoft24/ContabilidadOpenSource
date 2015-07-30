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
    protected String NickName;
    protected String Mail;
    protected String Password;
    protected Integer Rol;
    
    public Usuario(){
    
    }
    
    public Usuario(Integer IdUsuario, Integer Rol, String NickName){
        this.IdUsuario = IdUsuario;
        this.NickName = NickName;
        this.Rol = Rol;
    }
    
    public Usuario(Integer IdUsuario, String NickName, String Mail, String Password, Integer Rol){
        this.IdUsuario = IdUsuario;
        this.NickName = NickName;
        this.Mail = Mail;
        this.Password = Password;
        this.Rol = Rol;
    }
    
    public Usuario(String NickName, String Mail, String Password, Integer Rol){
        this.NickName = NickName;
        this.Mail = Mail;
        this.Password = Password;
        this.Rol = Rol;
    }
    
    public Usuario(String NickName, String Password){
        this.NickName = NickName;
        this.Password = Password;
    }
    
    public Integer getIdUsuario(){
        return IdUsuario;
    }
    
    public void setIdUsuario(Integer IdUsuario){
        this.IdUsuario = IdUsuario;
    }
    
    public String getNickName(){
        return NickName;
    }
    
    public void setNickName(String NickName){
        this.NickName = NickName;
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
    
}
