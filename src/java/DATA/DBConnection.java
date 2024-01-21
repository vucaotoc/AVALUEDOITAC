package DATA;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;
import org.json.XML;

public class DBConnection {

    private Connection connection;

    String host = "192.168.1.200";
    String db = "AVALUESYS";
    String u = "sa";
    String p = "tinvaohoahong.";

//    String host = "127.0.0.1";
//    String db = "AVALUESYS";
//    String u = "sa";
//    String p = "tinvaohoahong.";
    String str_con = "jdbc:sqlserver://" + host + ":1433;databaseName=" + db + ";user=" + u + ";password=" + p + ";useUnicode=true;characterEncoding=UTF-8";

    public DBConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    }

    public Connection getConnection() {
        try {
            str_con = "jdbc:sqlserver://" + host + ":1433;databaseName=" + db + ";user=" + u + ";password=" + p + ";useUnicode=true;characterEncoding=UTF-8";
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
            str_con = "jdbc:sqlserver://" + host + ":1433;databaseName=" + db + ";user=" + u + ";password=" + p + ";useUnicode=true;characterEncoding=UTF-8";
            this.connection = (Connection) DriverManager.getConnection(str_con);
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public interface ResultSetMapper<T> {

        T map(ResultSet resultSet) throws SQLException;
    }

    public static <T> List<T> truyvan_Select2(String cn, String sql, String functionName, ResultSetMapper<T> mapper, Object... parameters) {
        List<T> results = new ArrayList<>();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            conn = db.getConnection();
            statement = conn.prepareStatement(sql);
            DBConnection.setParameter(statement, parameters);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                results.add(mapper.map(resultSet));
            }
            return results;
        } catch (ClassNotFoundException | SQLException e) {
            function.Print_log(cn + " - " + functionName + ":" + e.getMessage());
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

    public static void setParameter(PreparedStatement statement, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                Object parameter = parameters[i];
                if (parameter instanceof Integer) {
                    statement.setInt(i + 1, (Integer) parameter);
                } else if (parameter instanceof Double) {
                    statement.setDouble(i + 1, (Double) parameter);
                } else if (parameter instanceof String) {
                    statement.setString(i + 1, (String) parameter);
                } else if (parameter instanceof Boolean) {
                    statement.setBoolean(i + 1, (Boolean) parameter);
                } else if (parameter instanceof Date) {
                    statement.setDate(i + 1, (Date) parameter);
                } else if (parameter instanceof Timestamp) {
                    statement.setTimestamp(i + 1, (Timestamp) parameter);
                } else {
                    statement.setObject(i + 1, parameter);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int truyvan_update(String cn, String sql, String functionName, Object... parameters) {
        int kq = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            DBConnection db = new DBConnection();
            db.setDb(cn);
            connection = db.getConnection();
            statement = connection.prepareStatement(sql);
            setParameter(statement, parameters);
            kq = statement.executeUpdate();
            connection.commit();
        } catch (Exception e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException e1) {
                    function.Print_log(cn + " - " + functionName + ":" + e.getMessage());
                }
            }
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e2) {
                function.Print_log(cn + " - " + functionName + ":" + e2.getMessage());
            }
        }
        return kq;
    }

    public static int truyvan_insert(String cn, String sql, String functionName, Object... parameters) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            int id = 0;
            DBConnection db = new DBConnection();
            db.setDb(cn);
            connection = db.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            setParameter(statement, parameters);
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }
            connection.commit();
            return id;
        } catch (Exception e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException e1) {
                    function.Print_log(cn + " - " + functionName + ":" + e.getMessage());
                }
            }
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e2) {
                function.Print_log(cn + " - " + functionName + ":" + e2.getMessage());
            }
        }
        return 0;
    }

    public static int truyvan_count(String cn, String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            int count = 0;
            DBConnection db = new DBConnection();
            db.setDb(cn);
            connection = db.getConnection();
            statement = connection.prepareStatement(sql);
            setParameter(statement, parameters);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt(1);
            }
            return count;
        } catch (Exception e) {
            return 0;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                return 0;
            }
        }
    }

    public static String truyvan_select_json(String cn, String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String result = "";
        try {
            int count = 0;
            DBConnection db = new DBConnection();
            db.setDb(cn);
            connection = db.getConnection();
            statement = connection.prepareStatement(sql);
            setParameter(statement, parameters);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                // Chuyển đổi XML thành JSON bằng Gson
                JSONObject jsonObject = XML.toJSONObject(resultSet.getNString(1));
                result = jsonObject.toString();

            }
            return result;
        } catch (Exception e) {
            return result;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                return result;
            }
        }
    }
}
