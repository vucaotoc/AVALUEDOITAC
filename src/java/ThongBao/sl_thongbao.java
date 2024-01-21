package ThongBao;

import DoiTacNH.objDoiTacNH;
import NhanVien.objNhanVien;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "sl_thongbao", urlPatterns = {"/showtb"})
public class sl_thongbao extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("title_page", "Tạo Phiếu Khảo Sát");
        if (session.getAttribute("avl_dangnhap") != null) {
             objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
            if (request.getParameter("getlisttn") != null) {
                ArrayList<objThongBao> arr = DALThongBao.getlistTinNhanby_tencb(avl_login.getTencanbo(), avl_login.getDbname());
                session.setAttribute("alltb", arr);
                String json = "{\"thongbao\":" + new Gson().toJson(arr) + "}";
                PrintWriter out = response.getWriter();
                //System.out.println(json);              
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.print(json);
            } else if (request.getParameter("getcount") != null) {
                objShowTB kq = DALThongBao.count_new_tn(avl_login.getTencanbo(),avl_login.getDbname());                

                String json = "{\"thongbao\":" + new Gson().toJson(kq) + "}";
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                //System.out.println(json);  
                out.print(json);

            } else if (request.getParameter("daxem") != null) {
                int idtb = DATA.function.convertStringToint(request.getParameter("daxem"));
                DALThongBao.update_daxem(idtb, avl_login.getDbname());
                //response.getWriter().write("ok");
                response.sendRedirect("./getalltb");
            } else if (request.getParameter("daxemall") != null) {

                response.getWriter().write("ok");
            } else {
                response.getWriter().write("none");
            }
        } else {
            response.sendRedirect("./avl");
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
