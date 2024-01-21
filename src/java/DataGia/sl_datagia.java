package DataGia;

import DoiTacNH.objDoiTacNH;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "sl_datagia", urlPatterns = {"/datagiabds"})
public class sl_datagia extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("title_page", "Hồ Sơ Khảo Sát");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        if (session.getAttribute("avl_dangnhap") != null) {
            objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");

            if (request.getParameter("dataduan") != null && avl_login.getCumchucnang().contains("dataduan")) {
                RequestDispatcher dispatcher = request.getServletContext()
                        .getRequestDispatcher("/index.jsp?data=duan");
                dispatcher.forward(request, response);
            } else if (request.getParameter("datatuyenduong") != null && avl_login.getCumchucnang().contains("datatuyenduong")) {
                RequestDispatcher dispatcher = request.getServletContext()
                        .getRequestDispatcher("/index.jsp?data=tuyenduong");
                dispatcher.forward(request, response);
            } else if (request.getParameter("datacanho") != null && avl_login.getCumchucnang().contains("datacanho")) {
                RequestDispatcher dispatcher = request.getServletContext()
                        .getRequestDispatcher("/index.jsp?data=canho");
                dispatcher.forward(request, response);
            }else{
                RequestDispatcher dispatcher = request.getServletContext()
                        .getRequestDispatcher("/index.jsp");
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
