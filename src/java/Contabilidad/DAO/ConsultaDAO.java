/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.DAO;

import Contabilidad.Consultas.EntradaContable;
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
public class ConsultaDAO {
        public static List<EntradaContable> ConsultarEntrada(Integer Cuenta, Date FechaInicio, Date FechaFin){
        List<EntradaContable> entradasContables = new ArrayList<EntradaContable>();
        Connection con = ConexionDB.getConnectionDB();
        Date FechaInicio_ = FechaInicio != null ? new java.sql.Date(FechaInicio.getTime()) : null;
        Date FechaFin_ = FechaFin != null ? new java.sql.Date(FechaFin.getTime()) : null;
        String query ="Call Usp_Transacciones("+Cuenta+", '"+FechaInicio_+"', '"+FechaFin_+"')";
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                EntradaContable entradaContable = new EntradaContable();
                entradaContable.setIdEntrada(rs.getInt("IdEntrada"));
                entradaContable.setCuentaContable(rs.getString("CuentaContable"));
                entradaContable.setModulo(rs.getString("Modulo"));
                entradaContable.setOrigen(rs.getString("Origen"));
                entradaContable.setUsuario(rs.getString("Usuario"));
                entradaContable.setFecha(rs.getDate("Fecha"));
                entradaContable.setMonto(rs.getDouble("Monto"));
                entradaContable.setEstado(rs.getString("Estado"));
                entradaContable.setMoneda(rs.getString("Moneda"));
                entradaContable.setCodigoCuentaContable(rs.getInt("CodigoCuentaContable"));
                entradasContables.add(entradaContable);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return entradasContables;
    }
    public static void EjecutarPase(Date fecha){
        Connection con = ConexionDB.getConnectionDB();
        String query ="CALL Usp_PaseCuentasMaestras(?)";
        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setDate(1,fecha != null ? new java.sql.Date(fecha.getTime()) : null);
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
}
