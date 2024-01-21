package KhaoSat;

import DATA.DBConnection;
import DATA.DBSYScon;
import DATA.function;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DAKhaoSat {

   

    private static objKhaoSat getObject_KS(ResultSet rs) {
        objKhaoSat obj = new objKhaoSat();
        try {
            while (rs.next()) {

                obj.setIdks(rs.getInt("idks"));
                obj.setMahs(rs.getString("mahs"));
                obj.setIdts(rs.getInt("idts"));
                obj.setDiachits(rs.getNString("diachits"));
                obj.setNgayks(rs.getTimestamp("thoigianks"));
                obj.setToadomaps(rs.getString("toadomaps"));
                obj.setManvks(rs.getString("manvks"));
                obj.setTennvks(rs.getNString("tennvks"));
                obj.setChiphiks(rs.getDouble("chiphiks"));
                obj.setPhitamung(rs.getDouble("phitamung"));
                obj.setLoaits(rs.getNString("loaitsks"));
                obj.setChukynguoihd(rs.getString("chukynguoihd"));
                obj.setChukynvks(rs.getString("chukynvks"));
                obj.setChukytdv(rs.getString("chukytdv"));
                obj.setTentdv(rs.getNString("tentdv"));
                obj.setSothetdv(rs.getNString("sothetdv"));

                if (obj.getLoaits().startsWith("Phương Tiện Vận Tải")) {
                    obj.setPt_loaixe(rs.getNString("pt_loaixe"));//              + "           ,[pt_loaixe]     "
                    obj.setPt_namsanxuat(rs.getString("pt_namsanxuat"));//                    + "           ,[pt_namsanxuat]     "
                    obj.setPt_noisanxuat(rs.getNString("pt_noisanxuat"));//                    + "           ,[pt_noisanxuat]     "
                    obj.setPt_bienso(rs.getString("pt_bienso"));//                    + "           ,[pt_bienso]     "
                    obj.setPt_mausac(rs.getNString("pt_mausac"));//                    + "           ,[pt_mausac]     "
                    obj.setPt_sokmdachay(rs.getString("pt_sokmdachay"));//                    + "           ,[pt_sokmdachay]     "
                    obj.setPt_thanxe(rs.getNString("pt_thanxe"));//                    + "           ,[pt_thanxe]     "
                    obj.setPt_dentruoc(rs.getNString("pt_dentruoc"));//                    + "           ,[pt_dentruoc]   "
                    obj.setPt_densau(rs.getNString("pt_densau"));//                    + "           ,[pt_densau]     "
                    obj.setPt_denphanh(rs.getNString("pt_denphanh"));//                    + "           ,[pt_denphanh]   "
                    obj.setPt_dentinhieu(rs.getNString("pt_dentinhieu"));//                    + "           ,[pt_dentinhieu]     "
                    obj.setPt_loainhieulieu(rs.getNString("pt_loainhienlieu"));//                    + "           ,[pt_loainhienlieu]  "
                    obj.setPt_taitrong(rs.getNString("pt_taitrong"));//                    + "           ,[pt_taitrong]   "
                    obj.setPt_socho(rs.getString("pt_socho"));//                    + "           ,[pt_socho]  "
                    obj.setPt_thungxe(rs.getNString("pt_thungxe"));//                    + "           ,[pt_thungxe]    "
                    obj.setPt_khac(rs.getNString("pt_khac"));//                    + "           ,[

                } else if (obj.getLoaits().startsWith("Chung Cư")) {
                    obj.setCc_dtthongthuy(rs.getNString("cc_dtthongthuy"));//                        "            ,[cc_dtthongthuy]     " +
                    obj.setCc_dttimtuong(rs.getNString("cc_dttimtuong"));//                        "           ,[cc_dttimtuong]     " +
                    obj.setCc_loai(DATA.function.xuly_hienthi_truongKS(rs.getNString("cc_loai")));//                        "           ,[cc_loai]   " +
                    obj.setCc_vitritang(rs.getNString("cc_vitritang"));//                        "           ,[cc_vitritang]  " +
                    obj.setCc_sophongngu(DATA.function.xuly_hienthi_truongKS(rs.getNString("cc_sophongngu")));//                        "           ,[cc_sophongngu]     " +
                    obj.setCc_matsan(DATA.function.xuly_hienthi_truongKS(rs.getNString("cc_matsan")));//                        "           ,[cc_matsan]     " +
                    obj.setCc_cuachinh(DATA.function.xuly_hienthi_truongKS(rs.getNString("cc_cuachinh")));//                        "           ,[cc_cuachinh]   " +
                    obj.setCc_cuaphong(DATA.function.xuly_hienthi_truongKS(rs.getNString("cc_cuaphong")));//                        "           ,[cc_cuaphong]   " +
                    obj.setCc_cuaso(DATA.function.xuly_hienthi_truongKS(rs.getNString("cc_cuaso")));//                        "           ,[cc_cuaso]  " +
                    obj.setCc_cokhuphoido(DATA.function.xuly_hienthi_truongKS(rs.getNString("cc_cokhuphoido")));//                        "           ,[cc_cokhuphoido]    " +
                    obj.setCc_huongview(DATA.function.xuly_hienthi_truongKS(rs.getNString("cc_huongview")));//                        "           ,[cc_huongview]  " +
                    obj.setCc_nhavesinh(DATA.function.xuly_hienthi_truongKS(rs.getNString("cc_nhavesinh")));//                        "           ,[cc_nhavesinh]  " +
                    obj.setCc_chatluongconlai(rs.getString("cc_chatluongconlai"));//                        "           ,[cc_chatluongconlai]    " +
                    obj.setCc_khac(rs.getNString("cc_khac"));//                        "           ,[cc_khac]) "

                    //,cc_mota,cc_vitri,cc_sothua ,cc_soto,cc_dtnlonnhat
                    obj.setCc_mota(rs.getNString("cc_mota"));
                    obj.setCc_vitri(rs.getNString("cc_vitri"));
                    obj.setCc_sothua(rs.getNString("cc_sothua"));
                    obj.setCc_soto(rs.getNString("cc_soto"));
                    obj.setCc_dtnlonnhat(rs.getNString("cc_dtnlonnhat"));
                    //,cc_dtnnhonhat,cc_dtntruocts,cc_dientichthua,cc_mucdichsd,cc_hinhthucsd
                    obj.setCc_dtnnhonhat(rs.getNString("cc_dtnnhonhat"));
                    obj.setCc_dtntruocts(rs.getNString("cc_dtntruocts"));
                    obj.setCc_dientichthua(rs.getNString("cc_dientichthua"));
                    obj.setCc_mucdichsd(rs.getNString("cc_mucdichsd"));
                    obj.setCc_hinhthucsd(rs.getNString("cc_hinhthucsd"));
                    //,cc_thoigiansd,cc_nguongocsdd,cc_tentoanha,cc_tongsotang,cc_tongsoham
                    obj.setCc_thoigiansd(rs.getNString("cc_thoigiansd"));
                    obj.setCc_nguongocsdd(rs.getNString("cc_nguongocsdd"));
                    obj.setCc_tentoanha(rs.getNString("cc_tentoanha"));
                    obj.setCc_tongsotang(rs.getNString("cc_tongsotang"));
                    obj.setCc_tongsoham(rs.getNString("cc_tongsoham"));
                    //,cc_macanho,cc_tangcanho,cc_dtdauxeoto,cc_hinhdang,cc_tiepgiaptruoc
                    obj.setCc_macanho(rs.getNString("cc_macanho"));
                    obj.setCc_tangcanho(rs.getNString("cc_tangcanho"));
                    obj.setCc_dtdauxeoto(rs.getNString("cc_dtdauxeoto"));
                    obj.setCc_hinhdang(rs.getNString("cc_hinhdang"));
                    obj.setCc_tiepgiaptruoc(rs.getNString("cc_tiepgiaptruoc"));
                    //,cc_tiepgiapsau,cc_tiepgiaptrai,cc_tiepgiapphai,cc_noithat,cc_tinhtrang,cc_tongsotangcanho
                    obj.setCc_tiepgiapsau(rs.getNString("cc_tiepgiapsau"));
                    obj.setCc_tiepgiaptrai(rs.getNString("cc_tiepgiaptrai"));
                    obj.setCc_tiepgiapphai(rs.getNString("cc_tiepgiapphai"));
                    obj.setCc_noithat(rs.getNString("cc_noithat"));
                    obj.setCc_tinhtrang(rs.getNString("cc_tinhtrang"));
                    obj.setCc_tongsotangcanho(rs.getNString("cc_tongsotangcanho"));

                } else if (obj.getLoaits().startsWith("Đất Trống")) {
                    obj.setDt_hinhdang(DATA.function.xuly_hienthi_truongKS(rs.getNString("dt_hinhdang")));//                  ,[dt_hinhdang]
                    obj.setDt_chieurongmt(rs.getNString("dt_chieurongmt"));//               ,[dt_chieurongmt]
                    obj.setDt_huongnha(rs.getNString("dt_huongnha"));//                  ,[dt_huongnha]
                    obj.setDt_duongtruocnha(rs.getNString("dt_duongtruocnha"));//             ,[dt_duongtruocnha]
                    obj.setDt_vitri(rs.getNString("dt_vitri"));//                     ,[dt_vitri]
                    obj.setDt_khac(rs.getNString("dt_khac"));//                      ,[dt_khac]           
                    obj.setDt_vitriTS(rs.getNString("dt_vitriTS"));
                    obj.setDt_soto(rs.getNString("dt_soto"));                   //,[dt_soto] 
                    obj.setDt_sothua(rs.getNString("dt_sothua"));                   //,[dt_sothua] 
                    obj.setDt_dtnlonnhat(rs.getNString("dt_dtnlonnhat"));                    //,[dt_dtnlonnhat] 
                    obj.setDt_dtnnhonhat(rs.getNString("dt_dtnnhonhat"));                    //,[dt_dtnnhonhat]
                    obj.setDt_dtntruocts(rs.getNString("dt_dtntruocts"));                    //,[dt_dtntruocts] 
                    obj.setDt_tiepgiaptruoc(rs.getNString("dt_tiepgiaptruoc"));                   //,[dt_tiepgiaptruoc] 
                    obj.setDt_tiepgiapsau(rs.getNString("dt_tiepgiapsau"));                    //,[dt_tiepgiapsau] 
                    obj.setDt_tiepgiaptrai(rs.getNString("dt_tiepgiaptrai"));                   //,[dt_tiepgiaptrai] 
                    obj.setDt_tiepgiapphai(rs.getNString("dt_tiepgiapphai"));                  //,[dt_tiepgiapphai] 
                    obj.setDt_dientichtrongqh(rs.getNString("dt_dientichtrongqh"));                    //,[dt_dientichtrongqh]
                    obj.setDt_dientichngoaiqh(rs.getNString("dt_dientichngoaiqh"));                   //,[dt_dientichngoaiqh] 
                    obj.setDt_kichthuoc(rs.getNString("dt_kichthuoc"));                    //,[dt_kichthuoc] 
                    obj.setDt_mucdich(rs.getNString("dt_mucdich"));                   //,[dt_mucdich] 
                    obj.setDt_hinhthucrieng(rs.getNString("dt_hinhthucrieng"));                   //,[dt_hinhthucrieng] 
                    obj.setDt_hinhthucchung(rs.getNString("dt_hinhthucchung"));                    //,[dt_hinhthucchung] 
                    obj.setDt_thoigiansd(rs.getNString("dt_thoigiansd"));                    //,[dt_thoigiansd]
                    obj.setDt_nguongoc(rs.getNString("dt_nguongoc"));                   //,[dt_nguongoc] 
                    obj.setDt_hientrang(rs.getNString("dt_hientrang"));                   //,[dt_hientrang] 
                    obj.setDt_ghichu(rs.getNString("dt_ghichu"));                    //,[dt_ghichu]

                } else if (obj.getLoaits().endsWith("Biệt Thự") || obj.getLoaits().endsWith("Văn Phòng") || obj.getLoaits().endsWith("Nhà Phố")) {
                    obj.setNp_hinhdang(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_hinhdang")));
                    obj.setNp_chieurongmt(rs.getString("np_chieurongmt"));
                    obj.setNp_huongnha(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_huongnha")));
                    obj.setNp_duongtruocnha(rs.getNString("np_duongtruocnha"));
                    obj.setNp_vitri(rs.getNString("np_vitri"));
                    obj.setNp_loaict(rs.getNString("np_loaict"));
                    obj.setNp_loaimong(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_loaimong")));
                    obj.setNp_san(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_san")));
                    obj.setNp_cong(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_cong")));
                    obj.setNp_tuong(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_tuong")));
                    obj.setNp_tran(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_tran")));
                    obj.setNp_sannha(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_sannha")));
                    obj.setNp_cuachinh(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_cuachinh")));
                    obj.setNp_cuaphong(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_cuaphong")));
                    obj.setNp_cuaso(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_cuaso")));
                    obj.setNp_mai(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_mai")));
                    obj.setNp_cauthang(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_cauthang")));
                    obj.setNp_santhuong(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_santhuong")));
                    obj.setNp_nhavesinh(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_nhavesinh")));
                    obj.setNp_chatluongconlai(rs.getNString("np_chatluongconlai"));
                    obj.setNp_khac(rs.getNString("np_khac"));
                    obj.setNp_vitriTS(DATA.function.xuly_hienthi_truongKS(rs.getNString("np_vitriTS")));

                    obj.setNp_soto(rs.getNString("np_soto"));                   //,[np_soto] 
                    obj.setNp_sothua(rs.getNString("np_sothua"));                   //,[np_sothua] 
                    obj.setNp_dtnlonnhat(rs.getNString("np_dtnlonnhat"));                    //,[np_dtnlonnhat] 
                    obj.setNp_dtnnhonhat(rs.getNString("np_dtnnhonhat"));                    //,[np_dtnnhonhat]
                    obj.setNp_dtntruocts(rs.getNString("np_dtntruocts"));                    //,[np_dtntruocts] 
                    obj.setNp_tiepgiaptruoc(rs.getNString("np_tiepgiaptruoc"));                   //,[np_tiepgiaptruoc] 
                    obj.setNp_tiepgiapsau(rs.getNString("np_tiepgiapsau"));                    //,[np_tiepgiapsau] 
                    obj.setNp_tiepgiaptrai(rs.getNString("np_tiepgiaptrai"));                   //,[np_tiepgiaptrai] 
                    obj.setNp_tiepgiapphai(rs.getNString("np_tiepgiapphai"));                  //,[np_tiepgiapphai] 
                    obj.setNp_dientichtrongqh(rs.getNString("np_dientichtrongqh"));                    //,[np_dientichtrongqh]
                    obj.setNp_dientichngoaiqh(rs.getNString("np_dientichngoaiqh"));                   //,[np_dientichngoaiqh] 
                    obj.setNp_kichthuoc(rs.getNString("np_kichthuoc"));                    //,[np_kichthuoc] 
                    obj.setNp_mucdich(rs.getNString("np_mucdich"));                   //,[np_mucdich] 
                    obj.setNp_hinhthucrieng(rs.getNString("np_hinhthucrieng"));                   //,[np_hinhthucrieng] 
                    obj.setNp_hinhthucchung(rs.getNString("np_hinhthucchung"));                    //,[np_hinhthucchung] 
                    obj.setNp_thoigiansd(rs.getNString("np_thoigiansd"));                    //,[np_thoigiansd]
                    obj.setNp_nguongoc(rs.getNString("np_nguongoc"));                   //,[np_nguongoc] 
                    obj.setNp_hientrang(rs.getNString("np_hientrang"));                   //,[np_hientrang] 
                    obj.setNp_ghichu(rs.getNString("np_ghichu"));                    //,[np_ghichu]

                } else if (obj.getLoaits().startsWith("Máy Móc")) {
                    obj.setMm_thongso(rs.getNString("mm_thongso"));
                } else if (obj.getLoaits().startsWith("Khác")) {
                    obj.setKhac_thongso(rs.getNString("khac_thongso"));
                } else if (obj.getLoaits().startsWith("Nhà Xưởng")) {
                    obj.setNx_loaict(rs.getNString("nx_loaict"));
                    obj.setNx_cong(rs.getNString("nx_loaicong"));
                    obj.setNx_ghichu(rs.getNString("nx_ghichu"));
                    obj.setNx_vanphong(rs.getNString("nx_loaivanphong"));
                    obj.setNx_nhaxuong(rs.getNString("nx_loainhaxuong"));
                    obj.setNx_tramcan(rs.getNString("nx_loaitramcan"));
                    obj.setNx_baove(rs.getNString("nx_loaibaove"));
                    obj.setNx_tuongbao(rs.getNString("nx_loaituongbao"));
                }

            }
        } catch (Exception e) {
            function.Print_log("getObject_KS  " + e.getMessage());
        }
        return obj;
    }

    public static ArrayList<objKhaoSat> getAllKS_vieMaps(String cn) {
        ArrayList<objKhaoSat> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from v_KhaoSat_view where tinhtrang=0 and toadomaps !=''";
            PreparedStatement psm = conn.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objKhaoSat obj = new objKhaoSat();
                obj.setIdks(rs.getInt("idks"));
                obj.setMahs(rs.getString("mahs"));
                obj.setIdts(rs.getInt("idts"));
                obj.setDiachits(rs.getNString("diachits"));
                obj.setNgayks(rs.getTimestamp("thoigianks"));
                obj.setToadomaps(rs.getString("toadomaps"));
                obj.setManvks(rs.getString("manvks"));
                obj.setTennvks(rs.getNString("tennvks"));
                obj.setLoaits(rs.getNString("loaitsks"));
                arr.add(obj);
            }
        } catch (Exception e) {
            function.Print_log("getAllKS_vieMaps  " + e.getMessage());
        }
        return arr;
    }

   

    public static ArrayList<objKhaoSat> getAllKS(String cn) {
        ArrayList<objKhaoSat> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from v_KhaoSat_view where tinhtrang=0 order by thoigianks desc";
            PreparedStatement psm = conn.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objKhaoSat obj = new objKhaoSat();
                obj.setIdks(rs.getInt("idks"));
                obj.setMahs(rs.getString("mahs"));
                obj.setIdts(rs.getInt("idts"));
                obj.setDiachits(rs.getNString("diachits"));
                obj.setNgayks(rs.getTimestamp("thoigianks"));
                obj.setToadomaps("<a target=\"_blank\" href=\"maps?toado=" + rs.getString("toadomaps") + "\"> <i class=\"fa fa-map\"></i>" + rs.getString("toadomaps") + "</a>");
                obj.setManvks(rs.getString("manvks"));
                obj.setTennvks(rs.getNString("tennvks"));
                obj.setLoaits(rs.getNString("loaitsks"));
                arr.add(obj);
            }
        } catch (Exception e) {
            function.Print_log("getAllKS_vieMaps  " + e.getMessage());
        }
        return arr;
    }

    public static ArrayList<objKhaoSat> getAllKS_by_toanha(String cn) {
        ArrayList<objKhaoSat> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select idks,cc_tentoanha,diachits from v_KhaoSat_view where cc_tentoanha!='' and  tinhtrang=0 order by thoigianks desc";
            PreparedStatement psm = conn.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objKhaoSat obj = new objKhaoSat();
                obj.setIdks(rs.getInt("idks"));
                obj.setDiachits(rs.getNString("diachits"));
                obj.setCc_tentoanha(rs.getNString("cc_tentoanha"));
                arr.add(obj);
            }
        } catch (Exception e) {
            function.Print_log("getAllKS_vieMaps  " + e.getMessage());
        }
        return arr;
    }

    public static ArrayList<objKhaoSat> getPhieuby_Mahs(String mahs, String cn) {
        ArrayList<objKhaoSat> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from v_KhaoSat_view where tinhtrang=0 and mahs like ? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, '%' + mahs + '%');
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objKhaoSat obj = new objKhaoSat();
                obj.setIdks(rs.getInt("idks"));
                obj.setMahs(rs.getString("mahs"));
                obj.setIdts(rs.getInt("idts"));
                obj.setToadomaps(rs.getString("toadomaps"));
                arr.add(obj);
            }
        } catch (Exception e) {
            function.Print_log("getPhieuby_Mahs  " + e.getMessage());
        }
        return arr;
    }

    public static objKhaoSat getPhieuKSby_idks(int idks, String cn) {
        objKhaoSat obj = new objKhaoSat();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from v_KhaoSat_view where tinhtrang=0 and idks=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idks);
            ResultSet rs = psm.executeQuery();
            obj = getObject_KS(rs);
            conn.close();
        } catch (Exception e) {
            function.Print_log("getPhieuKSby_idks  " + e.getMessage());
        }

        return obj;
    }


}
