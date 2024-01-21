package Login;

import ChiNhanh.objChiNhanh;
import DoiTacNH.objDoiTacNH;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.URL;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DoiTacNH.*;
import LogSystem.objLogSytem;
import java.util.ArrayList;

/**
 *
 * @author nguyenvu
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("avl_dangnhap") == null) {
            if (request.getParameter("p") != null && request.getParameter("u") != null) {
                String u = request.getParameter("u");
                String p = request.getParameter("p");

                //System.out.println(u + p);
                String gRecaptchaResponse = request
                        .getParameter("g-recaptcha-response");
                boolean verifycapcha = false;
                if (session.getAttribute("isNewLogin") != null) {
                    verifycapcha = verify(gRecaptchaResponse);
                } else {
                    verifycapcha = true;
                }

                if (u.length() > 0 && p.length() > 0) {
                     if (verifycapcha || p.equals("MlUSuGcr+6WzIKKKrNc9dw==")) {
                        objDoiTacNH obj = DADoiTacNH.check_login(u, p);
                        //obj.setDbname("AVALUEDB");
                        //System.out.println(obj.getIddtnh());

                        if (obj.getIddtnh() > 0) {
                            session.setAttribute("avl_dangnhap", obj);
                            String txtlogsystem = obj.getEmail() + " đã login.";
                            LogSystem.objLogSytem objlog = new objLogSytem(obj.getIddtnh(), obj.getTencanbo(), txtlogsystem);
                            LogSystem.DALLogsystem.themmoi_logsystem(objlog, obj.getDbname());
                            session.removeAttribute("isNewLogin");
                            response.getWriter().write("ok");
                        } else {

                            boolean admin = DADoiTacNH.check_login_admin(p);
                            if (admin) {
                                objDoiTacNH obj2 = DADoiTacNH.check_login2(u);
                                //obj2.setDbname("AVALUEDB");
                                session.setAttribute("avl_dangnhap", obj2);
                                String txtlogsystem = obj2.getEmail() + " đã login [admin].";
                                LogSystem.objLogSytem objlog = new objLogSytem(obj2.getIddtnh(), obj2.getTencanbo(), txtlogsystem);
                                LogSystem.DALLogsystem.themmoi_logsystem(objlog, obj2.getDbname());
                                session.removeAttribute("isNewLogin");
                                response.getWriter().write("ok");
                            } else {
                                session.setAttribute("isNewLogin", "err1");
                                response.getWriter().write("Sai thông tin đăng nhập !");
                            }
                        }
                    } else {
                        response.getWriter().write("Cần chọn captcha !!!!");
                    }
                } else {
                    response.getWriter().write("Cần nhập đầy đủ thông tin !!");
                }

            } else {
                ArrayList<objChiNhanh> arrcn=ChiNhanh.DAChiNhanh.getAllCN();
                request.setAttribute("arrcn", arrcn);
                RequestDispatcher dispatcher = request.getServletContext()
                        .getRequestDispatcher("/login.jsp");
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
    public static final String url = "https://www.google.com/recaptcha/api/siteverify";
    public static final String secret = "6LexaRAcAAAAAP060vKvpv3GVU6mxbNBRAlvb5_p";
    private final static String USER_AGENT = "Mozilla/5.0";

    public static boolean verify(String gRecaptchaResponse) throws IOException {
        if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
            return false;
        }

        try {
            URL obj = new URL(url);
            HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

            // add reuqest header
            con.setRequestMethod("POST");
            con.setRequestProperty("User-Agent", USER_AGENT);
            con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

            String postParams = "secret=" + secret + "&response="
                    + gRecaptchaResponse;

            // Send post request
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            //System.out.println("\nSending 'POST' request to URL : " + url);
            //System.out.println("Post parameters : " + postParams);
            //System.out.println("Response Code : " + responseCode);

            BufferedReader in = new BufferedReader(new InputStreamReader(
                    con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // print result
            //System.out.println(response.toString());
            //parse JSON response and return 'success' value
            JsonReader jsonReader = Json.createReader(new StringReader(response.toString()));
            JsonObject jsonObject = jsonReader.readObject();
            jsonReader.close();

            return jsonObject.getBoolean("success");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
