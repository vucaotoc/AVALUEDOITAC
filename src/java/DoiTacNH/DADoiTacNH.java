package DoiTacNH;

import DATA.DBConnection;
import DATA.DBSYScon;
import DATA.function;
import ThongBao.objThongBao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DADoiTacNH {

    private static objDoiTacNH getObjectbyRs(ResultSet rs) throws SQLException {
        objDoiTacNH obj = new objDoiTacNH();
        obj.setTendoitac(rs.getNString("tendoitac"));
        obj.setTencanbo(rs.getNString("tencanbo"));
        obj.setDiachi(rs.getNString("diachi"));
        obj.setDienthoai(rs.getString("dienthoai"));
        obj.setEmail(rs.getString("email"));
        obj.setTinhtrang(rs.getInt("tinhtrang"));
        obj.setDaxoa(rs.getInt("daxoa"));
        obj.setIddtnh(rs.getInt("iddtnh"));
        obj.setQuanly(rs.getInt("quanly"));
        obj.setAvatar(rs.getString("avata"));
        obj.setCumchucnang(rs.getNString("cumchucnang"));
        return obj;
    }

    public static int update_matkhau(String mkmoi, int iddtnh, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_doitacnh set matkhau=? where iddtnh=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, DATA.function.encrypt(mkmoi));
            psm.setInt(2, iddtnh);
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_matkhau " + ex.getMessage());
        }
        return kq;
    }

    public static int update_avatar(String ava, int iddtnh, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_doitacnh set avata=? where iddtnh=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, ava);
            psm.setInt(2, iddtnh);
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_avatar " + ex.getMessage());
        }
        return kq;
    }

    public static ArrayList<objDoiTacNH> getAllDoiTacNH(String cn) {
        ArrayList<objDoiTacNH> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select  * from tbl_doitacnh order by iddtnh desc";
            PreparedStatement psm = conn.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                arr.add(getObjectbyRs(rs));
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllDoiTacNH  " + e.getMessage());
        }

        return arr;
    }

    public static ArrayList<objDoiTacNH> getAllCanBoby_NH(String tendoitac, String cn) {
        ArrayList<objDoiTacNH> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select  * from tbl_doitacnh where tendoitac=? order by tencanbo ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setNString(1, tendoitac);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                arr.add(getObjectbyRs(rs));
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllCanBoby_NH  " + e.getMessage());
        }

        return arr;
    }

    public static ArrayList<objDoiTacNH> getAllTenDoiTacNH(String cn) {
        ArrayList<objDoiTacNH> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select distinct tendoitac  from tbl_doitacnh";
            PreparedStatement psm = conn.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objDoiTacNH obj = new objDoiTacNH();
                obj.setTendoitac(rs.getNString("tendoitac"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllDoiTacNH  " + e.getMessage());
        }

        return arr;
    }

    public static objDoiTacNH geDoiTacNH_truongNhom(int iduser, String cn) {
        objDoiTacNH obj = new objDoiTacNH();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select  a.* from tbl_doitacnh a where a.iddtnh in (select idmanager from tbl_doitacnh_qly where iduser=? )";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, iduser);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                obj = getObjectbyRs(rs);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("geDoiTacNHby_truongNhom  " + e.getMessage());
        }

        return obj;
    }

    public static objDoiTacNH geDoiTacNHby_id(int iddtnh, String cn) {
        objDoiTacNH obj = new objDoiTacNH();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select  * from tbl_doitacnh where iddtnh=? order by iddtnh desc";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, iddtnh);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                obj = getObjectbyRs(rs);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("geDoiTacNHby_id  " + e.getMessage());
        }

        return obj;
    }

    public static objDoiTacNH geDoiTacNHby_email(String email, String cn) {
        objDoiTacNH obj = new objDoiTacNH();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select  * from v_DoiTac_getALL where email=? order by iddtnh desc";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, email);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                obj.setTendoitac(rs.getNString("tendoitac"));
                obj.setTencanbo(rs.getNString("tencanbo"));
                obj.setDiachi(rs.getNString("diachi"));
                obj.setDienthoai(rs.getString("dienthoai"));
                obj.setEmail(rs.getString("email"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setDaxoa(rs.getInt("daxoa"));
                obj.setIddtnh(rs.getInt("iddtnh"));
                obj.setQuanly(rs.getInt("quanly"));
                obj.setAvatar(rs.getString("avata"));
                obj.setCumchucnang(rs.getNString("cumchucnang"));
                obj.setDbname(rs.getString("chinhanh"));
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("geDoiTacNHby_email  " + e.getMessage());
        }

        return obj;
    }

    public static objDoiTacNH check_login(String email, String pass) {
        objDoiTacNH obj = new objDoiTacNH();
        try {
            //System.out.println(u+p);
            DBSYScon db = new DBSYScon();
            Connection conn = db.getConnection();
            String sql = "select  * from v_DoiTac_getALL where email=? and matkhau=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, email);
            psm.setString(2, function.encrypt(pass));
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                obj.setTendoitac(rs.getNString("tendoitac"));
                obj.setTencanbo(rs.getNString("tencanbo"));
                obj.setDiachi(rs.getNString("diachi"));
                obj.setDienthoai(rs.getString("dienthoai"));
                obj.setEmail(rs.getString("email"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setDaxoa(rs.getInt("daxoa"));
                obj.setIddtnh(rs.getInt("iddtnh"));
                obj.setQuanly(rs.getInt("quanly"));
                obj.setAvatar(rs.getString("avata"));
                obj.setCumchucnang(rs.getNString("cumchucnang"));
                obj.setDbname(rs.getString("chinhanh"));
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("check_login  " + e.getMessage());
        }

        return obj;
    }

    public static objDoiTacNH check_login2(String email) {
        objDoiTacNH obj = new objDoiTacNH();
        try {
            //System.out.println(u+p);
            DBSYScon db = new DBSYScon();
            Connection conn = db.getConnection();
            String sql = "select  * from v_DoiTac_getALL where email=?  ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, email);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                obj.setTendoitac(rs.getNString("tendoitac"));
                obj.setTencanbo(rs.getNString("tencanbo"));
                obj.setDiachi(rs.getNString("diachi"));
                obj.setDienthoai(rs.getString("dienthoai"));
                obj.setEmail(rs.getString("email"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setDaxoa(rs.getInt("daxoa"));
                obj.setIddtnh(rs.getInt("iddtnh"));
                obj.setQuanly(rs.getInt("quanly"));
                obj.setAvatar(rs.getString("avata"));
                obj.setCumchucnang(rs.getNString("cumchucnang"));
                obj.setDbname(rs.getString("chinhanh"));
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("check_login 2 " + e.getMessage());
        }

        return obj;
    }

    public static boolean check_login_admin(String passadmin) {
        boolean kq = false;
        try {
            //System.out.println(u+p);
            DBSYScon db = new DBSYScon();
            Connection conn = db.getConnection();
            String sql = "select  * from tbl_config where name='admindoitac' and value=?  ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, function.encrypt(passadmin));
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                kq = true;
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("check_login_admin " + e.getMessage());
        }

        return kq;
    }
}
