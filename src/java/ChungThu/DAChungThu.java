package ChungThu;

import DATA.DBConnection;
import DATA.function;

import HoSo.objHoSo;
import TaiSan.objTaiSan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DAChungThu {

    public static int themoiCT(objChungThu obj, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "INSERT INTO tbl_chungthu( "
                    + "            [mahs]\n"
                    + "           ,[soct]\n"
                    + "           ,[makh]\n"
                    + "           ,[ngayphathanh]\n"
                    + "           ,[tenkh]\n"
                    + "           ,[cnpgd]\n"
                    + "           ,[fulldiachi]\n"
                    + "           ,[tinhtp]\n"
                    + "           ,[quanhuyen]\n"
                    + "           ,[phuongxa]\n"
                    + "           ,[duongpho]\n"
                    + "           ,[motaBDS]\n"
                    + "           ,[loaidat]\n"
                    + "           ,[dato_dientich]\n"
                    + "           ,[dato_dongia]\n"
                    + "           ,[dato_giatri]\n"
                    + "           ,[datkhac_dientich]\n"
                    + "           ,[datkhac_dongia]\n"
                    + "           ,[datkhac_giatri]\n"
                    + "           ,[giatriQSDdat]\n"
                    + "           ,[loaiCTXD]\n"
                    + "           ,[CTXDdientich]\n"
                    + "           ,[CTXDdongia]\n"
                    + "           ,[CTXDCLCL]\n"
                    + "           ,[CTXDkhac]\n"
                    + "           ,[CTXDgiatri]\n"
                    + "           ,[tonggiatri]\n"
                    + "           ,[manvlap]\n"
                    + "           ,[tennvlap]"
                    + ",loaidat1,loaidat1_s,loaidat1_dg,loaidat1_gt,loaidat1_gtqsd "
                    + ",loaidat2,loaidat2_s,loaidat2_dg,loaidat2_gt,loaidat2_gtqsd "
                    + ",loaidat3,loaidat3_s,loaidat3_dg,loaidat3_gt,loaidat3_gtqsd "
                    + ",loaidat4,loaidat4_s,loaidat4_dg,loaidat4_gt,loaidat4_gtqsd "
                    + ",vitri) \n"
                    + " VALUES("
                    + "            ?,?,?,?,? "
                    + "           ,?,?,?,?,? "
                    + "           ,?,?,?,?,? "
                    + "           ,?,?,?,?,? "
                    + "           ,?,?,?,?,? "
                    + "           ,?,?,?,?"
                    + " ,?,?,?,?,? "
                    + " ,?,?,?,?,? "
                    + " ,?,?,?,?,? "
                    + " ,?,?,?,?,? "
                    + " ,?)";
            PreparedStatement psm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            psm.setString(1, obj.getMahs());//            [mahs]\n" +
            psm.setString(2, obj.getSoct());//"           ,[soct]\n" +
            psm.setString(3, obj.getMakh());//"           ,[makh]\n" +
            psm.setTimestamp(4, obj.getNgayphathanh());//"           ,[ngayphathanh]\n" +
            psm.setNString(5, obj.getTenkh());//"           ,[tenkh]\n" +

            psm.setNString(6, obj.getCnpgd());//"           ,[cnpgd]\n" +
            psm.setNString(7, obj.getFulldiachi());//"           ,[fulldiachi]\n" +
            psm.setNString(8, obj.getTinhtp());//"           ,[tinhtp]\n" +
            psm.setNString(9, obj.getQuanhuyen());//"           ,[quanhuyen]\n" +
            psm.setNString(10, obj.getPhuongxa());//"           ,[phuongxa]\n" +

            psm.setNString(11, obj.getDuongpho());//"           ,[duongpho]\n" +
            psm.setNString(12, obj.getMotaBDS());//"           ,[motaBDS]\n" +
            psm.setNString(13, obj.getLoaidat());//"           ,[loaidat]\n" +
            psm.setDouble(14, obj.getDato_dientich());//"           ,[dato_dientich]\n" +
            psm.setDouble(15, obj.getDato_dongia());//"           ,[dato_dongia]\n" +

            psm.setDouble(16, obj.getDato_giatri());//"           ,[dato_giatri]\n" +
            psm.setDouble(17, obj.getDatkhac_dientich());//"           ,[datkhac_dientich]\n" +
            psm.setDouble(18, obj.getDatkhac_dongia());//"           ,[datkhac_dongia]\n" +
            psm.setDouble(19, obj.getDatkhac_giatri());//"           ,[datkhac_giatri]\n" +
            psm.setDouble(20, obj.getGiatriQSDdat());//"           ,[giatriQSDdat]\n" +

            psm.setNString(21, obj.getLoaiCTXD());//"           ,[loaiCTXD]\n" +
            psm.setDouble(22, obj.getCTXDdientich());//"           ,[CTXDdientich]\n" +
            psm.setDouble(23, obj.getCTXDdongia());//"           ,[CTXDdongia]\n" +
            psm.setString(24, obj.getCTXDCLCL());//"           ,[CTXDCLCL]\n" +
            psm.setDouble(25, obj.getCTXDkhac());//"           ,[CTXDkhac]\n" +

            psm.setDouble(26, obj.getCTXDgiatri());//"           ,[CTXDgiatri]\n" +
            psm.setDouble(27, obj.getTonggiatri());//"           ,[tonggiatri]\n" +
            psm.setString(28, obj.getManvlap());//"           ,[manvlap]\n" +
            psm.setNString(29, obj.getTennvlap());//"           ,[tennvlap]\n"  +                 

            psm.setNString(30, obj.getLoaidat1());
            psm.setDouble(31, obj.getLoaidat1_s());
            psm.setDouble(32, obj.getLoaidat1_dg());
            psm.setDouble(33, obj.getLoaidat1_gt());
            psm.setDouble(34, obj.getLoaidat1_gtqsd());

            psm.setNString(35, obj.getLoaidat2());
            psm.setDouble(36, obj.getLoaidat2_s());
            psm.setDouble(37, obj.getLoaidat2_dg());
            psm.setDouble(38, obj.getLoaidat2_gt());
            psm.setDouble(39, obj.getLoaidat2_gtqsd());

            psm.setNString(40, obj.getLoaidat3());
            psm.setDouble(41, obj.getLoaidat3_s());
            psm.setDouble(42, obj.getLoaidat3_dg());
            psm.setDouble(43, obj.getLoaidat3_gt());
            psm.setDouble(44, obj.getLoaidat3_gtqsd());

            psm.setNString(45, obj.getLoaidat4());
            psm.setDouble(46, obj.getLoaidat4_s());
            psm.setDouble(47, obj.getLoaidat4_dg());
            psm.setDouble(48, obj.getLoaidat4_gt());
            psm.setDouble(49, obj.getLoaidat4_gtqsd());

            psm.setNString(50, obj.getVitri());
            kq = psm.executeUpdate();
            int idhs = 0;
            if (kq > 0) {
                try (ResultSet rs = psm.getGeneratedKeys()) {
                    if (rs.next()) {
                        idhs = rs.getInt(1);
                    }
                    rs.close();
                }
            }
            kq = idhs;
            conn.close();
        } catch (Exception ex) {
            function.Print_log("themoiCT " + ex.getMessage());
        }
        return kq;
    }

    public static int xoa_CT(int idct, String cn) {
        int kq = 0;
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "delete from tbl_chungthu where idct=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idct);
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception e) {
            function.Print_log("xoa_CT " + e.getMessage());
        }

        return kq;
    }

    public static int kiemtra_SoCT(String soct, String cn) {
        int kq = 0;
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_chungthu where soct=? and tinhtrang=0 ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, soct);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                kq = 1;
                break;
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("kiemtra_SoCT " + e.getMessage());
        }

        return kq;
    }

    public static objChungThu getObjectby_RS(ResultSet rs) {
        objChungThu obj = new objChungThu();
        try {
            while (rs.next()) {
                obj.setIdct(rs.getInt("idct"));
                obj.setSoct(rs.getString("soct"));
                obj.setMahs(rs.getString("mahs"));
                obj.setNgayphathanh(rs.getTimestamp("ngayphathanh")); //2 --> 5/2/19
                obj.setNgaylap(rs.getTimestamp("ngaylap")); //2 --> 5/2/19
                obj.setMakh(rs.getString("makh"));
                obj.setTenkh(rs.getNString("tenkh"));//3 --> HOÀNG THÂN DUY
                obj.setCnpgd(rs.getNString("cnpgd"));
                obj.setFulldiachi(rs.getNString("fulldiachi"));//5 --> N?n L, Lô 09, V?n Phúc 1, ph??ng Hi?p Bình Ph??c, qu?n Th? ??c, TP.HCM
                obj.setTinhtp(rs.getNString("tinhtp"));
                obj.setQuanhuyen(rs.getNString("quanhuyen"));
                obj.setPhuongxa(rs.getNString("phuongxa"));
                obj.setDuongpho(rs.getNString("duongpho"));
                obj.setVitri(rs.getNString("vitri"));
                obj.setMotaBDS(rs.getNString("motaBDS"));//10 --> + B?t ??ng s?n t?a l?c t?i 878 Hu?nh T?n Phát, khu ph? 3, ph??ng Tân Phú, qu?n 7, Tp. H? Chí Minh n?m g?n tr??ng M?m non Hoa H?ng, tr??ng Qu?c t? Nh?t B?n, Công an ph??ng Phú Thu?n, tr??ng M?m non Phú Thu?n, UBND ph??ng Phú Thu?n,… thu?n ti?n di chuy?n ??n huy?n Nhà Bè và nh?ng khu v?c lân c?n khác,…
                obj.setLoaidat(rs.getNString("loaidat")); //11 --> ??t ? ?ô th?
                obj.setDato_dientich(rs.getDouble("dato_dientich")); //12 --> 102.50
                obj.setDato_dongia(rs.getDouble("dato_dongia")); //13 --> 40,110,467
                obj.setDato_giatri(rs.getDouble("dato_giatri")); //14 --> 4111323000
                obj.setDatkhac_dientich(rs.getDouble("datkhac_dientich"));//15 --> 0.00
                obj.setDatkhac_dongia(rs.getDouble("datkhac_dongia"));//16 --> 0
                obj.setDatkhac_giatri(rs.getDouble("datkhac_giatri"));//17 --> 0
                obj.setGiatriQSDdat(rs.getDouble("giatriQSDdat"));//  18 --> 4111323000                           
                obj.setLoaiCTXD(rs.getNString("loaiCTXD"));//19 --> 3 T?ng + 1 Tum
                obj.setCTXDdientich(rs.getDouble("CTXDdientich"));//20 --> 0.00
                obj.setCTXDdongia(rs.getDouble("CTXDdongia"));//21 --> 8,760,000
                obj.setCTXDCLCL(rs.getString("CTXDCLCL"));//22 --> 40.19%
                obj.setCTXDkhac(rs.getDouble("CTXDkhac"));//
                obj.setCTXDgiatri(rs.getDouble("CTXDgiatri"));//24 --> 0
                obj.setTonggiatri(rs.getDouble("tonggiatri"));//25 --> 4,111,323,000     
                obj.setManvlap(rs.getString("manvlap"));
                obj.setTennvlap(rs.getNString("tennvlap"));

                obj.setLoaidat1(rs.getNString("loaidat1"));
                obj.setLoaidat1_s(rs.getDouble("loaidat1_s"));
                obj.setLoaidat1_dg(rs.getDouble("loaidat1_dg"));
                obj.setLoaidat1_gt(rs.getDouble("loaidat1_gt"));
                obj.setLoaidat1_gtqsd(rs.getDouble("loaidat1_gtqsd"));

                obj.setLoaidat2(rs.getNString("loaidat2"));
                obj.setLoaidat2_s(rs.getDouble("loaidat2_s"));
                obj.setLoaidat2_dg(rs.getDouble("loaidat2_dg"));
                obj.setLoaidat2_gt(rs.getDouble("loaidat2_gt"));
                obj.setLoaidat2_gtqsd(rs.getDouble("loaidat2_gtqsd"));

                obj.setLoaidat3(rs.getNString("loaidat3"));
                obj.setLoaidat3_s(rs.getDouble("loaidat3_s"));
                obj.setLoaidat3_dg(rs.getDouble("loaidat3_dg"));
                obj.setLoaidat3_gt(rs.getDouble("loaidat3_gt"));
                obj.setLoaidat3_gtqsd(rs.getDouble("loaidat3_gtqsd"));

                obj.setLoaidat4(rs.getNString("loaidat4"));
                obj.setLoaidat4_s(rs.getDouble("loaidat4_s"));
                obj.setLoaidat4_dg(rs.getDouble("loaidat4_dg"));
                obj.setLoaidat4_gt(rs.getDouble("loaidat4_gt"));
                obj.setLoaidat4_gtqsd(rs.getDouble("loaidat4_gtqsd"));

                //System.out.println(obj.getLoaidat1());
            }
        } catch (Exception e) {
            function.Print_log("getObjectby_RS " + e.getMessage());
        }
        return obj;
    }

    public static objChungThu getCTby_mahs(String mahs, String cn) {
        objChungThu obj = new objChungThu();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_chungthu where mahs=? and tinhtrang=0 ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, mahs);
            ResultSet rs = psm.executeQuery();
            obj = getObjectby_RS(rs);
            conn.close();
        } catch (Exception e) {
            function.Print_log("getCTby_mahs " + e.getMessage());
        }

        return obj;
    }

    public static ArrayList<objChungThu> getChungThu_datToday(String date, String to, String cn) {
        ArrayList<objChungThu> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "declare @date1 varchar(20),@date2 varchar(20) "
                    + "set @date1=? "
                    + "set @date2=? "
                    + "select * from tbl_chungthu where tinhtrang=0 and ngayphathanh between @date1 and @date2 ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, date);
            psm.setString(2, to);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objChungThu obj = new objChungThu();
                obj.setIdct(rs.getInt("idct"));
                obj.setSoct(rs.getString("soct"));
                obj.setMahs(rs.getString("mahs"));
                obj.setNgayphathanh(rs.getTimestamp("ngayphathanh")); //2 --> 5/2/19
                obj.setNgaylap(rs.getTimestamp("ngaylap")); //2 --> 5/2/19
                obj.setMakh(rs.getString("makh"));
                obj.setTenkh(rs.getNString("tenkh"));//3 --> HOÀNG THÂN DUY
                obj.setCnpgd(rs.getNString("cnpgd"));
                obj.setFulldiachi(rs.getNString("fulldiachi"));//5 --> N?n L, Lô 09, V?n Phúc 1, ph??ng Hi?p Bình Ph??c, qu?n Th? ??c, TP.HCM
                obj.setTinhtp(rs.getNString("tinhtp"));
                obj.setQuanhuyen(rs.getNString("quanhuyen"));
                obj.setPhuongxa(rs.getNString("phuongxa"));
                obj.setDuongpho(rs.getNString("duongpho"));
                obj.setVitri(rs.getNString("vitri"));
                obj.setMotaBDS(rs.getNString("motaBDS"));//10 --> + B?t ??ng s?n t?a l?c t?i 878 Hu?nh T?n Phát, khu ph? 3, ph??ng Tân Phú, qu?n 7, Tp. H? Chí Minh n?m g?n tr??ng M?m non Hoa H?ng, tr??ng Qu?c t? Nh?t B?n, Công an ph??ng Phú Thu?n, tr??ng M?m non Phú Thu?n, UBND ph??ng Phú Thu?n,… thu?n ti?n di chuy?n ??n huy?n Nhà Bè và nh?ng khu v?c lân c?n khác,…
                obj.setLoaidat(rs.getNString("loaidat")); //11 --> ??t ? ?ô th?
                obj.setDato_dientich(rs.getDouble("dato_dientich")); //12 --> 102.50
                obj.setDato_dongia(rs.getDouble("dato_dongia")); //13 --> 40,110,467
                obj.setDato_giatri(rs.getDouble("dato_giatri")); //14 --> 4111323000
                obj.setDatkhac_dientich(rs.getDouble("datkhac_dientich"));//15 --> 0.00
                obj.setDatkhac_dongia(rs.getDouble("datkhac_dongia"));//16 --> 0
                obj.setDatkhac_giatri(rs.getDouble("datkhac_giatri"));//17 --> 0
                obj.setGiatriQSDdat(rs.getDouble("giatriQSDdat"));//  18 --> 4111323000                           
                obj.setLoaiCTXD(rs.getNString("loaiCTXD"));//19 --> 3 T?ng + 1 Tum
                obj.setCTXDdientich(rs.getDouble("CTXDdientich"));//20 --> 0.00
                obj.setCTXDdongia(rs.getDouble("CTXDdongia"));//21 --> 8,760,000
                obj.setCTXDCLCL(rs.getString("CTXDCLCL"));//22 --> 40.19%
                obj.setCTXDkhac(rs.getDouble("CTXDkhac"));//
                obj.setCTXDgiatri(rs.getDouble("CTXDgiatri"));//24 --> 0
                obj.setTonggiatri(rs.getDouble("tonggiatri"));//25 --> 4,111,323,000     
                obj.setManvlap(rs.getString("manvlap"));
                obj.setTennvlap(rs.getNString("tennvlap"));

                obj.setLoaidat1(rs.getNString("loaidat1"));
                obj.setLoaidat1_s(rs.getDouble("loaidat1_s"));
                obj.setLoaidat1_dg(rs.getDouble("loaidat1_dg"));
                obj.setLoaidat1_gt(rs.getDouble("loaidat1_gt"));
                obj.setLoaidat1_gtqsd(rs.getDouble("loaidat1_gtqsd"));

                obj.setLoaidat2(rs.getNString("loaidat2"));
                obj.setLoaidat2_s(rs.getDouble("loaidat2_s"));
                obj.setLoaidat2_dg(rs.getDouble("loaidat2_dg"));
                obj.setLoaidat2_gt(rs.getDouble("loaidat2_gt"));
                obj.setLoaidat2_gtqsd(rs.getDouble("loaidat2_gtqsd"));

                obj.setLoaidat3(rs.getNString("loaidat3"));
                obj.setLoaidat3_s(rs.getDouble("loaidat3_s"));
                obj.setLoaidat3_dg(rs.getDouble("loaidat3_dg"));
                obj.setLoaidat3_gt(rs.getDouble("loaidat3_gt"));
                obj.setLoaidat3_gtqsd(rs.getDouble("loaidat3_gtqsd"));

                obj.setLoaidat4(rs.getNString("loaidat4"));
                obj.setLoaidat4_s(rs.getDouble("loaidat4_s"));
                obj.setLoaidat4_dg(rs.getDouble("loaidat4_dg"));
                obj.setLoaidat4_gt(rs.getDouble("loaidat4_gt"));
                obj.setLoaidat4_gtqsd(rs.getDouble("loaidat4_gtqsd"));
                arr.add(obj);

                //System.out.println(obj.getLoaidat1());
            }

            conn.close();
        } catch (Exception e) {
            function.Print_log("getChungThu_datToday " + e.getMessage());
        }

        return arr;
    }

    public static int updateCT_huyCT(int tinhtrang, int idct, String cn) {
        int kq = 0;
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_chungthu set tinhtrang=? where idct=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, tinhtrang);
            psm.setInt(2, idct);
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception e) {
            function.Print_log("updateCT_huyCT " + e.getMessage());
        }

        return kq;
    }

}
