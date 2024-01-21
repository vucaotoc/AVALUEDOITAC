package DATA;

import java.sql.*;
import java.sql.SQLException;

public class DBSYScon {

    private Connection connection; 
   String host = "192.168.1.200";
   String db = "AVALUESYS";
   String u="sa";
   String p="tinvaohoahong.";
   
//   String host = "127.0.0.1";
//   String db = "AVALUESYS";
//   String u="sa";
//   String p="tinvaohoahong.";
   String str_con = "jdbc:sqlserver://" + host + ":1433;databaseName=" + db + ";user=" + u + ";password=" + p + ";useUnicode=true;characterEncoding=UTF-8";

    public DBSYScon() throws SQLException, ClassNotFoundException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    }

    public Connection getConnection() {
        try {
            if (connection == null) {
                //System.out.print("chua co ket noi");
                connection = (Connection) DriverManager.getConnection(str_con);
            } else {
               // System.out.print("da co ket noi");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return connection;
    }

    public void closeconnection() {
        try {
            this.connection = (Connection) DriverManager.getConnection(str_con);
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
