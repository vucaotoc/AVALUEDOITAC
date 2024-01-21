package TaiSan;

import DoiTacNH.objDoiTacNH;
import HoSo.DAHAPhapLy;
import HoSo.objHAPhapLy;
import NhanVien.objNhanVien;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "sl_downloadAll", urlPatterns = {"/downall"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class sl_downloadAll extends HttpServlet {

    private static final int DEFAULT_BUFFER_SIZE = 1024 * 4; // 40KB.
    private static final long serialVersionUID = -7767828383799037391L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("title_page", "Hình Ảnh Khảo Sát Tài Sản");
        if (session.getAttribute("avl_dangnhap") != null) {
              objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
            //System.out.println("bat dau");
            if (session.getAttribute("hsedit_hs") != null) {
                HoSo.objHoSo objhs = (HoSo.objHoSo) session.getAttribute("hsedit_hs");
                 ArrayList<objHAPhapLy> arrHA = DAHAPhapLy.getAllHA_TS(objhs.getIdhs(), avl_login.getDbname());            
                if (arrHA.size()>0) {
                    ArrayList<File> lstFile = new ArrayList<>();
                    File file = null;
                    for (int i = 0; i < arrHA.size(); i++) {
                        if (arrHA.get(i).getIdha() > 0) {
                            HoSo.objHAPhapLy objha = DAHAPhapLy.getFiles_HS(arrHA.get(i).getIdha(), avl_login.getDbname());
                            file = new File(DATA.function._data_filePath + objha.getPath() + objha.getTenha());
                            if(file !=null)
                                lstFile.add(file);                            
                            //System.out.println(file.getPath());
                        }
                    }

                    String filename = "AVALUE_"+objhs.getMahs() + "_HA_TS.zip";
                    if (lstFile.size() > 0) {
                        //System.out.println(filename);
                        response.setContentType("application/zip");
                        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
                        ZipOutputStream output = null;
                        byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];

                        try {
                            output = new ZipOutputStream(new BufferedOutputStream(response.getOutputStream(), DEFAULT_BUFFER_SIZE));

                            for (File fi : lstFile) {

                                if (fi == null) {
                                    continue; // Handle yourself. The fileId may be wrong/spoofed.
                                }
                                InputStream input = null;

                                try {
                                    input = new BufferedInputStream(new FileInputStream(fi), DEFAULT_BUFFER_SIZE);
                                    output.putNextEntry(new ZipEntry(fi.getName()));
                                    for (int length = 0; (length = input.read(buffer)) > 0;) {
                                        output.write(buffer, 0, length);
                                    }
                                    output.closeEntry();
                                    //System.out.println(fi.getName());
                                } finally {
                                    if (input != null) {
                                        try {
                                            input.close();
                                        } catch (IOException logOrIgnore) {
                                            System.out.println("err 1: " + logOrIgnore.getMessage());
                                            /**/ }
                                    }
                                }
                            }
                        } catch (Exception ex) {
                            System.out.println("err 1: " + ex.getMessage());
                        } finally {
                            if (output != null) {
                                try {
                                    output.close();
                                } catch (IOException logOrIgnore) {
                                    System.out.println("err 2: " + logOrIgnore.getMessage());
                                    /**/ }
                            }
                        }
                    }
                    //System.out.println("xong rồi 1");
                } else {
                    response.sendRedirect("./hoso?id=" + objhs.getIdhs());
                }
                //System.out.println("xong rồi 2");
            } else {
                //System.out.println("xong rồi 3");
                response.sendRedirect("./home");
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
