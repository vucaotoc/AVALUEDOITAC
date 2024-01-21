package DoiTacNH;

import NhanVien.DANhanVien;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "sl_changePass", urlPatterns = {"/doimatkhau"})
public class sl_changePass extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("title_page", "Đổi mật khẩu");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        if (session.getAttribute("avl_dangnhap") != null) {
            objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
            String curpass = request.getParameter("current_pass").trim();
                String newpass = request.getParameter("new_pass").trim();
                String confirmpass = request.getParameter("confirm_pass").trim();
                if (newpass.equals(confirmpass)) {
                    if (DADoiTacNH.check_login(avl_login.getEmail(), curpass).getIddtnh()>0) {
                        if (DADoiTacNH.update_matkhau(confirmpass, avl_login.getIddtnh(),avl_login.getDbname()) > 0) {
                            session.invalidate();
                            response.getWriter().write("ok");
                        } else {
                            response.getWriter().write("LỖI KHÔNG THỂ CẬP NHẬT MẬT KHẨU.");
                        }
                    } else {
                        response.getWriter().write("SAI MẬT KHẨU HIỆN TẠI !");
                    }
                } else {
                    response.getWriter().write("MẬT KHẨU MỚI CHƯA ĐÚNG.");
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
