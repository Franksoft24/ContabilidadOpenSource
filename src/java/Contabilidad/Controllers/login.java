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
import Contabilidad.Model.Usuario;
import Contabilidad.DAO.UsuarioDAO;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Frankmer
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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
        String NickName = request.getParameter("Usuario");
        String Password = request.getParameter("pass");
        //Usuario usuario = new Usuario(NickName, Password);
        List<Usuario> usuarios = UsuarioDAO.validarUsuario(NickName, Password);
        if(!usuarios.isEmpty()){
            for(Usuario usuario : usuarios){
                HttpSession session = request.getSession();
                session.setAttribute("NNuser", usuario.getUsuario());
                session.setAttribute("usrcodI", usuario.getIdUsuario());
                session.setAttribute("rol", usuario.getRol());
                response.sendRedirect("/ContabilidadIntegracionOpenSource/VIEWS/MAIN");
            }
        }else{
                response.sendRedirect("/ContabilidadIntegracionOpenSource/VIEWS/Login/");
        }
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
