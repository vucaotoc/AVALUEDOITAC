package DoiTacHS;

import DoiTacNH.objDoiTacNH;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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

@WebServlet(name = "sl_themhskhaosat", urlPatterns = {"/themhsks"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 100, // 50MB
        maxRequestSize = 1024 * 1024 * 100) // 50MB
public class sl_themhskhaosat extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setAttribute("title_page", "Hồ Sơ Khảo Sát");
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        if (session.getAttribute("avl_dangnhap") != null) {
            objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
            String ghichu = request.getParameter("ghichu");
            String nguoilienhe = request.getParameter("nguoilienhe");
            String sodienthoai = request.getParameter("sodienthoai");
            String dsfile = "";
            objDoiTacHS obj = new objDoiTacHS();
            obj.setKieu(2);
            obj.setIddt(avl_login.getIddtnh());
            obj.setTendt(avl_login.getTencanbo());
            obj.setDsfile(dsfile);
            obj.setGhichu(ghichu.length() > 1000 ? ghichu.substring(0, 900) : ghichu);
            obj.setNguoilienhe(nguoilienhe);
            obj.setSodienthoai(sodienthoai);
            int iddths = daDoiTacHS.themmoi_HSDoitac(obj, avl_login.getDbname());
            if (iddths > 0) {

                int dem = 1;
                for (Part part : request.getParts()) {
                    String fileName = extractFileName(part);
                    String duoifile = FilenameUtils.getExtension(fileName).toLowerCase();
                    if (fileName.length() > 0) {
                        if (!Arrays.asList(DATA.function._fileBlock).contains(duoifile)) {
                            String path_root = DATA.function._data_filePath + "DATADT";
                            File directory2 = new File(path_root + File.separator + avl_login.getDbname());
                            if (!directory2.exists()) {
                                directory2.mkdir();

                            }
                            path_root = path_root + File.separator + avl_login.getDbname();
                            
                            File directory1 = new File(path_root + File.separator + iddths);
                            if (!directory1.exists()) {
                                directory1.mkdir();
                            }
                            path_root = path_root + File.separator + iddths;
                            Calendar calendar = Calendar.getInstance();
                            String tenfile = "DTHSKS_" + iddths + "_" + obj.getIddt() + "_" + calendar.getTimeInMillis() + "_" + dem + "." + duoifile;
                            dsfile += tenfile + ";";
                            //System.out.println("a " + FilenameUtils.getExtension(fileName));
                            part.write(path_root + File.separator + tenfile);
                        }
                    }
                    dem++;
                }
                daDoiTacHS.update_dsfile(iddths, dsfile, avl_login.getDbname());
                //System.out.println(dsfile + " " + ghichu);
            }
            response.sendRedirect("./hosoks");
        } else {
            response.sendRedirect("./home");
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
