package dubaogia;

import DATA.DBSYScon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class DADubaogia {

    public static ArrayList<objDubaogia> truyvan_Select(String sql, String functionName, Object... parameters) {
        ArrayList<objDubaogia> results = new ArrayList<>();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            DBSYScon db = new DBSYScon();
            conn = db.getConnection();
            statement = conn.prepareStatement(sql);
            setParameter(statement, parameters);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                results.add(getObjformRS(resultSet));
            }
            return results;
        } catch (Exception e) {

            return null;
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                return null;
            }
        }
    }

    private static void setParameter(PreparedStatement statement, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                Object parameter = parameters[i];
                int index = i + 1;
                if (parameter instanceof Integer) {
                    statement.setInt(index, (Integer) parameter);
                } else if (parameter instanceof String) {
                    statement.setNString(index, (String) "%" + parameter + "%");
                } else if (parameter instanceof Timestamp) {
                    statement.setTimestamp(index, (Timestamp) parameter);
                } else if (parameter instanceof Long) {
                    statement.setLong(index, (Long) parameter);
                } else if (parameter instanceof Double) {
                    statement.setDouble(index, (Double) parameter);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static objDubaogia getObjformRS(ResultSet rs) {
        try {
            objDubaogia obj = new objDubaogia();
            obj.setId(rs.getInt("id"));
            obj.setFulldiachi(rs.getNString("fulldiachi"));
            obj.setDuong(rs.getNString("duong"));
            obj.setQuanhuyen(rs.getNString("quanhuyen"));
            obj.setTinhtp(rs.getNString("tinhtp"));
            obj.setDongia(rs.getDouble("dongia"));
            obj.setFulldate(rs.getString("fulldate"));
            obj.setNam(rs.getInt("nam"));
            obj.setThang(rs.getInt("thang"));
            obj.setLng(rs.getFloat("lng"));
            obj.setLon(rs.getFloat("lon"));
            return obj;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static ArrayList<objDubaogia> getgia_diachi(String diachi) {
        String sql = " declare @key nvarchar(200) "
                + " set @key=? "
                + " SELECT *  from tbl_diadiem_gia where fulldiachi like @key ";
        ArrayList<objDubaogia> lst = truyvan_Select(sql, "getgia_diachi", diachi);
        return lst;
    }

    public static List<objDubaogia> getDiachi_ajax(String diachi) {
        List<objDubaogia> results = new ArrayList<>();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            DBSYScon db = new DBSYScon();
            conn = db.getConnection();
            String sql = " declare @key nvarchar(200) "
                    + " set @key=? "
                    + " SELECT distinct fulldiachi  from tbl_diadiem_gia where fulldiachi like @key ";
            statement = conn.prepareStatement(sql);
            statement.setNString(1,  "%"+diachi + "%");
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                objDubaogia obj = new objDubaogia();
                obj.setFulldiachi(resultSet.getNString("fulldiachi"));
                results.add(obj);
            }
            return results;
        } catch (Exception e) {
            DATA.function.Print_log("getDiachi_ajax " + e.getMessage());
            return null;
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                return null;
            }
        }
    }
}
