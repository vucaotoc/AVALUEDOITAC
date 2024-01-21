package ThuMucRieng;

import HoSo.DAHAPhapLy;
import HoSo.objHAPhapLy;
import HoSo.objHoSo;
import LogSystem.objLogSytem;
import NhanVien.objNhanVien;
import TaiSan.objTaiSan;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.FilenameUtils;

@WebServlet(name = "sl_thumucrieng", urlPatterns = {"/thumucrieng"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class sl_thumucrieng extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("title_page", "Danh Sách Hồ Sơ");
        if (session.getAttribute("avl_login") != null) {
            objNhanVien avl_login = (objNhanVien) session.getAttribute("avl_login");
            if (request.getParameter("themmoi") != null) {
                if (session.getAttribute("hsedit_hs") != null) {
                    
                    objHoSo objhs = (objHoSo) session.getAttribute("hsedit_hs");

                    File directory1 = new File(DATA.function._data_filePath + objhs.getMahs());
                    if (!directory1.exists()) {
                        directory1.mkdir();
                    }
                    File directory = new File(DATA.function._data_filePath + objhs.getMahs() + File.separator + "ThuMucRieng");
                    if (!directory.exists()) {
                        directory.mkdir();
                    }
                    ArrayList<objHAPhapLy> arrHA = new ArrayList<objHAPhapLy>();

                    for (Part part : request.getParts()) {
                        String fileName = extractFileName(part);
                        //System.out.println("a " + fileName);
                        if (fileName.length() > 0) {
                            fileName = new File(fileName).getName();
                            objHAPhapLy obj = new objHAPhapLy();
                            obj.setIdhs(objhs.getIdhs());
                            obj.setTenha(objhs.getMahs() + "_" + fileName);
                            obj.setTennvup(avl_login.getTennv());
                            obj.setMota("");
                            obj.setNhom("TMR");
                            obj.setLoaifile(FilenameUtils.getExtension(fileName));
                            obj.setPath(objhs.getMahs() + File.separator + "ThuMucRieng" + File.separator);
                            //System.out.println(obj.getPath());
                            part.write(DATA.function._data_filePath + obj.getPath() + obj.getTenha());
                            arrHA.add(obj);
                        }
                    }
                    response.sendRedirect("./thumucrieng");
                    if (arrHA.size() > 0) {
                        for (objHAPhapLy obj : arrHA) {
                            DAHAPhapLy.themmoiHAPhaply(obj, avl_login.getDbname());
                        }
                    }
                } else {
                    response.sendRedirect("./avl");
                }

            } else if (request.getParameter("del") != null) {
                if (session.getAttribute("hsedit_hs") != null) {
                    objHoSo objhs = (objHoSo) session.getAttribute("hsedit_hs");
                    int idha = DATA.function.convertStringToint(request.getParameter("del"));
                    objHAPhapLy objha = DAHAPhapLy.getFiles_HS(idha, avl_login.getDbname());
                    if (objhs.getIdnvks() == avl_login.getIdnv()
                            || objhs.getIdnvgia() == avl_login.getIdnv()
                            || avl_login.getQuyen() == DATA.phanquyen._nhom_per_admin
                            || avl_login.getQuyen() == DATA.phanquyen._nhom_per_manager) {
//                File f = new File(DATA.function._data_filePath + objha.getPath() + File.separator + objha.getTenha());
//                if (f.exists() && !f.isDirectory()) {
//                    f.delete();
//                }
                        DAHAPhapLy.delete_file(objha, avl_login.getDbname());
                        LogSystem.objLogSytem objlog = new objLogSytem(avl_login.getIdnv(), avl_login.getTendn(), "DEL TMR [" + objha.getTenha() + "]");
                        LogSystem.DALLogsystem.themmoi_logsystem(objlog, avl_login.getDbname());
                    }
                }
                response.sendRedirect("./thumucrieng");
            } else {
                if (session.getAttribute("hsedit_hs") != null) {
                    //System.out.println("aaa");
                    HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
                    ArrayList<objHAPhapLy> arrHA = DAHAPhapLy.getAllThuMuc_in_HS(objhs.getIdhs(), avl_login.getDbname());
                    session.setAttribute("thumuc_rieng", arrHA);
                    request.setAttribute("title_page", "Thư mục riêng hồ sơ " + objhs.getMahs());
                    RequestDispatcher dispatcher = request.getServletContext()
                            .getRequestDispatcher("/index.jsp?thumucrieng=yes");
                    dispatcher.forward(request, response);

                } else {
                    response.sendRedirect("./avl");
                }
            }

        } else {
            response.sendRedirect("./avl");
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload() {
        File folderUpload = new File(System.getProperty("user.home") + "/Uploads");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
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
