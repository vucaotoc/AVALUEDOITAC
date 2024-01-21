
import DoiTacNH.objDoiTacNH;
import HoSo.DAHAPhapLy;
import HoSo.DAHoSo;
import HoSo.objHAPhapLy;
import HoSo.objHoSo;
import KhaoSat.DAKhaoSat;
import KhaoSat.objKhaoSat;
import TaiSan.objTaiSan;
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

@WebServlet(urlPatterns = {"/maps"})
public class bando extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        //System.out.println("aa");
        request.setAttribute("title_page", "AVALUE Maps");
        if (session.getAttribute("avl_dangnhap") != null) {
            objDoiTacNH avl_dangnhap = (objDoiTacNH) session.getAttribute("avl_dangnhap");
            if (avl_dangnhap.getCumchucnang().contains("avaluemaps")) {

                String toado = "";
                String zoom = "15";
                String lng = "";
                String lon = "";

                lng = "10.816546500285776";
                lon = "106.65932479428888";
               
                 if (request.getParameter("zoom") != null) {
                     zoom=request.getParameter("zoom");
                 }
                
                
                if (request.getParameter("toado") != null) {
                    toado = request.getParameter("toado");
                    String[] td = toado.split(",");
                    if (td.length == 2) {
                        lng = td[0];
                        lon = td[1];
                        //zoom = "17";
                    }
                }
                

                request.setAttribute("toadolng", lng);
                request.setAttribute("toadolon", lon);
                request.setAttribute("zoom", zoom);

                RequestDispatcher dispatcher = request.getServletContext()
                        .getRequestDispatcher("/maps.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getServletContext()
                        .getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            response.sendRedirect("./login");
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
