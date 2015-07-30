/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.DAO;

import Contabilidad.Model.TipoMoneda;
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
public class MonedaDAO {
    public static List<TipoMoneda> tiposMonedaForInput(){
        List<TipoMoneda> tiposMonedas = new ArrayList<TipoMoneda>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT Descripcion, IdTipoMoneda, UltimaTasa FROM contabilidad.tiposmoneda where Estado = 'A'";
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                TipoMoneda tipoMoneda = new TipoMoneda();
                tipoMoneda.setDescripcion(rs.getString("Descripcion"));
                tipoMoneda.setUltimaTasa(rs.getDouble("UltimaTasa"));
                tipoMoneda.setIdTipoMoneda(rs.getInt("IdTipoMoneda"));
                tiposMonedas.add(tipoMoneda);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return tiposMonedas;
    }
    public static List<TipoMoneda> SeleccionarMonedaActiva(){
        List<TipoMoneda> tiposMonedas = new ArrayList<TipoMoneda>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT Descripcion, UltimaTasa FROM contabilidad.tiposmoneda where Estado = 'A'";
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                TipoMoneda tipoMoneda = new TipoMoneda();
                tipoMoneda.setDescripcion(rs.getString("Descripcion"));
                tipoMoneda.setUltimaTasa(rs.getDouble("UltimaTasa"));
                tiposMonedas.add(tipoMoneda);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return tiposMonedas;
    }
    public static List<TipoMoneda> SeleccionarMoneda(Integer ID){
        List<TipoMoneda> tiposMonedas = new ArrayList<TipoMoneda>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM contabilidad.tiposmoneda where IdTipoMoneda="+ID;
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                TipoMoneda tipoMoneda = new TipoMoneda();
                tipoMoneda.setDescripcion(rs.getString("Descripcion"));
                tipoMoneda.setIdTipoMoneda(rs.getInt("IdTipoMoneda"));
                tipoMoneda.setUltimaTasa(rs.getDouble("UltimaTasa"));
                tipoMoneda.setEstado(rs.getString("Estado"));
                tiposMonedas.add(tipoMoneda);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return tiposMonedas;
    }
    public static List<TipoMoneda> ListarMonedas(){
        List<TipoMoneda> tiposMonedas = new ArrayList<TipoMoneda>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM contabilidad.tiposmoneda";
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                TipoMoneda tipoMoneda = new TipoMoneda();
                tipoMoneda.setDescripcion(rs.getString("Descripcion"));
                tipoMoneda.setIdTipoMoneda(rs.getInt("IdTipoMoneda"));
                tipoMoneda.setUltimaTasa(rs.getDouble("UltimaTasa"));
                tipoMoneda.setEstado(rs.getString("Estado"));
                tiposMonedas.add(tipoMoneda);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return tiposMonedas;
    }
    public static void agregarMoneda(TipoMoneda Moneda){
        Connection con = ConexionDB.getConnectionDB();
        String query = "INSERT INTO contabilidad.tiposmoneda (Descripcion, UltimaTasa,"
                + "Estado) VALUES (?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, Moneda.getDescripcion());
            ps.setDouble(2, Moneda.getUltimaTasa());
            ps.setString(3, Moneda.getEstado());
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    public static void ActualizarMoneda(TipoMoneda Moneda){
        Connection con = ConexionDB.getConnectionDB();
        String query = "UPDATE contabilidad.tiposmoneda SET Descripcion = ?, UltimaTasa=?,"
                + "Estado = ? where IdTipoMoneda = ?";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, Moneda.getDescripcion());
            ps.setDouble(2, Moneda.getUltimaTasa());
            ps.setString(3, Moneda.getEstado());
            ps.setInt(4, Moneda.getIdTipoMoneda());
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    public static void eliminarMoneda(Integer Id){
        Connection con = ConexionDB.getConnectionDB();
        String query = "DELETE FROM contabilidad.tiposmoneda WHERE IdTipoMoneda = ?";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,Id);
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
}
