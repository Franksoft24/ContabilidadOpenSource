/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.DAO;

import Contabilidad.Model.EntradaContable;
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
public class EntradaContableDAO {
    public static void agregarEntradaContable(EntradaContable entradaContable){
        Connection con = ConexionDB.getConnectionDB();
        String query = "INSERT INTO contabilidad.entradacontable (Descripcion, ModuloContabilidad,"
                + "IdCuentaContable, Origen, Usuario, FechaAsiento, MontoAsiento, Estado, IdTipoMoneda"
                + ") VALUES (?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, entradaContable.getDescripcion());
            ps.setString(2, entradaContable.getModuloContabilidad());
            ps.setInt(3, entradaContable.getCuentaContable());
            ps.setString(4, entradaContable.getOrigen());
            ps.setInt(5, entradaContable.getUsuario());
            ps.setDate(6,entradaContable.getFechaAsiento() != null ? new java.sql.Date(entradaContable.getFechaAsiento().getTime()) : null);
            ps.setDouble(7, entradaContable.getMontoAsiento());
            ps.setString(8, entradaContable.getEstado());
            ps.setInt(9, entradaContable.getTipoMoneda());
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    public static List<EntradaContable> MostrarEntradasContables(){
        List<EntradaContable> entradasContables = new ArrayList<EntradaContable>();
        Connection con  = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM contabilidad.entradacontable ORDER BY IdEntradaContable DESC";//Esta es una estructura de tipo lifo
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                EntradaContable entradaContable = new EntradaContable();
                entradaContable.setIdEntradaContable(rs.getInt("IdEntradaContable"));
                entradaContable.setDescripcion(rs.getString("Descripcion"));
                entradaContable.setModuloContabilidad(rs.getString("ModuloContabilidad"));
                entradaContable.setCuentaContable(rs.getInt("IdCuentaContable"));
                entradaContable.setOrigen(rs.getString("Origen"));
                entradaContable.setUsuario(rs.getInt("Usuario"));
                entradaContable.setFechaAsiento(rs.getDate("FechaAsiento"));
                entradaContable.setMontoAsiento(rs.getDouble("MontoAsiento"));
                entradaContable.setEstado(rs.getString("Estado"));
                entradaContable.setTipoMoneda(rs.getInt("IdTipoMoneda"));
                entradasContables.add(entradaContable);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return entradasContables;
    }
    public static void actualizarEntradaContable(EntradaContable entradaContable){
        Connection con = ConexionDB.getConnectionDB();
        String query = "UPDATE contabilidad.entradacontable SET Descripcion = ?, ModuloContabilidad=?,"
                + "IdCuentaContable = ?, Origen = ?, Usuario = ?, FechaAsiento = ?, MontoAsiento = ?,"
                + "Estado = ?, IdTipoMoneda = ? where IdEntradaContable = ?";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, entradaContable.getDescripcion());
            ps.setString(2, entradaContable.getModuloContabilidad());
            ps.setInt(3, entradaContable.getCuentaContable());
            ps.setString(4, entradaContable.getOrigen());
            ps.setInt(5, entradaContable.getUsuario());
            ps.setDate(6,entradaContable.getFechaAsiento() != null ? new java.sql.Date(entradaContable.getFechaAsiento().getTime()) : null);
            ps.setDouble(7, entradaContable.getMontoAsiento());
            ps.setString(8, entradaContable.getEstado());
            ps.setInt(9, entradaContable.getTipoMoneda());
            ps.setInt(10, entradaContable.getIdEntradaContable());
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    public static void eliminarEntradaContable(Integer Id){
        Connection con = ConexionDB.getConnectionDB();
        String query = "DELETE FROM contabilidad.entradacontable WHERE IdEntradaContable = ?";
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
    public static List<EntradaContable> SeleccionarEntradaContable(int ID){
        List<EntradaContable> entradasContables = new ArrayList<EntradaContable>();
        Connection con  = ConexionDB.getConnectionDB();
        String query = "SELECT * FROM contabilidad.entradacontable WHERE IdEntradaContable = " +ID;//Esta es una estructura de tipo lifo
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                EntradaContable entradaContable = new EntradaContable();
                entradaContable.setIdEntradaContable(rs.getInt("IdEntradaContable"));
                entradaContable.setDescripcion(rs.getString("Descripcion"));
                entradaContable.setModuloContabilidad(rs.getString("ModuloContabilidad"));
                entradaContable.setCuentaContable(rs.getInt("IdCuentaContable"));
                entradaContable.setOrigen(rs.getString("Origen"));
                entradaContable.setUsuario(rs.getInt("Usuario"));
                entradaContable.setFechaAsiento(rs.getDate("FechaAsiento"));
                entradaContable.setMontoAsiento(rs.getDouble("MontoAsiento"));
                entradaContable.setEstado(rs.getString("Estado"));
                entradaContable.setTipoMoneda(rs.getInt("IdTipoMoneda"));
                entradasContables.add(entradaContable);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return entradasContables;
    }
}
