package TinraoBDS;

import DATA.DBSYScon;
import DATA.function;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class daTinraoBDS {

    public static int themmoi_tinrao(objTinraoBDS obj ) {
        int kq = 0;
        try {
             DBSYScon db = new  DBSYScon();            
            Connection conn = db.getConnection();
            String sql = "insert into tbl_tinraobds(ngaydang,ngaydong,loaihinhbds,diachibds,tinhtp,quanhuyen,phuongxa,toadomap,dientich,giaban,"
                    + " hinhanh,mota,tinhtrang,sodienthoai,nguoilienhe,idnvdang,chinhanh) "
                    + " values(getdate(),getdate(),?,?,?,?,?,?,?,?,?,?,0,?,?,?,?)";
            PreparedStatement psm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            psm.setNString(1, obj.getLoaihinhbds());
            psm.setNString(2, obj.getDiachibds());
            psm.setNString(3, obj.getTinhtp());
            psm.setNString(4, obj.getQuanhuyen());
            psm.setNString(5, obj.getPhuongxa());
            psm.setNString(6, obj.getToadomap());
            psm.setDouble(7, obj.getDientich());
            psm.setInt(8, obj.getGiaban());
            psm.setString(9, obj.getHinhanh());
            psm.setNString(10, obj.getMota());
            psm.setString(11, obj.getSodienthoai());
            psm.setNString(12, obj.getNguoilienhe());
            psm.setInt(13, obj.getIdnvdang());
            psm.setString(14, obj.getChinhanh());
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
            function.Print_log("themmoi_tinrao " + ex.getMessage());
        }
        return kq;
    }

    public static int update_tinrao(objTinraoBDS obj ) {
        int kq = 0;
        try {
             DBSYScon db = new  DBSYScon();
            
            Connection conn = db.getConnection();
            String sql = "update tbl_tinraobds set loaihinhbds=?,diachibds=?,tinhtp=?,quanhuyen=?,phuongxa=?,toadomap=?,"
                    + " dientich=?,giaban=?,mota=?,sodienthoai=?,nguoilienhe=? where idtin=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setNString(1, obj.getLoaihinhbds());
            psm.setNString(2, obj.getDiachibds());
            psm.setNString(3, obj.getTinhtp());
            psm.setNString(4, obj.getQuanhuyen());
            psm.setNString(5, obj.getPhuongxa());
            psm.setNString(6, obj.getToadomap());
            psm.setDouble(7, obj.getDientich());
            psm.setInt(8, obj.getGiaban());
            psm.setNString(9, obj.getMota());
            psm.setString(10, obj.getSodienthoai());
            psm.setNString(11, obj.getNguoilienhe());
            psm.setInt(12, obj.getIdtin());
            kq = psm.executeUpdate();

            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_tinrao " + ex.getMessage());
        }
        return kq;
    }

    public static int update_Hinhanh(objTinraoBDS obj ) {
        int kq = 0;
        try {
             DBSYScon db = new  DBSYScon();
            
            Connection conn = db.getConnection();
            String sql = "update tbl_tinraobds set hinhanh=? where idtin=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, obj.getHinhanh());
            psm.setInt(2, obj.getIdtin());
            kq = psm.executeUpdate();

            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_Hinhanh " + ex.getMessage());
        }
        return kq;
    }

    public static int update_tinhtrang(int tinhtrang, int idtin ) {
        int kq = 0;
        try {
             DBSYScon db = new  DBSYScon();
            
            Connection conn = db.getConnection();
            String sql = "update tbl_tinraobds set tinhtrang=? where idtin=? ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, tinhtrang);
            psm.setInt(2, idtin);
            kq = psm.executeUpdate();

            conn.close();
        } catch (Exception ex) {
            function.Print_log("update_tinhtrang " + ex.getMessage());
        }
        return kq;
    }

    public static objTinraoBDS getTinby_idtin(int idtin ) {
        objTinraoBDS obj = new objTinraoBDS();
        try {
            //System.out.println(u+p);
             DBSYScon db = new  DBSYScon();
            
            Connection conn = db.getConnection();
            String sql = "select * from tbl_tinraobds where idtin=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idtin);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                obj.setIdtin(rs.getInt("idtin"));
                obj.setDiachibds(rs.getNString("diachibds"));
                obj.setTinhtp(rs.getNString("tinhtp"));
                obj.setQuanhuyen(rs.getNString("quanhuyen"));
                obj.setPhuongxa(rs.getNString("phuongxa"));
                obj.setLoaihinhbds(rs.getNString("loaihinhbds"));
                obj.setDientich(rs.getDouble("dientich"));
                obj.setGiaban(rs.getInt("giaban"));
                obj.setSodienthoai(rs.getString("sodienthoai"));
                obj.setNguoilienhe(rs.getNString("nguoilienhe"));
                obj.setToadomap(rs.getString("toadomap"));
                obj.setHinhanh(rs.getString("hinhanh"));
                obj.setMota(rs.getNString("mota"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setNgaydang(rs.getTimestamp("ngaydang"));
                obj.setNgaydong(rs.getTimestamp("ngaydong"));
                obj.setIdnvdang(rs.getInt("idnvdang"));
                obj.setChinhanh(rs.getString("chinhanh"));
            }
            
            conn.close();
        } catch (Exception e) {
            function.Print_log("getTinby_idtin " + e.getMessage());
        }
        return obj;
    }

    public static ArrayList<objTinraoBDS> getListTinrao() {
        ArrayList<objTinraoBDS> arr = new ArrayList<objTinraoBDS>();
        try {
            //System.out.println(u+p);
             DBSYScon db = new  DBSYScon();
            
            Connection conn = db.getConnection();
            String sql = "select * from tbl_tinraobds where tinhtrang=0 order by idtin desc,tinhtrang asc";
            PreparedStatement psm = conn.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objTinraoBDS obj = new objTinraoBDS();
                obj.setIdtin(rs.getInt("idtin"));
                obj.setDiachibds(rs.getNString("diachibds"));
                obj.setTinhtp(rs.getNString("tinhtp"));
                obj.setQuanhuyen(rs.getNString("quanhuyen"));
                obj.setPhuongxa(rs.getNString("phuongxa"));
                obj.setLoaihinhbds(rs.getNString("loaihinhbds"));
                obj.setDientich(rs.getDouble("dientich"));
                obj.setGiaban(rs.getInt("giaban"));
                obj.setSodienthoai(rs.getString("sodienthoai"));
                obj.setNguoilienhe(rs.getNString("nguoilienhe"));
                obj.setToadomap(rs.getString("toadomap"));
                obj.setHinhanh(rs.getString("hinhanh"));
                obj.setMota(rs.getNString("mota"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setNgaydang(rs.getTimestamp("ngaydang"));
                obj.setNgaydong(rs.getTimestamp("ngaydong"));
                obj.setIdnvdang(rs.getInt("idnvdang"));
                obj.setChinhanh(rs.getString("chinhanh"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getALLProvince " + e.getMessage());
        }
        return arr;
    }
    
    public static ArrayList<objTinraoBDS> getListTinraoby_idnv(int idnvdang,String chinhanh) {
        ArrayList<objTinraoBDS> arr = new ArrayList<objTinraoBDS>();
        try {
            //System.out.println(u+p);
             DBSYScon db = new  DBSYScon();
            
            Connection conn = db.getConnection();
            String sql = "select * from tbl_tinraobds where tinhtrang<3 and idnvdang=? and chinhanh=? order by idtin desc,tinhtrang asc";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idnvdang);
            psm.setString(2, chinhanh);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objTinraoBDS obj = new objTinraoBDS();
                obj.setIdtin(rs.getInt("idtin"));
                obj.setDiachibds(rs.getNString("diachibds"));
                obj.setTinhtp(rs.getNString("tinhtp"));
                obj.setQuanhuyen(rs.getNString("quanhuyen"));
                obj.setPhuongxa(rs.getNString("phuongxa"));
                obj.setLoaihinhbds(rs.getNString("loaihinhbds"));
                obj.setDientich(rs.getDouble("dientich"));
                obj.setGiaban(rs.getInt("giaban"));
                obj.setSodienthoai(rs.getString("sodienthoai"));
                obj.setNguoilienhe(rs.getNString("nguoilienhe"));
                obj.setToadomap(rs.getString("toadomap"));
                obj.setHinhanh(rs.getString("hinhanh"));
                obj.setMota(rs.getNString("mota"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setNgaydang(rs.getTimestamp("ngaydang"));
                obj.setNgaydong(rs.getTimestamp("ngaydong"));
                obj.setIdnvdang(rs.getInt("idnvdang"));
                obj.setChinhanh(rs.getString("chinhanh"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getALLProvince " + e.getMessage());
        }
        return arr;
    }
}
