/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.Controllers;

import Contabilidad.DAO.CuentaContableDAO;
import Contabilidad.Model.CuentaContable;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Frankmer
 */
@WebServlet(name = "EditarCuentaC", urlPatterns = {"/EditarCuentaC"})
public class EditarCuentaC extends HttpServlet {

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
        int TipoCuenta = Integer.parseInt(request.getParameter("TipoCuenta"));
        String PermiteTransacciones = request.getParameter("PermiteTransacciones");
        int Nivel = Integer.parseInt(request.getParameter("Nivel"));
        int CuentaMayor = Integer.parseInt(request.getParameter("CuentaMayor"));
        double Balance = Double.parseDouble(request.getParameter("Balance"));
        String Estado = request.getParameter("Estado");
        int ID = Integer.parseInt(request.getParameter("CuentaContableID"));
        CuentaContable cuentaContable = new CuentaContable(ID, Descripcion, TipoCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado);
        CuentaContableDAO.actualizarCuentaContable(cuentaContable);
        response.sendRedirect("VIEWS/CuentasContables/details.jsp?ID="+ID);
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
