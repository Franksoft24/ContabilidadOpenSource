/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.DAO;

import Contabilidad.Model.TipoMoneda;
import java.sql.Connection;
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
    public static List<TipoMoneda> SeleccionarMoneda(Integer ID){
        List<TipoMoneda> tiposMonedas = new ArrayList<TipoMoneda>();
        Connection con = ConexionDB.getConnectionDB();
        String query = "SELECT Descripcion, IdTipoMoneda FROM contabilidad.tiposmoneda where Estado = 'A' AND IdTipoMoneda="+ID;
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                TipoMoneda tipoMoneda = new TipoMoneda();
                tipoMoneda.setDescripcion(rs.getString("Descripcion"));
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
}
