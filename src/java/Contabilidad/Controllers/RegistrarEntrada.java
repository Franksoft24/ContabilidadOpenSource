/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Contabilidad.Model.EntradaContable;
import Contabilidad.DAO.EntradaContableDAO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Frankmer
 */
@WebServlet(name = "RegistrarEntrada", urlPatterns = {"/RegistrarEntrada"})
public class RegistrarEntrada extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Descripcion = request.getParameter("Descripcion");
        String ModuloContabilidad = request.getParameter("ModuloContabilidad");
        int IdCuentaContableDB = Integer.parseInt(request.getParameter("IdCuentaContableDB"));
        int IdCuentaContableCR = Integer.parseInt(request.getParameter("IdCuentaContableCR"));
        String Origen = "DB";
        int Usuario = Integer.parseInt(request.getParameter("Usuario"));
        Date FechaAsiento = null;
        try{    
            FechaAsiento = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("FechaAsiento"));
        }catch (ParseException ex){
            ex.printStackTrace();
        }
        Double MontoAsiento = Double.parseDouble(request.getParameter("MontoAsiento"));
        int Estado = 1;
        int IdTipoMoneda = Integer.parseInt(request.getParameter("IdTipoMoneda"));
        int NumeroDocumento = EntradaContableDAO.UltimoDocumentoContable() + 1;
        EntradaContable entradaContableDB = new EntradaContable(Descripcion, ModuloContabilidad, IdCuentaContableDB, "DB", Usuario, FechaAsiento, MontoAsiento, Estado, IdTipoMoneda, NumeroDocumento);
        EntradaContable entradaContableCR = new EntradaContable(Descripcion, ModuloContabilidad, IdCuentaContableCR, "CR", Usuario, FechaAsiento, MontoAsiento, Estado, IdTipoMoneda, NumeroDocumento);
        EntradaContableDAO.agregarEntradaContable(entradaContableDB);
        EntradaContableDAO.agregarEntradaContable(entradaContableCR);
        response.sendRedirect("VIEWS/EntradasContables/List.jsp");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
