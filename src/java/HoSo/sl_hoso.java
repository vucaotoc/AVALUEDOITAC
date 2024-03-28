package HoSo;

import DoiTacNH.*;
import KhaoSat.DAKhaoSat;
import KhaoSat.objKhaoSat;
import NhanVien.*;
import TaiSan.*;
import TinNhan.*;
import TraCuuHS.*;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "sl_hoso", urlPatterns = {"/hoso"})
public class sl_hoso extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("title_page", "Danh Sách Hồ Sơ");
        SimpleDateFormat dtf = new SimpleDateFormat("dd/MM/yyyy");
        if (session.getAttribute("avl_dangnhap") != null) {
            objDoiTacNH avl_login = (objDoiTacNH) session.getAttribute("avl_dangnhap");
            if (request.getParameter("getlist") != null) {
                //System.out.println("a");                
                ArrayList<objHoSo> arrhs = new ArrayList<>();
                //System.out.println("1");
                if (avl_login.getQuanly() == 1) {
                       //System.out.println("2");
                    arrhs = DAHoSo.getAllListHSby_DoitacCanBo_qly(avl_login.getTendoitac(), avl_login.getTencanbo(), avl_login.getDbname());
                } else {
                       //System.out.println("3");
                    objDoiTacNH objcb=DADoiTacNH.geDoiTacNH_truongNhom(avl_login.getIddtnh(),avl_login.getDbname());
                    if(objcb.getQuanly()==1){
                         //System.out.println("4");
                         arrhs = DAHoSo.getAllListHSby_DoitacCanBo_qly(objcb.getTendoitac(), objcb.getTencanbo(), avl_login.getDbname());
                    }else{
                           //System.out.println("5");
                        arrhs = DAHoSo.getAllListHSby_DoitacCanBo(avl_login.getTendoitac(), avl_login.getTencanbo(), avl_login.getDbname());
                    }
                    
                }
                String json = "{\"hoso\":" + new Gson().toJson(arrhs) + "}";

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.println(json);
            } else if (request.getParameter("id") != null) {

                session.removeAttribute("hsedit_hs");
                session.removeAttribute("hsedit_ts");
                session.removeAttribute("hsedit_ks");
                session.removeAttribute("hsedit_HATS");
                session.removeAttribute("hsedit_arrNV");
                session.removeAttribute("hsedit_arrTN");
                session.removeAttribute("hoso_scan");

                int idhs = DATA.function.convertStringToint(request.getParameter("id"));
                // hồ sơ
                objHoSo objhs = DAHoSo.getHSBy_id(idhs, avl_login.getDbname());
                session.setAttribute("hsedit_hs", objhs);
                //tình trạng tài sản               
                if (objhs.getIdhs() > 0) {
                    ArrayList<objTaiSan> objts = TaiSan.DATaiSan.getListTS_by_idhs(objhs.getIdhs(), avl_login.getDbname());
                    if (objts.size() > 0) {
                        objTraCuuHS objtc = new objTraCuuHS();
                        objtc.setMahs(objhs.getMahs());
                        objtc.setTaisan(objts.get(0).getFullDiaChi());

                        switch (objhs.getTinhtrang()) {
                            case DATA.danhsachBIEN._hs_khoiTao:
                            case DATA.danhsachBIEN._hs_dangKhaoSat:
                                objtc.setKs_tt("Đang thực hiện");
                                objtc.setKs_tg("");
                                objtc.setTd_tt("Chưa thực hiện");
                                objtc.setTd_tg("");
                                objtc.setCt_tt("Chưa thực hiện");
                                objtc.setCt_tg("");
                                objtc.setGiaoct_tt("Chưa thực hiện");
                                objtc.setGiaoct_tg("");
                                objtc.setSoct("");
                                break;
                            case DATA.danhsachBIEN._hs_daKhaoSat:
                            case DATA.danhsachBIEN._hs_dangBaoGia:
                                objtc.setKs_tt("Đã xong");
                                objtc.setKs_tg(dtf.format(objhs.getNgaykhaosat()));
                                objtc.setTd_tt("Đang thực hiện");
                                objtc.setTd_tg("");
                                objtc.setCt_tt("Chưa thực hiện");
                                objtc.setCt_tg("");
                                objtc.setGiaoct_tt("Chưa thực hiện");
                                objtc.setGiaoct_tg("");
                                objtc.setSoct("");
                                break;
                            case DATA.danhsachBIEN._hs_daBaoGia:
                                objtc.setKs_tt("Đã xong");
                                objtc.setKs_tg(dtf.format(objhs.getNgaykhaosat()));
                                objtc.setTd_tt("Đã xong");
                                objtc.setTd_tg(dtf.format(objhs.getNgaybaogia()));
                                objtc.setCt_tt("Đang thực hiện");
                                objtc.setCt_tg("");
                                objtc.setGiaoct_tt("Chưa thực hiện");
                                objtc.setGiaoct_tg("");
                                objtc.setSoct("");
                                break;
                            case DATA.danhsachBIEN._hs_raChungThu:
                                objtc.setKs_tt("Đã xong");
                                objtc.setKs_tg(dtf.format(objhs.getNgaykhaosat()));
                                objtc.setTd_tt("Đã xong");
                                objtc.setTd_tg(dtf.format(objhs.getNgaybaogia()));
                                ChungThu.objChungThu objct = ChungThu.DAChungThu.getCTby_mahs(objhs.getMahs(), avl_login.getDbname());
                                objtc.setCt_tt("Đã xong");
                                objtc.setCt_tg(dtf.format(objct.getNgayphathanh()));
                                objtc.setGiaoct_tt("Đang thực hiện");
                                objtc.setGiaoct_tg("");
                                objtc.setSoct(objct.getSoct());
                            case DATA.danhsachBIEN._hs_hoanThanhHS:
                                objtc.setKs_tt("Đã xong");
                                objtc.setKs_tg(dtf.format(objhs.getNgaykhaosat()));
                                objtc.setTd_tt("Đã xong");
                                objtc.setTd_tg(dtf.format(objhs.getNgaybaogia()));
                                ChungThu.objChungThu objct1 = ChungThu.DAChungThu.getCTby_mahs(objhs.getMahs(), avl_login.getDbname());
                                objtc.setSoct(objct1.getSoct());
                                objtc.setCt_tt("Đã xong");
                                objtc.setCt_tg(dtf.format(objct1.getNgayphathanh()));
                                objtc.setGiaoct_tt("Chưa thực hiện");
                                objtc.setGiaoct_tg("");
                                if (objhs.getGiao_dagiao() == 0) {
                                    objtc.setGiaoct_tt("Đã giao");
                                    objtc.setGiaoct_tg(dtf.format(objhs.getGiao_thoigiannh()));
                                }
                                break;
                            default:
                                break;
                        }
                        //request.setAttribute("title_page", "Hồ Sơ [" + objhs.getMahs() + "]");
                        session.setAttribute("objtc", objtc);
                        //response.getWriter().write("ok");
                    } else {
                        //response.getWriter().write("Không tìm thấy hồ sơ " + objhs.getMahs());
                    }

                    // tài sản
                    ArrayList<objTaiSan> arrTS = TaiSan.DATaiSan.getListTS_by_idhs(objhs.getIdhs(), avl_login.getDbname());
                    session.setAttribute("hsedit_ts", arrTS);

                    objKhaoSat objks = DAKhaoSat.getPhieuKSby_idks(arrTS.get(0).getDakhaosat(), avl_login.getDbname());
                    if (objks.getIdks() > 0) {
                        session.setAttribute("hsedit_ks", objks);
                    }
                    //lay hình ảnh                
                    ArrayList<objHAPhapLy> arrHA = DAHAPhapLy.getAllHA_TS(objhs.getIdhs(), avl_login.getDbname());
                    if (arrHA.size() > 0) {
                        session.setAttribute("hsedit_HATS", arrHA);
                    }
                    //lay danh sach nv tham gia
                    ArrayList<objNhanVien> arrNV = DANhanVien.getNhanVienby_idhs(objhs.getIdhs(), avl_login.getDbname());
                    session.setAttribute("hsedit_arrNV", arrNV);

                    //lay tin nhan
                    ArrayList<objTinNhan> arrTN = DALTinNhan.getAllTinNhanby_idhs(objhs.getIdhs(), avl_login.getDbname());
                    for (int i = 0; i < arrTN.size(); i++) {
                        arrTN.get(i).setMess(DATA.function.tinnhan_formatText_imgpdf(arrTN.get(i).getMess(), objhs.getMahs().trim()));
                    }
                    session.setAttribute("hsedit_arrTN", arrTN);

                    //thong tin ho so scan
                    ArrayList<objHAPhapLy> arrHSSC = DAHAPhapLy.getAllHSSC_in_HS(objhs.getIdhs(), avl_login.getDbname());
                    session.setAttribute("hoso_scan", arrHSSC);

                }
                request.setAttribute("title_page", "Thông Tin Hồ  [" + objhs.getMahs() + "] ");
                RequestDispatcher dispatcher = request.getServletContext()
                        .getRequestDispatcher("/index.jsp?hsct=yes");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getServletContext()
                        .getRequestDispatcher("/index.jsp?hoso=yes");
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

}
