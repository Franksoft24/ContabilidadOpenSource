/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Frankmer
 */
public class ConexionDB {
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://db4free.net:3306/contabilidad0924";
    private static final String USER = "franksoft";
    private static final String PASS = "franksoftdb";
    
    private ConexionDB(){
    }    
    public static Connection getConnectionDB(){
        try {
            Class.forName(JDBC_DRIVER);
        } catch (ClassNotFoundException ex) {
            System.out.println("No se pudo cargar el driver de la base de datos.");
            return null;
        }
        Connection con = null;
        try {
            con = DriverManager.getConnection(DB_URL,USER,PASS);
        } catch (SQLException ex) {
            System.out.println("Conexion fallida a la base de datos.");
            ex.printStackTrace();
        }
        return con;
    }
}
