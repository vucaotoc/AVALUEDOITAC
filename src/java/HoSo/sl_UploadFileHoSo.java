package HoSo;

import DoiTacNH.objDoiTacNH;
import LogSystem.objLogSytem;
import NhanVien.objNhanVien;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
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
import org.omg.CORBA.DATA_CONVERSION;

@WebServlet(name = "sl_UploadFileHoSo", urlPatterns = {"/upfhoso"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class sl_UploadFileHoSo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("title_page", "Upload file Hồ Sơ ");
       if (session.getAttribute("avl_dangnhap") != null) {
            objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
            if (request.getParameter("down") != null) {
                int idha = DATA.function.convertStringToint(request.getParameter("down"));
                objHAPhapLy objha = DAHAPhapLy.getFiles_HS(idha, avl_login.getDbname());
                //System.out.println(DATA.function._data_filePath + objha.getPath() + objha.getTenha());
                File file = new File(DATA.function._data_filePath + objha.getPath() + objha.getTenha());

                response.setContentType(getServletContext().getMimeType(file.getName()));
                response.setContentLength((int) file.length());
                response.setHeader("Content-Disposition", "attachment;filename=\"AVALUE_" + objha.getTenha()+"\"");

                BufferedInputStream inputStream = null;
                BufferedOutputStream outputStream = null;

                try {
                    inputStream = new BufferedInputStream(new FileInputStream(file));
                    outputStream = new BufferedOutputStream(response.getOutputStream());

                    byte[] buf = new byte[2048];
                    int len;
                    while ((len = inputStream.read(buf)) > 0) {
                        outputStream.write(buf, 0, len);
                    }
                } finally {
                    if (outputStream != null) {
                        try {
                            outputStream.close();
                        } catch (IOException e) {
                            DATA.function.Print_log("taifilect " + e.getMessage());
                        }
                    }
                    // do the same for input stream also
                }

            } else {
                response.sendRedirect("./hoso");

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
