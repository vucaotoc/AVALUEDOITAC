package dubaogia;

import NhanVien.objNhanVien;
import TaiSan.DATaiSan;
import TraCuuHS.objTraCuuHS;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "sl_dubaogia", urlPatterns = {"/dubaogia"})
public class sl_dubaogia extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("title_page", "Tra Cứu Giá BĐS");
        if (session.getAttribute("avl_dangnhap") != null) {

            if (request.getParameter("getdubao") != null) {
                String str = request.getParameter("getdubao");
                if (str.length() > 0) {
                    ArrayList<objDubaogia> arr = DADubaogia.getgia_diachi(str);
                    String json = "{\"dubao\":" + new Gson().toJson(arr) + "}";
                    PrintWriter out = response.getWriter();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    if (arr.size() == 0) {
                        json = "";
                    }
                    //System.out.println("json: "+json);
                    out.println(json);
                }
            } else if (request.getParameter("getdiachi") != null) {
                String str = request.getParameter("getdiachi");
                List<objDubaogia> arr = DADubaogia.getDiachi_ajax(str);
                String json = "{\"diachi\":" + new Gson().toJson(arr) + "}";
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");               
                //System.out.println("json: "+json);
                out.println(json);
            } else {               
                RequestDispatcher dispatcher = request.getServletContext()
                        .getRequestDispatcher("/index.jsp?dubaogia=yes");
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
