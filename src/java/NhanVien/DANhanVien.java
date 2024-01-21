package NhanVien;

import DATA.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DANhanVien {

    public static boolean check_login(String u, String p,String cn) {
        boolean kq = false;
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection(); db.setDb(cn);            
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

    public static objNhanVien getNhanVien(String tendn, String pass,String cn) {
        objNhanVien obj = new objNhanVien();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection(); db.setDb(cn);
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

    public static objNhanVien getNhanVien(String manv,String cn) {
        objNhanVien obj = new objNhanVien();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection(); db.setDb(cn);
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

    public static objNhanVien getNhanVienby_id(int id,String cn) {
        objNhanVien obj = new objNhanVien();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection(); db.setDb(cn);
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
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getNhanVienby_id " + e.getMessage());
        }
        return obj;
    }

    public static ArrayList<objNhanVien> getListNhanVien(String manv,String cn) {
        ArrayList<objNhanVien> arr = new ArrayList<objNhanVien>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection(); db.setDb(cn);
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
            DBConnection db = new DBConnection(); db.setDb(cn);
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

    public static String taomaNV(String cn) {
        String idnew = "";
        try {
            String sql = "select top 1 manv from tbl_nhanvien order by idnv desc";
            DBConnection db = new DBConnection(); db.setDb(cn);
            Connection conn = db.getConnection();
            PreparedStatement psm = conn.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                idnew = rs.getString("manv").trim();
            }
            if (idnew.length() == 0) {
                idnew = "0001";
            } else {
                int so = 0;
                so = function.convertStringToint(idnew);
                so++;
                while (true) {
                    switch ((so + "").length()) {
                        case 1:
                            idnew = "000" + so;
                            break;
                        case 2:
                            idnew = "00" + so;
                            break;
                        case 3:
                            idnew = "0" + so;
                            break;
                        case 4:
                            idnew = so + "";
                            break;
                        default:
                            break;
                    }
                    if (kiemtra_id(idnew,cn) == 1) {
                        so++;
                        idnew = "";
                    } else {
                        break;
                    }
                }

            }
        } catch (Exception e) {
            function.Print_log("tao ma nv" + e);
        }
        return idnew;
    }

    public static int kiemtra_id(String manv,String cn) {
        int kq = 0;
        String sql = "select * from tbl_nhanvien where manv=?";
        try {
            DBConnection db = new DBConnection(); db.setDb(cn);
            Connection conn = db.getConnection();
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, manv);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                kq = 1;
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("kiem tra id" + e);

        }
        return kq;
    }

    public static int kiemtra_tendn(String tendn,int idnv,String cn) {
        int kq = 0;
        String sql = "select * from tbl_nhanvien where tendn=? and idnv !=?";
        try {
            DBConnection db = new DBConnection(); db.setDb(cn);
            Connection conn = db.getConnection();
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, tendn);
            psm.setInt(2, idnv);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                kq = 1;
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("kiem tra tendn" + e);

        }
        return kq;
    }

    public static int themMoiNV(objNhanVien obj,String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection(); db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "insert into tbl_nhanvien(manv,tennv,tendn,matkhau,email,sodt,avata,quyen) values(?,?,?,?,?,?,?,?) ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, taomaNV(cn));
            psm.setNString(2, obj.getTennv());
            psm.setString(3, obj.getTendn());
            psm.setString(4, function.encrypt(obj.getMatkhau()));
            psm.setString(5, obj.getEmail());
            psm.setString(6, obj.getSodt());
            psm.setString(7, "avata_default.png");
            psm.setInt(8, obj.getQuyen());
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("themMoiNV " + ex.getMessage());
        }
        return kq;
    }

    public static int updateMatkhau(String value, int idnv,String cn) {
        int kq = 0;
        try {

            DBConnection db = new DBConnection(); db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_nhanvien set matkhau=? where idnv=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, function.encrypt(value));
            psm.setInt(2, idnv);
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("update matkhau  :" + ex.getMessage());
        }
        return kq;
    }

    public static int updateTinhTrang(int value, int idnv,String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection(); db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_nhanvien set tinhtrang=? where idnv=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, value);
            psm.setInt(2, idnv);
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("update tinhtrang  :" + ex.getMessage());
        }
        return kq;
    }

    public static int updateNhanVien(objNhanVien obj,String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection(); db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_nhanvien set tennv=?,email=?,sodt=?,tendn=?,avata=?,quyen=?,profile_embed=? where idnv=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setNString(1, obj.getTennv());
            psm.setString(2, obj.getEmail());
            psm.setString(3, obj.getSodt());
            psm.setString(4, obj.getTendn());
            psm.setString(5, obj.getAvata());
            psm.setInt(6, obj.getQuyen());
            psm.setString(7, obj.getProfile_embed());
            psm.setInt(8, obj.getIdnv());
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("updateNhanVien " + ex.getMessage());
        }
        return kq;
    }
    
    
    public static ArrayList<objNhanVien> getNhanVienby_idhs(int idhs,String cn) {
       ArrayList<objNhanVien> arr=new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection(); db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select a.* " +
                            "from tbl_nhanvien a, tbl_hoso b " +
                            "where (a.idnv= b.idnvgia or a.idnv=b.idnvtao or a.idnv=b.idnvks) " +
                            "and b.idhs=?";
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
