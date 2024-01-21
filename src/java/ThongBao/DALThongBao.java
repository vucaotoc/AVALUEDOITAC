package ThongBao;

import DATA.DBConnection;
import DATA.function;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DALThongBao {

    public static int themmoiTB(objThongBao obj, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "insert into tbl_thongbao(nhomnv,idnvnhan,tennvnhan,thongbao,daxem,loai,idloai,nhomtb) values(?,?,?,?,?,?,?,?) ";

            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, obj.getNhomnv());
            psm.setInt(2, obj.getIdnvnhan());
            psm.setNString(3, obj.getTennvnhan());
            psm.setNString(4, obj.getThongbao());
            psm.setInt(5, obj.getDaxem());
            psm.setString(6, obj.getLoai());
            psm.setInt(7, obj.getIdloai());
            psm.setInt(8, obj.getNhomtb());
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("themmoiTB " + ex.getMessage());
        }
        return kq;
    }

    public static int update_daxem(int idtb, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "update tbl_thongbao set daxem=1 where idtb=?";

            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idtb);
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_daxem " + ex.getMessage());
        }
        return kq;
    }

    public static objShowTB count_new_tn(String tencb, String cn) {
        objShowTB obj = new objShowTB();
        try {

            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "declare @tencb varchar(200) "
                    + "set @tencb=? "
                    + "select count(*) [tinnhan]  from tbl_thongbao where nhomtb=6 and  tennvnhan=@tencb and daxem=0 ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, tencb);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                obj.setTinnhan(rs.getInt("tinnhan"));
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("count_new_tn  " + e.getMessage());
        }

        return obj;
    }

    public static ArrayList<objThongBao> getlistTinNhanby_tencb(String tencb, String cn) {
        ArrayList<objThongBao> arr = new ArrayList<>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select  * from tbl_thongbao where nhomtb=6 and tennvnhan=? and daxem=0 order by daxem asc,idtb desc";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, tencb);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objThongBao obj = new objThongBao();
                obj.setIdtb(rs.getInt("idtb"));
                obj.setNhomnv(rs.getInt("nhomnv"));
                obj.setIdnvnhan(rs.getInt("idnvnhan"));
                obj.setTennvnhan(rs.getNString("tennvnhan"));
                obj.setThongbao(rs.getNString("thongbao"));
                obj.setNgaylap(rs.getTimestamp("ngaylap"));
                obj.setDaxem(rs.getInt("daxem"));
                obj.setLoai(rs.getString("loai"));
                obj.setIdloai(rs.getInt("idloai"));
                obj.setNhomtb(rs.getInt("nhomtb"));                
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getlistTinNhanby_tencb  " + e.getMessage());
        }

        return arr;
    }
}
