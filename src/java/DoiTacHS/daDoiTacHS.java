package DoiTacHS;

import DATA.DBConnection;
import DATA.function;
import DoiTacNH.objDoiTacNH;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class daDoiTacHS {

    ///kieu 1: so bo  2: khao sat
    public static int themmoi_HSDoitac(objDoiTacHS obj, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "insert into [tbl_doitac_hoso]([kieu],[iddt],[tendt],[dsfile],[ghichu],[nguoilienhe],[sodienthoai]) values(?,?,?,?,?,?,?) ";
            PreparedStatement psm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            psm.setInt(1, obj.getKieu());
            psm.setInt(2, obj.getIddt());
            psm.setNString(3, obj.getTendt());
            psm.setNString(4, obj.getDsfile());
            psm.setNString(5, obj.getGhichu());
            psm.setNString(6, obj.getNguoilienhe());
            psm.setNString(7, obj.getSodienthoai());
            kq = psm.executeUpdate();
            int idts = 0;
            if (kq > 0) {
                try (ResultSet rs = psm.getGeneratedKeys()) {
                    if (rs.next()) {
                        idts = rs.getInt(1);
                    }
                    rs.close();
                }
            }
            kq = idts;
            conn.close();
        } catch (Exception ex) {
            function.Print_log("themmoi_HSDoitac " + ex.getMessage());
        }
        return kq;
    }

    public static int update_dsfile(int id, String dsfile, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_doitac_hoso set dsfile=? where iddths=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setNString(1, dsfile);
            psm.setInt(2, id);
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_dsfile " + ex.getMessage());
        }
        return kq;
    }

    public static int update_tinhtrang(int id, int tinhtrang, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_doitac_hoso set tinhtrang=? where iddths=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, tinhtrang);
            psm.setInt(2, id);
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_tinhtrang " + ex.getMessage());
        }
        return kq;
    }

    public static ArrayList<objDoiTacHS> getAllHSsobo(int iddt, String cn) {
        ArrayList<objDoiTacHS> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select  * from tbl_doitac_hoso where kieu=1 and iddt=? order by iddths desc";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, iddt);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objDoiTacHS obj = new objDoiTacHS();
                obj.setIddths(rs.getInt("iddths"));
                obj.setNgaygui(rs.getTimestamp("ngaygui"));
                obj.setNgaynhan(rs.getTimestamp("ngaynhan"));
                obj.setIddt(iddt);
                obj.setTendt(rs.getNString("tendt"));
                obj.setIdnvxn(rs.getInt("idnvxn"));
                obj.setTennvxn(rs.getNString("tennvxn"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setDsfile(rs.getNString("dsfile"));
                obj.setNguoilienhe(rs.getNString("nguoilienhe"));
                obj.setSodienthoai(rs.getNString("sodienthoai"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllHSsobo  " + e.getMessage());
        }

        return arr;
    }

    public static ArrayList<objDoiTacHS> getAllHSsoboby_id(int iddt, int idhs, String cn) {
        ArrayList<objDoiTacHS> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select  * from tbl_doitac_hoso where kieu=1 and iddt=? and iddths=? order by iddths desc";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, iddt);
            psm.setInt(2, idhs);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objDoiTacHS obj = new objDoiTacHS();
                obj.setIddths(rs.getInt("iddths"));
                obj.setNgaygui(rs.getTimestamp("ngaygui"));
                obj.setNgaynhan(rs.getTimestamp("ngaynhan"));
                obj.setIddt(iddt);
                obj.setTendt(rs.getNString("tendt"));
                obj.setIdnvxn(rs.getInt("idnvxn"));
                obj.setTennvxn(rs.getNString("tennvxn"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setDsfile(rs.getNString("dsfile"));
                obj.setGhichu(rs.getNString("ghichu"));
                obj.setNguoilienhe(rs.getNString("nguoilienhe"));
                obj.setSodienthoai(rs.getNString("sodienthoai"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllHSsoboby_id  " + e.getMessage());
        }

        return arr;
    }

    public static ArrayList<objDoiTacHS> getAllHSkhaosat(int iddt, String cn) {
        ArrayList<objDoiTacHS> arr = new ArrayList<>();
        try {          
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select  * from tbl_doitac_hoso where kieu=2 and iddt=? order by iddths desc";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, iddt);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objDoiTacHS obj = new objDoiTacHS();
                obj.setIddths(rs.getInt("iddths"));
                obj.setNgaygui(rs.getTimestamp("ngaygui"));
                obj.setNgaynhan(rs.getTimestamp("ngaynhan"));
                obj.setIddt(iddt);
                obj.setTendt(rs.getNString("tendt"));
                obj.setIdnvxn(rs.getInt("idnvxn"));
                obj.setTennvxn(rs.getNString("tennvxn"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setDsfile(rs.getNString("dsfile"));
                obj.setNguoilienhe(rs.getNString("nguoilienhe"));
                obj.setSodienthoai(rs.getNString("sodienthoai"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllHSkhaosat  " + e.getMessage());
        }

        return arr;
    }

    public static ArrayList<objDoiTacHS> getAllHSkhaosatby_id(int iddt, int idhs, String cn) {
        ArrayList<objDoiTacHS> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select  * from tbl_doitac_hoso where kieu=2 and iddt=? and iddths=? order by iddths desc";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, iddt);
            psm.setInt(2, idhs);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objDoiTacHS obj = new objDoiTacHS();
                obj.setIddths(rs.getInt("iddths"));
                obj.setNgaygui(rs.getTimestamp("ngaygui"));
                obj.setNgaynhan(rs.getTimestamp("ngaynhan"));
                obj.setIddt(iddt);
                obj.setTendt(rs.getNString("tendt"));
                obj.setIdnvxn(rs.getInt("idnvxn"));
                obj.setTennvxn(rs.getNString("tennvxn"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setDsfile(rs.getNString("dsfile"));
                obj.setGhichu(rs.getNString("ghichu"));
                obj.setNguoilienhe(rs.getNString("nguoilienhe"));
                obj.setSodienthoai(rs.getNString("sodienthoai"));
                
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllHSkhaosatby_id  " + e.getMessage());
        }

        return arr;
    }
}
