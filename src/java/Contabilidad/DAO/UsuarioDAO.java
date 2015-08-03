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
    
    public static List<Usuario> validarUsuario(String Usuario, String Pass){
        List<Usuario> usuarios = new ArrayList<Usuario>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT IdUsuario, idrol, Usuario FROM contabilidad.usuario "
                + "where Usuario = '" + Usuario + "' "
                + "and password = '" + Pass + "' "
                + "and estado = 1";
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("IdUsuario"));
                usuario.setRol(rs.getInt("idrol"));
                usuario.setUsuario(rs.getString("Usuario"));
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
        String query = "SELECT * FROM contabilidad.usuario where IdUsuario = " + id;
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("IdUsuario"));
                usuario.setUsuario(rs.getString("Usuario"));
                usuario.setMail(rs.getString("mail"));
                //usuario.setPassword(rs.getString("password"));
                usuario.setRol(rs.getInt("idrol"));
                usuario.setEstado(rs.getInt("estado"));
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
        String query = "INSERT INTO contabilidad.usuario(Usuario, mail, password, idrol, estado) VALUES (?,?,?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, usuario.getUsuario());
            ps.setString(2, usuario.getMail());
            ps.setString(3, usuario.getPassword());
            ps.setInt(4, usuario.getRol());
            ps.setInt(5, usuario.getEstado());
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public static void EditarRolOrMailUsuario(Usuario usuario){
        Connection con = ConexionDB.getConnectionDB();
        String query = "UPDATE contabilidad.usuario SET Rol = ?, Mail = ? WHERE IdUsuario = ?";
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
        String query = "UPDATE contabilidad.usuario SET Password = ? WHERE IdUsuario = ?";
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
