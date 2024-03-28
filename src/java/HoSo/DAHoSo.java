package HoSo;

import DATA.DBConnection;
import DATA.function;
import TaiSan.objTaiSan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class DAHoSo {

    private static objHoSo getOBJ_getlist(ResultSet rs) throws SQLException {
        objHoSo obj = new objHoSo();
        obj.setIdhs(rs.getInt("idhs"));
        obj.setMahs(rs.getString("mahs"));
        obj.setSoct(rs.getString("soct"));
        obj.setDoitac(rs.getNString("doitac"));
        obj.setCbthuchien(rs.getNString("cbthuchien"));
        obj.setCbcrc(rs.getNString("cbcrc"));
        obj.setDoitaccrc(rs.getNString("doitaccrc"));
        obj.setTinhtrang(rs.getInt("tinhtrang"));
        obj.setIdnvsb(rs.getInt("idnvsb"));
        obj.setTennvsb(rs.getNString("tennvsb"));

        obj.setIdnvtao(rs.getInt("idnvtao"));
        obj.setTennvtao(rs.getNString("tennvtao"));

        obj.setIdnvks(rs.getInt("idnvks"));
        obj.setTennvks(rs.getNString("tennvks"));

        obj.setIdnvgia(rs.getInt("idnvgia"));
        obj.setTennvgia(rs.getNString("tennvgia"));

        obj.setNgaylaphs(rs.getTimestamp("ngaylaphs"));
        obj.setGiasobo(rs.getNString("notegia"));
        obj.setGiatd(rs.getDouble("giatd"));

        obj.setIn_dain(rs.getInt("dain"));
        obj.setIn_idnv(rs.getInt("in_idnv"));
        obj.setGiao_idnv(rs.getInt("giao_idnv"));
        obj.setSohats(rs.getInt("soha"));
        obj.setIsclose(rs.getInt("isclose"));

        obj.setTamung(rs.getInt("tamung"));
        obj.setThuphi(rs.getInt("thuphi"));

        obj.setTinhtp(rs.getNString("tinhtp"));
        obj.setQuanhuyen(rs.getNString("quanhuyen"));
        obj.setPhuongxa(rs.getNString("phuongxa"));
        obj.setDiachi(rs.getNString("diachi"));
        obj.setDuyetgia(rs.getInt("duyetgia"));

        obj.setFulldiachi(obj.getDiachi().length() == 0 ? "" : obj.getDiachi() + ", " + obj.getPhuongxa() + ", " + obj.getQuanhuyen() + ", " + obj.getTinhtp());

        obj.setTrangthaihs(rs.getNString("trangthai"));
        obj.setNvthuchien(rs.getNString("nvthuchien"));

        obj.setCtnhap(rs.getInt("ctnhap"));
        obj.setTsghichu(rs.getNString("tsghichu"));
        obj.setNguoilienheks(rs.getNString("nguoilienheks"));
        obj.setNguoilienhesdt(rs.getString("nguoilienhesdt"));

        obj.setThue(rs.getString("thue"));

        return obj;
    }

    private static objHoSo getOBJ_get_one_HS(ResultSet rs) throws SQLException {
        objHoSo obj = new objHoSo();
        obj.setIdhs(rs.getInt("idhs"));
        obj.setMahs(rs.getString("mahs"));
        obj.setSoct(rs.getString("soct"));
        obj.setLoaihd(rs.getNString("loaihd"));
        obj.setGiatrihd(rs.getDouble("giatrihd"));
        obj.setGiatrihdbangchu(rs.getNString("giatrihdbangchu"));
        obj.setThue(rs.getNString("thue"));
        obj.setIdkh(rs.getInt("idkh"));
        obj.setTinhtrang(rs.getInt("tinhtrang"));

        obj.setDoitac(rs.getNString("doitac"));
        obj.setCbthuchien(rs.getNString("cbthuchien"));

        obj.setCbcrc(rs.getNString("cbcrc"));
        obj.setDoitaccrc(rs.getNString("doitaccrc"));

        obj.setIdnvtao(rs.getInt("idnvtao"));
        obj.setTennvtao(rs.getNString("tennvtao"));

        obj.setIdnvsb(rs.getInt("idnvsb"));
        obj.setTennvsb(rs.getNString("tennvsb"));

        obj.setIdnvks(rs.getInt("idnvks"));
        obj.setTennvks(rs.getNString("tennvks"));

        //obj.setIdctv(rs.getInt("idctv"));
        //obj.setTenctv(rs.getNString("tenctv"));
        obj.setIdnvgia(rs.getInt("idnvgia"));
        obj.setTennvgia(rs.getNString("tennvgia"));

        obj.setNgaylaphs(rs.getTimestamp("ngaylaphs"));
        obj.setNgaysobo(rs.getTimestamp("ngaysobo"));
        obj.setNgaykhaosat(rs.getTimestamp("ngaykhaosat"));
        obj.setNgaybaogia(rs.getTimestamp("ngaybaogia"));
        obj.setNguoilienheks(rs.getNString("nguoilienheks"));
        obj.setNguoilienhesdt(rs.getString("nguoilienhesdt"));
        obj.setIsclose(rs.getInt("isclose"));

        obj.setIn_dain(rs.getInt("dain"));
        obj.setIn_idnv(rs.getInt("in_idnv")); //    int in_idnv;
        obj.setIn_tennv(rs.getNString("in_tennv")); //    String in_tennv;
        obj.setIn_thoigian(rs.getTimestamp("in_thoigian"));//    Timestamp in_thoigian;
        obj.setIn_note(rs.getNString("in_note"));

        obj.setGiao_dagiao(rs.getInt("dagiao"));
        obj.setGiao_idnv(rs.getInt("giao_idnv"));//    int giao_idnv;
        obj.setGiao_tennv(rs.getNString("giao_tennv"));//    String giao_tennv;
        obj.setGiao_thoigiankh(rs.getTimestamp("giao_thoigiankh"));//                   Timestamp giao_thoigiankh;
        obj.setGiao_thoigiannh(rs.getTimestamp("giao_thoigiannh"));//                   Timestamp giao_thoigiannh;
        obj.setGiao_chukykh(rs.getString("giao_chukykh"));//                   String giao_chukykh;
        obj.setGiao_chukynh(rs.getString("giao_chukynh"));//                   String giao_chukynh;
        obj.setGiao_tenkh(rs.getNString("giao_tenkh"));
        obj.setGiao_tennh(rs.getNString("giao_tennh"));
        obj.setGiao_noteKH(rs.getNString("giao_noteKH"));
        obj.setGiao_noteNH(rs.getNString("giao_noteNH"));
        obj.setHscode(rs.getString("hscode"));

        obj.setTamung(rs.getInt("tamung"));
        obj.setThuphi(rs.getInt("thuphi"));

        obj.setGiao_loai(rs.getInt("giao_loai"));
        //obj.setTrangthaihs(rs.getNString("trangthai"));
        obj.setTrangthaihs(rs.getNString("trangthai"));
        obj.setNvthuchien(rs.getNString("nvthuchien"));

        obj.setHd_ghichu(rs.getString("hd_ghichu"));
        obj.setHd_ngaynhan(rs.getString("hd_ngaynhan"));
        obj.setHd_ngaygiao(rs.getString("hd_ngaygiao"));
        obj.setHd_ngaythu(rs.getNString("hd_ngaythu"));
        obj.setHinhbaogia(rs.getNString("hinhbaogia"));

        obj.setDuyetgia(rs.getInt("duyetgia"));
        obj.setGiaduyet(rs.getDouble("giaduyet"));
        obj.setDuyetgia_ghichu(rs.getNString("duyetgia_ghichu"));

        obj.setToadomaps(rs.getString("toadomaps"));
        obj.setCtnhap(rs.getInt("ctnhap"));

        obj.setTinhtp(rs.getNString("tinhtp"));
        obj.setQuanhuyen(rs.getNString("quanhuyen"));
        obj.setPhuongxa(rs.getNString("phuongxa"));
        obj.setDiachi(rs.getNString("diachi"));
        obj.setFulldiachi(obj.getDiachi().length() == 0 ? "" : obj.getDiachi() + ", " + obj.getPhuongxa() + ", " + obj.getQuanhuyen() + ", " + obj.getTinhtp());
        obj.setTsghichu(rs.getNString("tsghichu"));

        return obj;
    }

    public static ArrayList<objHoSo> getAllListHSby_DoitacCanBo(String doitac, String canbo, String cn) {

        String sql = "declare @doitac varchar(100),@canbo varchar(100) "
                + "set @doitac =?  "
                + "set @canbo = ? "
                + "select * "
                + "from v_HoSo "
                + "where ((doitac=@doitac and cbthuchien=@canbo) or ( doitaccrc=@doitac and cbcrc=@canbo ))  and tinhtrang<10"
                + "order by idhs desc ";

        List<objHoSo> list = DBConnection.truyvan_Select2(cn, sql, "getAllListHSby_DoitacCanBo", resultSet -> getOBJ_getlist(resultSet), doitac, canbo);
        return (ArrayList<objHoSo>) list;
    }

    public static ArrayList<objHoSo> getAllListHSby_DoitacCanBo_qly(String doitac, String canbo, String cn) {

        String sql = "declare @doitac varchar(100),@canbo varchar(100) "
                + "set @doitac =?  "
                + "set @canbo = ? "
                + "select * "
                + "from v_HoSo a "
                + "where (idhs in (select a.idhs from v_HoSo a ,v_Doitac_qly b where a.cbthuchien=b.cbuser and a.doitac=b.dtuser and b.quanly=1 and a.tinhtrang<10 and  "
                + "b.dtqly=@doitac and b.cbqly=@canbo)"
                + " or  (doitac=@doitac and cbthuchien=@canbo)  or (doitaccrc=@doitac and cbcrc=@canbo)) and tinhtrang<10 "
                + " order by idhs desc";
        List<objHoSo> list = DBConnection.truyvan_Select2(cn, sql, "getAllListHSby_DoitacCanBo", resultSet -> getOBJ_getlist(resultSet), doitac, canbo);
        return (ArrayList<objHoSo>) list;
    }

    
    
      
    public static objHoSo getHSBy_id(int idhs, String cn) {
        objHoSo obj = new objHoSo();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from v_HoSo where idhs=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idhs);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {

                obj = getOBJ_get_one_HS(rs);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getHSBy_id " + e.getMessage());
        }
        return obj;
    }

    public static objHoSo getHSby_mahs(String mahs, String cn) {
        objHoSo obj = new objHoSo();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from v_HoSo where mahs=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, mahs);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {

                obj = getOBJ_get_one_HS(rs);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getHSby_mahs " + e.getMessage());
        }
        return obj;
    }

    public static objHoSo getHSby_hscode(String hscode, String cn) {
        objHoSo obj = new objHoSo();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from v_HoSo where hscode=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, hscode);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                obj = getOBJ_get_one_HS(rs);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getHSby_mahs " + e.getMessage());
        }
        return obj;
    }

}
