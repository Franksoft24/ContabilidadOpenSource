/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.Controllers;

import Contabilidad.DAO.EntradaContableDAO;
import Contabilidad.Model.EntradaContable;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Frankmer
 */
@WebServlet(name = "EditarEntrada", urlPatterns = {"/EditarEntrada"})
public class EditarEntrada extends HttpServlet {

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
        int IdCuentaContable = Integer.parseInt(request.getParameter("IdCuentaContable"));
        String Origen = request.getParameter("Origen");
        int Usuario = Integer.parseInt(request.getParameter("Usuario"));
        Date FechaAsiento = null;
        try{    
            FechaAsiento = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("FechaAsiento"));
        }catch (ParseException ex){
            ex.printStackTrace();
        }
        Double MontoAsiento = Double.parseDouble(request.getParameter("MontoAsiento"));
        String Estado = request.getParameter("Estado");
        int IdTipoMoneda = Integer.parseInt(request.getParameter("IdTipoMoneda"));
        int IdEntradaContable = Integer.parseInt(request.getParameter("IdEntradaContable"));
        
        EntradaContable entradaContable = new EntradaContable(IdEntradaContable, Descripcion, ModuloContabilidad, IdCuentaContable, Origen, Usuario, FechaAsiento, MontoAsiento, Estado, IdTipoMoneda);
        EntradaContableDAO.actualizarEntradaContable(entradaContable);
        response.sendRedirect("VIEWS/EntradasContables/details.jsp?ID="+IdEntradaContable);
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
