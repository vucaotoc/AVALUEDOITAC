
package LogSystem;

import DATA.DBConnection;
import DATA.function;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class DALLogsystem {
    public static int themmoi_logsystem(objLogSytem obj, String cn) {
        int kq = 0;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            Connection conn = db.getConnection();
            String sql = "insert into tbl_log_system(userid,username,note) values(?,?,?)";
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, obj.getUserid());
            psm.setString(2, obj.getUsername());
            psm.setNString(3, obj.getNote());            
            kq = psm.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            function.Print_log("themmoi_logsystem " + ex.getMessage());
        }
        return kq;
    }
}
