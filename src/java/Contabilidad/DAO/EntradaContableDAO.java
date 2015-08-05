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
import java.util.Date;
import java.util.List;

/**
 *
 * @author Frankmer
 */
public class EntradaContableDAO {
    public static void agregarEntradaContable(EntradaContable entradaContable){
        Connection con = ConexionDB.getConnectionDB();
        String query = "INSERT INTO entradacontable (Descripcion, ModuloContabilidad,"
                + "IdCuentaContable, Origen, FechaAsiento, MontoAsiento, Idestado, IdTipoMoneda, IdUsuario, NumDocumento"
                + ") VALUES (?,?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, entradaContable.getDescripcion());
            ps.setString(2, entradaContable.getModuloContabilidad());
            ps.setInt(3, entradaContable.getCuentaContable());
            ps.setString(4, entradaContable.getOrigen());
            ps.setDate(5,entradaContable.getFechaAsiento() != null ? new java.sql.Date(entradaContable.getFechaAsiento().getTime()) : null);
            ps.setDouble(6, entradaContable.getMontoAsiento());
            ps.setInt(7, entradaContable.getEstado());
            ps.setInt(8, entradaContable.getTipoMoneda());
            ps.setInt(9, entradaContable.getUsuario());
            ps.setInt(10, entradaContable.getNumeroDocumento());
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
        String query = "SELECT * FROM entradacontable where Idestado = 1 ORDER BY IdEntradaContable DESC";//Esta es una estructura de tipo lifo  ORDER BY IdEntradaContable DESC
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                EntradaContable entradaContable = new EntradaContable();
                entradaContable.setIdEntradaContable(rs.getInt("IdEntradaContable"));
                entradaContable.setDescripcion(rs.getString("Descripcion"));
                entradaContable.setModuloContabilidad(rs.getString("ModuloContabilidad"));
                entradaContable.setCuentaContable(rs.getInt("IdCuentaContable"));
                entradaContable.setOrigen(rs.getString("Origen"));
                entradaContable.setUsuario(rs.getInt("IdUsuario"));
                entradaContable.setFechaAsiento(rs.getDate("FechaAsiento"));
                entradaContable.setMontoAsiento(rs.getDouble("MontoAsiento"));
                entradaContable.setEstado(rs.getInt("Idestado"));
                entradaContable.setTipoMoneda(rs.getInt("IdTipoMoneda"));
                entradaContable.setNumeroDocumento(rs.getInt("NumDocumento"));
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
        String query = "UPDATE entradacontable SET Descripcion = ?, ModuloContabilidad=?,"
                + "IdCuentaContable = ?, Origen = ?, IdUsuario = ?, FechaAsiento = ?, MontoAsiento = ?,"
                + "IdTipoMoneda = ? where IdEntradaContable = ?";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, entradaContable.getDescripcion());
            ps.setString(2, entradaContable.getModuloContabilidad());
            ps.setInt(3, entradaContable.getCuentaContable());
            ps.setString(4, entradaContable.getOrigen());
            ps.setInt(5, entradaContable.getUsuario());
            ps.setDate(6,entradaContable.getFechaAsiento() != null ? new java.sql.Date(entradaContable.getFechaAsiento().getTime()) : null);
            ps.setDouble(7, entradaContable.getMontoAsiento());
            ps.setInt(8, entradaContable.getTipoMoneda());
            ps.setInt(9, entradaContable.getIdEntradaContable());
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
//    public static void eliminarEntradaContable(Integer Id){
//        Connection con = ConexionDB.getConnectionDB();
//        String query = "DELETE FROM contabilidad.entradacontable WHERE IdEntradaContable = ?";
//        try{
//            PreparedStatement ps = con.prepareStatement(query);
//            ps.setInt(1,Id);
//            ps.executeUpdate();
//            ps.close();
//            con.close();
//        }catch(SQLException ex){
//            ex.printStackTrace();
//        }
//    }
    public static List<EntradaContable> PrepararSentenciaDelete(int ND){
        List<EntradaContable> entradasContables = new ArrayList<EntradaContable>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "select IdEntradaContable from entradacontable where NumDocumento ="+ND;
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                EntradaContable entradaContable = new EntradaContable();
                entradaContable.setIdEntradaContable(rs.getInt("IdEntradaContable"));
                entradasContables.add(entradaContable);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return entradasContables;
    }
    
    public static List<EntradaContable> PrepararSentenciaDeletePorCuenta(int ID){
        List<EntradaContable> entradasContables = new ArrayList<EntradaContable>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "select IdEntradaContable from entradacontable where IdCuentaContable ="+ID;
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                EntradaContable entradaContable = new EntradaContable();
                entradaContable.setIdEntradaContable(rs.getInt("IdEntradaContable"));
                entradasContables.add(entradaContable);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return entradasContables;
    }
    
    public static void desactivateEntradaContable(int ID){
        Connection con = ConexionDB.getConnectionDB();
        String query = "UPDATE entradacontable SET Idestado = 3 where IdEntradaContable = ?";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ID);
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
        String query = "SELECT * FROM entradacontable WHERE IdEntradaContable = " +ID;//Esta es una estructura de tipo lifo
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                EntradaContable entradaContable = new EntradaContable();
                entradaContable.setIdEntradaContable(rs.getInt("IdEntradaContable"));
                entradaContable.setDescripcion(rs.getString("Descripcion"));
                entradaContable.setModuloContabilidad(rs.getString("ModuloContabilidad"));
                entradaContable.setCuentaContable(rs.getInt("IdCuentaContable"));
                entradaContable.setOrigen(rs.getString("Origen"));
                entradaContable.setUsuario(rs.getInt("IdUsuario"));
                entradaContable.setFechaAsiento(rs.getDate("FechaAsiento"));
                entradaContable.setMontoAsiento(rs.getDouble("MontoAsiento"));
                entradaContable.setEstado(rs.getInt("Idestado"));
                entradaContable.setTipoMoneda(rs.getInt("IdTipoMoneda"));
                entradaContable.setNumeroDocumento(rs.getInt("NumDocumento"));
                entradasContables.add(entradaContable);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return entradasContables;
    }
       
    public static Integer UltimoDocumentoContable(){
        int ultimoNum = 0;
        Connection con = ConexionDB.getConnectionDB();
        String query = "select MAX(NumDocumento) from entradacontable";
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                ultimoNum = rs.getInt("MAX(NumDocumento)");
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return ultimoNum;
    }
    
}
