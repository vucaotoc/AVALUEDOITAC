/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DoiTacHS;

import DoiTacNH.objDoiTacNH;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nguyenvu
 */
@WebServlet(name = "sl_Doitachs", urlPatterns = {"/hosodt"})
public class sl_Doitachs extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("title_page", "Hồ Sơ Sơ Bộ");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        if (session.getAttribute("avl_dangnhap") != null) {
            objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
            if (request.getParameter("getlist") != null) {
                ArrayList<objDoiTacHS> arr = daDoiTacHS.getAllHSsobo(avl_login.getIddtnh(), avl_login.getDbname());
                String json = "{\"hoso\":" + new Gson().toJson(arr) + "}";
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.println(json);
            } else if (request.getParameter("id") != null) {
                int id = DATA.function.convertStringToint(request.getParameter("id"));
                //System.out.println("a " +id);
                ArrayList<objDoiTacHS> arrhs = daDoiTacHS.getAllHSsoboby_id(avl_login.getIddtnh(), id, avl_login.getDbname());
                String json = "{\"cths\":" + new Gson().toJson(arrhs) + "}";
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.println(json);
            } else if (request.getParameter("huyhs") != null) {
                  int id = DATA.function.convertStringToint(request.getParameter("huyhs"));
                  ArrayList<objDoiTacHS> arrhs = daDoiTacHS.getAllHSsoboby_id(avl_login.getIddtnh(), id, avl_login.getDbname());
                  if(arrhs.size()>0){
                      if(arrhs.get(0).getTinhtrang()==0){
                          daDoiTacHS.update_tinhtrang(id, 3, avl_login.getDbname());
                      }
                  }
                  response.sendRedirect("./hosodt");
            } else {
                RequestDispatcher dispatcher = request.getServletContext()
                        .getRequestDispatcher("/index.jsp?hssobo=yes");
                dispatcher.forward(request, response);
            }

        } else {
            response.sendRedirect("./home");
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
