/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.DAO;

import Contabilidad.Model.TipoCuenta;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Frankmer
 */
public class TipoCuentaDAO {
    public static List<TipoCuenta> TiposCuentaForInput(){
        List<TipoCuenta> tiposCuentas = new ArrayList<TipoCuenta>();
        Connection con = ConexionDB.getConnectionDB();
        String query="Select Descripcion, IdTipoCuenta From contabilidad.tiposcuentas where Estado = 'A'";
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                TipoCuenta tipoCuenta = new TipoCuenta();
                tipoCuenta.setDescripcion(rs.getString("Descripcion"));
                tipoCuenta.setIdTipoCuenta(rs.getInt("IdTipoCuenta"));
                tiposCuentas.add(tipoCuenta);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return tiposCuentas;
    }
    public static List<TipoCuenta> seleccionarCuentaForInput(Integer ID){
        List<TipoCuenta> tiposCuentas = new ArrayList<TipoCuenta>();
        Connection con = ConexionDB.getConnectionDB();
        String query="Select Descripcion, IdTipoCuenta From contabilidad.tiposcuentas where Estado = 'A' and IdTipoCuenta ="+ID;
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                TipoCuenta tipoCuenta = new TipoCuenta();
                tipoCuenta.setDescripcion(rs.getString("Descripcion"));
                tipoCuenta.setIdTipoCuenta(rs.getInt("IdTipoCuenta"));
                tiposCuentas.add(tipoCuenta);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return tiposCuentas;
    }
}
