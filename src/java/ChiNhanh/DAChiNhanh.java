package ChiNhanh;

import DATA.DBSYScon;
import DATA.function;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAChiNhanh {

    public static ArrayList<objChiNhanh> getAllCN() {
        ArrayList<objChiNhanh> arr = new ArrayList<objChiNhanh>();
        try {
            //System.out.println(u+p);
            DBSYScon db = new DBSYScon();
            Connection conn = db.getConnection();
            String sql = "select * from sys_chinhanh ";
            PreparedStatement psm = conn.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objChiNhanh obj = new objChiNhanh();
                obj.setIdcn(rs.getInt("idcn"));
                obj.setMacn(rs.getString("macn"));
                obj.setTencn(rs.getNString("tencn"));
                obj.setDbname(rs.getString("dbname"));
                obj.setHoatdong(rs.getInt("hoatdong"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllCN " + e.getMessage());
        }
        return arr;
    }

    public static objChiNhanh getCN_byMa(String macn) {
        objChiNhanh obj = new objChiNhanh();
        try {
            //System.out.println(u+p);
            DBSYScon db = new DBSYScon();
            Connection conn = db.getConnection();
            String sql = "select * from sys_chinhanh where macn=?";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, macn);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {

                obj.setIdcn(rs.getInt("idcn"));
                obj.setMacn(rs.getString("macn"));
                obj.setTencn(rs.getNString("tencn"));
                obj.setDbname(rs.getString("dbname"));
                obj.setHoatdong(rs.getInt("hoatdong"));

            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllCN " + e.getMessage());
        }
        return obj;
    }
}
