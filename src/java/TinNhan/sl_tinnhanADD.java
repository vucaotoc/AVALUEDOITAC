package TinNhan;

import DoiTacNH.objDoiTacNH;
import NhanVien.objNhanVien;
import Telegram.AVLBot;
import ThongBao.objThongBao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
@WebServlet(name = "sl_tinnhanADD", urlPatterns = {"/sendMess"})
public class sl_tinnhanADD extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        if (session.getAttribute("avl_dangnhap") != null) {
            objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
            if (session.getAttribute("hsedit_hs") != null) {
                HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");

                objTinNhan obj = new objTinNhan();
                obj.setIdnvsend(0);
                obj.setIdcbsend(avl_login.getIddtnh());
                obj.setIdhs(objhs.getIdhs());
                obj.setMess(request.getParameter("message"));

                if (DALTinNhan.themmoi_mess(obj, avl_login.getDbname()) > 0) {
                    
                    Telegram.AVLBot avlbot=new AVLBot();
                    avlbot.Telegram_Tinnhan_doitac(objhs, obj.getMess(),"1978358030"); // 5799700530 vu 1978358030 duy
                    
                    ArrayList<objNhanVien> arrNV = (ArrayList<objNhanVien>) session.getAttribute("hsedit_arrNV");
                    for (objNhanVien objnv : arrNV) {
                        ThongBao.objThongBao objtb = new objThongBao();
                        objtb.setNhomnv(DATA.phanquyen._nhom_per_user);
                        objtb.setIdnvnhan(objnv.getIdnv());
                        objtb.setTennvnhan(objnv.getTennv());
                        objtb.setDaxem(0);
                        objtb.setThongbao("có tin nhắn từ "+objhs.getMahs());
                        objtb.setLoai("hoso?id=" + objhs.getIdhs());
                        objtb.setIdloai(objhs.getIdhs());
                        objtb.setNhomtb(6);
                        ThongBao.DALThongBao.themmoiTB(objtb, avl_login.getDbname());
                    }               
                    
                    response.getWriter().write("ok");
                } else {
                    response.getWriter().write("[ERROR] lỗi hệ thống. vui lòng thử lại.");
                }
            } else {
                response.getWriter().write("[ERROR] vui lòng chọn hồ sơ.");
            }

        } else {
            response.getWriter().write("[ERROR] vui lòng đăng nhập lại hệ thống.");
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
