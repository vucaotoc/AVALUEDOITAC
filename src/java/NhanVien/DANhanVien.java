package NhanVien;

import DATA.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DANhanVien {

    public static boolean check_login(String u, String p, String cn) {
        boolean kq = false;
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_nhanvien "
                    + " where tendn=? and matkhau=? and tinhtrang=0";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, u);
            psm.setString(2, function.encrypt(p));
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                kq = true;
                break;
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("check login " + e.getMessage());
        }
        return kq;
    }

    public static objNhanVien getNhanVien(String tendn, String pass, String cn) {
        objNhanVien obj = new objNhanVien();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_nhanvien "
                    + " where tendn=? and matkhau=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, tendn);
            psm.setString(2, function.encrypt(pass));
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                obj.setIdnv(rs.getInt("idnv"));
                obj.setQuyen(rs.getInt("quyen"));
                obj.setManv(rs.getString("manv").trim());
                obj.setTennv(rs.getNString("tennv"));
                obj.setTendn(rs.getString("tendn"));
                obj.setEmail(rs.getString("email"));
                obj.setSodt(rs.getString("sodt"));
                obj.setAvata(rs.getString("avata"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setProfile_embed(rs.getNString("profile_embed"));
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getNhanVien" + e.getMessage());
        }
        return obj;
    }

    public static objNhanVien getNhanVien(String manv, String cn) {
        objNhanVien obj = new objNhanVien();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_nhanvien "
                    + " where manv=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, manv);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                obj.setIdnv(rs.getInt("idnv"));
                obj.setQuyen(rs.getInt("quyen"));
                obj.setManv(rs.getString("manv").trim());
                obj.setTennv(rs.getNString("tennv"));
                obj.setTendn(rs.getString("tendn"));
                obj.setEmail(rs.getString("email"));
                obj.setSodt(rs.getString("sodt"));
                obj.setAvata(rs.getString("avata"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setProfile_embed(rs.getNString("profile_embed"));

            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getNhanVien " + e.getMessage());
        }
        return obj;
    }

    public static objNhanVien getNhanVienby_id(int id, String cn) {
        objNhanVien obj = new objNhanVien();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_nhanvien "
                    + " where idnv=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, id);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                obj.setIdnv(rs.getInt("idnv"));
                obj.setQuyen(rs.getInt("quyen"));
                obj.setManv(rs.getString("manv").trim());
                obj.setTennv(rs.getNString("tennv"));
                obj.setTendn(rs.getString("tendn"));
                obj.setEmail(rs.getString("email"));
                obj.setSodt(rs.getString("sodt"));
                obj.setAvata(rs.getString("avata"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setProfile_embed(rs.getNString("profile_embed"));
                obj.setQuanly(rs.getInt("quanly"));
                obj.setTelegramid(rs.getString("telegramid"));
                obj.setHovaten(rs.getNString("hovaten"));
                obj.setChucvu(rs.getNString("chucvu"));
                obj.setCccd(rs.getString("cccd"));
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getNhanVienby_id " + e.getMessage());
        }
        return obj;
    }

    public static ArrayList<objNhanVien> getListNhanVien(String manv, String cn) {
        ArrayList<objNhanVien> arr = new ArrayList<objNhanVien>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_nhanvien "
                    + " where manv != ? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, manv);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objNhanVien obj = new objNhanVien();
                obj.setIdnv(rs.getInt("idnv"));
                obj.setQuyen(rs.getInt("quyen"));
                obj.setManv(rs.getString("manv").trim());
                obj.setTennv(rs.getNString("tennv"));
                obj.setTendn(rs.getString("tendn"));
                obj.setEmail(rs.getString("email"));
                obj.setSodt(rs.getString("sodt"));
                obj.setAvata(rs.getString("avata"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setProfile_embed(rs.getNString("profile_embed"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getListNhanVien " + e.getMessage());
        }
        return arr;
    }

    public static ArrayList<objNhanVien> getALLNhanVien(String cn) {
        ArrayList<objNhanVien> arr = new ArrayList<objNhanVien>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_nhanvien "
                    + " where quyen !=1 ";
            PreparedStatement psm = conn.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objNhanVien obj = new objNhanVien();
                obj.setIdnv(rs.getInt("idnv"));
                obj.setQuyen(rs.getInt("quyen"));
                obj.setManv(rs.getString("manv").trim());
                obj.setTennv(rs.getNString("tennv"));
                obj.setTendn(rs.getString("tendn"));
                obj.setEmail(rs.getString("email"));
                obj.setSodt(rs.getString("sodt"));
                obj.setAvata(rs.getString("avata"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setProfile_embed(rs.getNString("profile_embed"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getALLNhanVien " + e.getMessage());
        }
        return arr;
    }

  




    public static ArrayList<objNhanVien> getNhanVienby_idhs(int idhs, String cn) {
        ArrayList<objNhanVien> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select a.* "
                    + "from tbl_nhanvien a, tbl_hoso b "
                    + "where (a.idnv= b.idnvgia or a.idnv=b.idnvtao or a.idnv=b.idnvks) "
                    + "and b.idhs=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idhs);

            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objNhanVien obj = new objNhanVien();
                obj.setIdnv(rs.getInt("idnv"));
                obj.setQuyen(rs.getInt("quyen"));
                obj.setManv(rs.getString("manv").trim());
                obj.setTennv(rs.getNString("tennv"));
                obj.setTendn(rs.getString("tendn"));
                obj.setEmail(rs.getString("email"));
                obj.setSodt(rs.getString("sodt"));
                obj.setAvata(rs.getString("avata"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setProfile_embed(rs.getNString("profile_embed"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getNhanVienby_idhs" + e.getMessage());
        }
        return arr;
    }
}
