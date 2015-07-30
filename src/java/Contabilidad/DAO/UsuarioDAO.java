/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.DAO;

import Contabilidad.Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Frankmer
 */
public class UsuarioDAO {
    
    public static List<Usuario> validarUsuario(String NickName, String Pass){
        List<Usuario> usuarios = new ArrayList<Usuario>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT IdUsuario, Rol, NickName FROM contabilidad.Usuarios where NickName = '" + NickName + "' and Password = '" + Pass + "'";
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("IdUsuario"));
                usuario.setRol(rs.getInt("Rol"));
                usuario.setNickName(rs.getString("NickName"));
                usuarios.add(usuario);
                
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return usuarios;
        
    }
    
    public static List<Usuario> selectUser(Integer id){
        List<Usuario> usuarios = new ArrayList<Usuario>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM contabilidad.Usuarios where IdUsuario = " + id;
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("IdUsuario"));
                usuario.setNickName(rs.getString("NickName"));
                usuario.setMail(rs.getString("Mail"));
                usuario.setPassword(rs.getString("Password"));
                usuario.setRol(rs.getInt("Rol"));
                usuarios.add(usuario);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return usuarios;
    }
    
    public static void AgregarUsuario(Usuario usuario){
        Connection con = ConexionDB.getConnectionDB();
        String query = "INSERT INTO contabilidad.Usuarios(NickName, Mail, Password, Rol) VALUES (?,?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, usuario.getNickName());
            ps.setString(2, usuario.getMail());
            ps.setString(3, usuario.getPassword());
            ps.setInt(4, usuario.getRol());
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static void EditarRolOrMailUsuario(Usuario usuario){
        Connection con = ConexionDB.getConnectionDB();
        String query = "UPDATE contabilidad.Usuarios SET Rol = ?, Mail = ? WHERE IdUsuario = ?";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, usuario.getRol());
            ps.setString(2, usuario.getMail());
            ps.setInt(3, usuario.getIdUsuario());
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static void CambiarPasswordUsuario(Usuario usuario){
        Connection con = ConexionDB.getConnectionDB();
        String query = "UPDATE contabilidad.Usuarios SET Password = ? WHERE IdUsuario = ?";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, usuario.getPassword());
            ps.setInt(2, usuario.getIdUsuario());
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
}
