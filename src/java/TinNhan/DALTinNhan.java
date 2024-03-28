package TinNhan;

import DATA.DBConnection;
import DATA.function;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DALTinNhan {

    public static ArrayList<objTinNhan> getAllTinNhanby_idhs(int idhs, String cn) {
        ArrayList<objTinNhan> arr = new ArrayList<objTinNhan>();
        try {
            //System.out.println(u+p);
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "select * from v_Tinnhan where idhs=? order by timegui asc ";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, idhs);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                objTinNhan obj = new objTinNhan();
                obj.setIdmess(rs.getInt("idmess"));
                obj.setIdnvsend(rs.getInt("idnvsend"));
                obj.setIdcbsend(rs.getInt("idcbsend"));
                obj.setIdhs(rs.getInt("idhs"));
                obj.setTinhtrang(rs.getInt("tinhtrang"));
                obj.setMess(rs.getNString("mess"));
                obj.setTennvSend(rs.getNString("tennv"));
                obj.setTencbSend(rs.getNString("tencanbo"));
                obj.setMahs(rs.getString("mahs"));
                obj.setTime(rs.getTimestamp("timegui"));
                obj.setAvataNV(rs.getString("avatanv"));
                
                arr.add(obj);
            }
            conn.close();
        } catch (Exception e) {
            function.Print_log("getAllTinNhanby_idhs " + e.getMessage());
        }
        return arr;
    }

    public static int themmoi_mess(objTinNhan obj, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "insert into tbl_tinnhanhs(idnvsend,idcbsend,idhs,mess) values(?,?,?,?)";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, obj.getIdnvsend());
            psm.setInt(2, obj.getIdcbsend());
            psm.setInt(3, obj.getIdhs());
            psm.setNString(4, obj.getMess());
            kq = psm.executeUpdate();

            conn.close();
        } catch (Exception ex) {
            function.Print_log("themmoi_mess " + ex.getMessage());
        }
        return kq;
    }
}
