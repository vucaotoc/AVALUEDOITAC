package HoSo;

import DATA.DBConnection;
import DATA.function;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DALHoSoTK {

    public static ArrayList<objHoSoTK> getCountTK(String cn) {
        ArrayList<objHoSoTK> arr = new ArrayList<objHoSoTK>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection(); db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select count(*) as [tonghs], "
                    + "(select count(*) from v_HoSo where tinhtrang between 0 and 8) as [dangthuchien], "
                    + "(select count(*) from v_HoSo where tinhtrang=9) as [dahoanthanh], "
                    + "(select count(*) from v_HoSo where tinhtrang=10) as [dahuy] "
                    + "from v_HoSo";
            PreparedStatement psm = conn.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objHoSoTK obj = new objHoSoTK();
                obj.setTonghs(rs.getInt("tonghs"));
                obj.setDangthuchien(rs.getInt("dangthuchien"));
                obj.setHoanthanh(rs.getInt("dahoanthanh"));
                obj.setDahuy(rs.getInt("dahuy"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getCountTK " + e.getMessage());
        }
        return arr;
    }
     public static ArrayList<objHoSoTK> getCountTKCN(int manv,String cn) {
        ArrayList<objHoSoTK> arr = new ArrayList<objHoSoTK>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection(); db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "declare @idnv int " +
                        "set @idnv=? " +
                        "select  top 1  (select count(*) from v_HoSo where idnvks=@idnv and tinhtrang=2) as [dangkhaosat], " +
                        "(select count(*) from v_HoSo where idnvgia=@idnv and tinhtrang=4) as [dangbaogia], " +
                        "(select count(*) from v_HoSo where idnvgia=@idnv and tinhtrang=5) as [dabaogia],  " +
                        "(select count(*) from v_HoSo where idnvgia=@idnv and (tinhtrang=7 or tinhtrang=9)) as [chungthu]  "
                        + "from v_HoSo";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, manv);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objHoSoTK obj = new objHoSoTK();
               
                obj.setDangkhaosat(rs.getInt("dangkhaosat"));
                obj.setDangbaogia(rs.getInt("dangbaogia"));
                obj.setDabaogia(rs.getInt("dabaogia"));
                 obj.setChungthu(rs.getInt("chungthu"));
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getCountTKCN " + e.getMessage());
        }
        return arr;
    }
}
