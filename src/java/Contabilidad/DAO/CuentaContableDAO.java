/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.DAO;

import Contabilidad.Model.CuentaContable;
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
public class CuentaContableDAO {
    public static void agregarCuentaContable(CuentaContable cuentaContable){
        Connection con = ConexionDB.getConnectionDB();
        String query = "INSERT INTO contabilidad.cuentascontables (Descripcion, TipodeCuenta,"
                + "PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado"
                + ") VALUES (?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cuentaContable.getDescripcion());
            ps.setInt(2, cuentaContable.getTipoCuenta());
            ps.setString(3, cuentaContable.getPermiteTransacciones());
            ps.setInt(4, cuentaContable.getNivel());
            ps.setInt(5, cuentaContable.getCuentaMayor());
            ps.setDouble(6, cuentaContable.getBalance());
            ps.setString(7, cuentaContable.getEstado());
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    public static List<CuentaContable> ListarCuentas(){
        List<CuentaContable> cuentasContables = new ArrayList<CuentaContable>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "Select * from contabilidad.CuentasContables where Estado = 'A'";
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                CuentaContable cuentaContable = new CuentaContable();
                cuentaContable.setIdCuentaContable(rs.getInt("IdCuentaContable"));
                cuentaContable.setDescripcion(rs.getString("Descripcion"));
                cuentaContable.setTipoCuenta(rs.getInt("TipodeCuenta"));
                cuentaContable.setPermiteTransacciones(rs.getString("PermiteTransacciones"));
                cuentaContable.setNivel(rs.getInt("Nivel"));
                cuentaContable.setCuentaMayor(rs.getInt("CuentaMayor"));
                cuentaContable.setBalance(rs.getDouble("Balance"));
                cuentaContable.setEstado(rs.getString("Estado"));
                cuentasContables.add(cuentaContable);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return cuentasContables;
    }
    public static List<CuentaContable> SeleccionarCuenta(Integer ID){
        List<CuentaContable> cuentasContables = new ArrayList<CuentaContable>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "Select * from contabilidad.CuentasContables where IdCuentaContable = " +ID;
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                CuentaContable cuentaContable = new CuentaContable();
                cuentaContable.setIdCuentaContable(rs.getInt("IdCuentaContable"));
                cuentaContable.setDescripcion(rs.getString("Descripcion"));
                cuentaContable.setTipoCuenta(rs.getInt("TipodeCuenta"));
                cuentaContable.setPermiteTransacciones(rs.getString("PermiteTransacciones"));
                cuentaContable.setNivel(rs.getInt("Nivel"));
                cuentaContable.setCuentaMayor(rs.getInt("CuentaMayor"));
                cuentaContable.setBalance(rs.getDouble("Balance"));
                cuentaContable.setEstado(rs.getString("Estado"));
                cuentasContables.add(cuentaContable);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return cuentasContables;
    }
    public static void actualizarCuentaContable(CuentaContable cuentaContable){
        Connection con = ConexionDB.getConnectionDB();
        String query = "UPDATE contabilidad.cuentascontables SET Descripcion = ?, TipodeCuenta=?,"
                + "PermiteTransacciones = ?, Nivel = ?, CuentaMayor = ?,"
                + "Estado = ? where IdCuentaContable = ?";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cuentaContable.getDescripcion());
            ps.setInt(2, cuentaContable.getTipoCuenta());
            ps.setString(3, cuentaContable.getPermiteTransacciones());
            ps.setInt(4, cuentaContable.getNivel());
            ps.setInt(5, cuentaContable.getCuentaMayor());
            ps.setString(6, cuentaContable.getEstado());
            ps.setInt(7, cuentaContable.getIdCuentaContable());
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    /*public static void eliminarCuentaContable(Integer Id){
        Connection con = ConexionDB.getConnectionDB();
        String query = "DELETE FROM contabilidad.cuentascontables WHERE IdCuentaContable = ? and Nivel>2";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,Id);
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }*/
    
    public static void DesactivarCuentaContable(Integer Id){
        Connection con = ConexionDB.getConnectionDB();
        String query = "UPDATE contabilidad.cuentascontables SET Estado = 'I' "
                + "where IdCuentaContable = ? and Nivel = 3";
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
    
    public static List<CuentaContable> SeleccionarCuentaInput(){
        List<CuentaContable> cuentasContables = new ArrayList<CuentaContable>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "Select IdCuentaContable,Descripcion  from contabilidad.CuentasContables "
                + "where Nivel = 3 and PermiteTransacciones = 'SI' and Estado = 'A'";
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                CuentaContable cuentaContable = new CuentaContable();
                cuentaContable.setIdCuentaContable(rs.getInt("IdCuentaContable"));
                cuentaContable.setDescripcion(rs.getString("Descripcion"));
                /*cuentaContable.setTipoCuenta(rs.getInt("TipodeCuenta"));
                cuentaContable.setPermiteTransacciones(rs.getString("PermiteTransacciones"));
                cuentaContable.setNivel(rs.getInt("Nivel"));
                cuentaContable.setCuentaMayor(rs.getInt("CuentaMayor"));
                cuentaContable.setBalance(rs.getDouble("Balance"));
                cuentaContable.setEstado(rs.getString("Estado"));*/
                cuentasContables.add(cuentaContable);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return cuentasContables;
    }
}
