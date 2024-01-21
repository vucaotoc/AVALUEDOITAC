package HoSo;

import DATA.DBConnection;
import DATA.function;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAHAPhapLy {

    public static ArrayList<objHAPhapLy> getAllHAbyHS(int idhs, String cn) {
        ArrayList<objHAPhapLy> arr = new ArrayList<objHAPhapLy>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_hoso_hinhanh where idhs=? and nhom='HAPL' ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idhs);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objHAPhapLy obj = new objHAPhapLy();
                obj.setIdha(rs.getInt("idha"));
                obj.setIdhs(idhs);
                obj.setMota(rs.getNString("mota"));
                obj.setNhom(rs.getNString("nhom"));
                obj.setTenha(rs.getNString("tenha"));
                obj.setTennvup(rs.getNString("tennvup"));
                obj.setLoaifile(rs.getString("loaifile"));
                obj.setPath(rs.getString("path"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllHAbyHS " + e.getMessage());
        }
        return arr;
    }

    public static ArrayList<objHAPhapLy> getAllHAby_TS(int idts_phaply, String cn) {
        ArrayList<objHAPhapLy> arr = new ArrayList<objHAPhapLy>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_hoso_hinhanh where idts=? and nhom='HAPL' ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idts_phaply);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objHAPhapLy obj = new objHAPhapLy();
                obj.setIdha(rs.getInt("idha"));
                obj.setIdts(idts_phaply);
                obj.setIdhs(rs.getInt("idhs"));
                obj.setMota(rs.getNString("mota"));
                obj.setNhom(rs.getNString("nhom"));
                obj.setTenha(rs.getNString("tenha"));
                obj.setTennvup(rs.getNString("tennvup"));
                obj.setLoaifile(rs.getString("loaifile"));
                obj.setPath(rs.getString("path"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllHAby_TS " + e.getMessage());
        }
        return arr;
    }

    public static ArrayList<objHAPhapLy> getAllHA_TS(int idhs, String cn) {
        ArrayList<objHAPhapLy> arr = new ArrayList<objHAPhapLy>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_hoso_hinhanh where idhs=? and nhom='HATS' ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idhs);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objHAPhapLy obj = new objHAPhapLy();
                obj.setIdha(rs.getInt("idha"));
                obj.setIdhs(idhs);
                obj.setMota(rs.getNString("mota"));
                obj.setNhom(rs.getNString("nhom"));
                obj.setTenha(rs.getNString("tenha"));
                obj.setTennvup(rs.getNString("tennvup"));
                obj.setLoaifile(rs.getString("loaifile"));
                obj.setPath(rs.getString("path"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllHA_TS " + e.getMessage());
        }
        return arr;
    }

    public static ArrayList<objHAPhapLy> getAllHSSC_in_HS(int idhs, String cn) {
        ArrayList<objHAPhapLy> arr = new ArrayList<objHAPhapLy>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_hoso_hinhanh where idhs=? and nhom='HSSC' ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idhs);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objHAPhapLy obj = new objHAPhapLy();
                obj.setIdha(rs.getInt("idha"));
                obj.setIdhs(idhs);
                obj.setMota(rs.getNString("mota"));
                obj.setNhom(rs.getNString("nhom"));
                obj.setTenha(rs.getNString("tenha"));
                obj.setTennvup(rs.getNString("tennvup"));
                obj.setLoaifile(rs.getString("loaifile"));
                obj.setPath(rs.getString("path"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllHSSC_in_HS " + e.getMessage());
        }
        return arr;
    }

    public static ArrayList<objHAPhapLy> getAllThuMuc_in_HS(int idhs, String cn) {
        ArrayList<objHAPhapLy> arr = new ArrayList<objHAPhapLy>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_hoso_hinhanh where idhs=? and nhom='TMR' ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idhs);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objHAPhapLy obj = new objHAPhapLy();
                obj.setIdha(rs.getInt("idha"));
                obj.setIdhs(idhs);
                obj.setMota(rs.getNString("mota"));
                obj.setNhom(rs.getNString("nhom"));
                obj.setTenha(rs.getNString("tenha"));
                obj.setTennvup(rs.getNString("tennvup"));
                obj.setLoaifile(rs.getString("loaifile"));
                obj.setPath(rs.getString("path"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllHA_TS " + e.getMessage());
        }
        return arr;
    }

    public static ArrayList<objHAPhapLy> getAllFiles_HS(int idhs, String cn) {
        ArrayList<objHAPhapLy> arr = new ArrayList<objHAPhapLy>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_hoso_hinhanh where idhs=? and nhom='FIHS' ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idhs);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objHAPhapLy obj = new objHAPhapLy();
                obj.setIdha(rs.getInt("idha"));
                obj.setIdhs(idhs);
                obj.setMota(rs.getNString("mota"));
                obj.setNhom(rs.getNString("nhom"));
                obj.setTenha(rs.getNString("tenha"));
                obj.setTennvup(rs.getNString("tennvup"));
                obj.setLoaifile(rs.getString("loaifile"));
                obj.setPath(rs.getString("path"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllHA_TS " + e.getMessage());
        }
        return arr;
    }

    public static objHAPhapLy getFiles_HS(int idha, String cn) {
        objHAPhapLy obj = new objHAPhapLy();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from tbl_hoso_hinhanh where idha=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idha);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {

                obj.setIdha(rs.getInt("idha"));
                obj.setIdhs(rs.getInt("idhs"));
                obj.setMota(rs.getNString("mota"));
                obj.setNhom(rs.getNString("nhom"));
                obj.setTenha(rs.getNString("tenha"));
                obj.setTennvup(rs.getNString("tennvup"));
                obj.setLoaifile(rs.getString("loaifile"));
                obj.setPath(rs.getString("path"));
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getFiles_HS " + e.getMessage());
        }
        return obj;
    }

    public static int themmoiHAPhaply(objHAPhapLy obj, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "insert into tbl_hoso_hinhanh(idhs,tenha,mota,nhom,tennvup,loaifile,path,idts) values(?,?,?,?,?,?,?,?) ;";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, obj.getIdhs());
            psm.setNString(2, obj.getTenha());
            psm.setNString(3, obj.getMota());
            psm.setNString(4, obj.getNhom());
            psm.setNString(5, obj.getTennvup());
            psm.setString(6, obj.getLoaifile());
            psm.setString(7, obj.getPath());
            psm.setInt(8, obj.getIdts());
            kq = psm.executeUpdate();

            conn.close();
        } catch (Exception ex) {
            function.Print_log("themmoiHAPhaply " + ex.getMessage());
        }
        return kq;
    }

    public static int delete_file(objHAPhapLy obj, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "delete from tbl_hoso_hinhanh where idha=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, obj.getIdha());
            kq = psm.executeUpdate();

            conn.close();
        } catch (Exception ex) {
            function.Print_log("delete_file " + ex.getMessage());
        }
        return kq;
    }
}
