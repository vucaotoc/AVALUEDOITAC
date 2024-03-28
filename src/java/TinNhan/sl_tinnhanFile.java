package TinNhan;

import DoiTacNH.objDoiTacNH;
import HoSo.DAHAPhapLy;
import HoSo.objHAPhapLy;
import NhanVien.objNhanVien;
import Telegram.AVLBot;
import ThongBao.objThongBao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.FilenameUtils;

@WebServlet(name = "sl_tinnhanFile", urlPatterns = {"/tinnhanfile"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 5, // 2MB
        maxFileSize = 1024 * 1024 * 100, // 50MB
        maxRequestSize = 1024 * 1024 * 100) // 50MB
public class sl_tinnhanFile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        if (session.getAttribute("avl_dangnhap") != null) {
            objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
            int idhs = DATA.function.convertStringToint(request.getParameter("hosoid"));
            HoSo.objHoSo objhs = HoSo.DAHoSo.getHSBy_id(idhs, avl_login.getDbname());
            if (objhs.getIdhs() > 0) {
                System.out.println("buoc 1: " + objhs.getMahs());
                File directory1 = new File(DATA.function._data_filePath + objhs.getMahs());
                if (!directory1.exists()) {
                    directory1.mkdir();
                }
                File directory = new File(DATA.function._data_filePath + objhs.getMahs() + File.separator + "tinnhan");
                if (!directory.exists()) {
                    directory.mkdir();
                }
                String text_mess = "";

                for (Part part : request.getParts()) {
                    String fileName = DATA.function.extractFileName(part);
                    fileName = new File(fileName).getName();

                    if (fileName.length() > 0) {
                        String duoifile = FilenameUtils.getExtension(fileName).toLowerCase();
                        System.out.println("buoc 2: " + fileName + " " + duoifile);
                        if (!Arrays.asList(DATA.function._fileBlock).contains(duoifile)) {
                            if (duoifile.equals("jpg") || duoifile.equals("png")) {
                                text_mess += "<img>" + fileName + "</img>";
                            } else {
                                text_mess += "<file>" + fileName + "</file>";
                            }
                            part.write(DATA.function._data_filePath + objhs.getMahs() + File.separator + "tinnhan" + File.separator + fileName);
                        }
                    }

                }
                if (text_mess.length() > 0) {
                    objTinNhan obj = new objTinNhan();
                    obj.setIdnvsend(0);
                    obj.setIdcbsend(avl_login.getIddtnh());
                    obj.setIdhs(objhs.getIdhs());
                    obj.setMess(text_mess);
                    if (DALTinNhan.themmoi_mess(obj, avl_login.getDbname()) > 0) {
                        System.out.println("buoc 3: " + text_mess);
                        Telegram.AVLBot avlbot = new AVLBot();
                        avlbot.Telegram_Tinnhan_doitac(objhs, "đã gửi file, hình ảnh", "5799700530"); // 5799700530 vu 1978358030 duy
                        int idnv = HoSo.objHoSo.laynv_telegram(objhs);
                        String teleid = NhanVien.DANhanVien.getNhanVienby_id(idnv, avl_login.getDbname()).getTelegramid();
                        //System.out.println(idnv+"    "+teleid);
                        avlbot.Telegram_Tinnhan_doitac(objhs, obj.getMess(), teleid);

                        ArrayList<objNhanVien> arrNV = (ArrayList<objNhanVien>) session.getAttribute("hsedit_arrNV");
                        for (objNhanVien objnv : arrNV) {
                            ThongBao.objThongBao objtb = new objThongBao();
                            objtb.setNhomnv(DATA.phanquyen._nhom_per_user);
                            objtb.setIdnvnhan(objnv.getIdnv());
                            objtb.setTennvnhan(objnv.getTennv());
                            objtb.setDaxem(0);
                            objtb.setThongbao("có tin nhắn từ " + objhs.getMahs());
                            objtb.setLoai("hoso?id=" + objhs.getIdhs());
                            objtb.setIdloai(objhs.getIdhs());
                            objtb.setNhomtb(6);
                            ThongBao.DALThongBao.themmoiTB(objtb, avl_login.getDbname());
                        }
                       response.sendRedirect(request.getHeader("Referer"));
                    } else {
                        response.sendRedirect(request.getHeader("Referer"));
                        //response.getWriter().write("[ERROR] lỗi hệ thống. vui lòng thử lại.");
                    }
                } else {
                    response.sendRedirect(request.getHeader("Referer"));
                    //response.getWriter().write("[ERROR] lỗi hệ thống.không có file.");
                }
            } else {
                response.sendRedirect(request.getHeader("Referer"));
                //response.getWriter().write("[ERROR] lỗi hệ thống. Không tìm thấy hồ sơ.");
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
