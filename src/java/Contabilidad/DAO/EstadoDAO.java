/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.DAO;

import Contabilidad.Model.Estado;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Frankmer
 */
public class EstadoDAO {
    public static List<Estado> SeleccionarEstados(int ID){
        List<Estado> Estados = new ArrayList<Estado>();
        Connection con = ConexionDB.getConnectionDB();
        String query="Select * From contabilidad.estado where IdEstado =" +ID;
        try{
            ResultSet rs = con.prepareStatement(query).executeQuery();
            while(rs.next()){
                Estado estado = new Estado();
                estado.setDescripcion(rs.getString("Descripcion"));
                estado.setIdEstado(rs.getInt("Idestado"));
                Estados.add(estado);
            }
            rs.close();
            con.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return Estados;
    }
}
