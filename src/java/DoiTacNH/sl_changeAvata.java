package DoiTacNH;

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

@WebServlet(name = "sl_changeAvata", urlPatterns = {"/changeavata"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 100, // 50MB
        maxRequestSize = 1024 * 1024 * 100) // 50MB
public class sl_changeAvata extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("title_page", "Đổi mật khẩu");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        if (session.getAttribute("avl_dangnhap") != null) {
            objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
            
            for (Part part : request.getParts()) {
                String fileName = extractFileName(part);
                String duoifile = FilenameUtils.getExtension(fileName).toLowerCase();
                if (fileName.length() > 0) {
                    if (!Arrays.asList(DATA.function._fileBlock).contains(duoifile)) {
                        File directory1 = new File(DATA.function._data_filePath + "DATADT" + File.separator + "avata");
                        if (!directory1.exists()) {
                            directory1.mkdir();
                        }
                        Calendar calendar = Calendar.getInstance();
                        String tenfile = "ava_" + avl_login.getIddtnh()  + "_" + calendar.getTimeInMillis() + "." + duoifile;   
                        part.write(DATA.function._data_filePath + "DATADT" + File.separator + "avata" + File.separator + tenfile);
                        DADoiTacNH.update_avatar(tenfile, avl_login.getIddtnh(), avl_login.getDbname());
                        avl_login.setAvatar(tenfile);
                        session.setAttribute("avl_dangnhap",avl_login);
                    }
                }
            }
            response.sendRedirect("./home");
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
