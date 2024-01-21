
import DoiTacNH.objDoiTacNH;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "sl_tracuuRemap", urlPatterns = {"/tracuuRemap"})
public class sl_tracuuRemap extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("title_page", "Maps");
        if (session.getAttribute("avl_dangnhap") != null) {
            objDoiTacNH avl_dangnhap = (objDoiTacNH) session.getAttribute("avl_dangnhap");
            //String apikey = "PRF7pz2wj8i3rltJSqaSmz2qrvDMcpcc1gECtCvJZvRJ8HG8glzIrJv1KpN4I0ou";
            String latlng = request.getParameter("lat");
            latlng = latlng.replace("LatLng(", "");
            latlng = latlng.replace(")", "");
            String[] la = latlng.split(",");
            String lat = la[0].trim();
            String lng = la[1].trim();
            System.out.println(lat);
            System.out.println(lng);
//            OkHttpClient client = new OkHttpClient().newBuilder().build();
//            Request rq = new Request.Builder()
//                    .url("https://remaps.vn/api/clients/search?apiKey=PRF7pz2wj8i3rltJSqaSmz2qrvDMcpcc1gECtCvJZvRJ8HG8glzIrJv1KpN4I0ou&lat=" + lat + "&lng=" + lng)
//                    .method("GET", null)
//                    .build();
//            Response rp = client.newCall(rq).execute();
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.println(DATA.function.getRemapAPI(lat, lng));
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
