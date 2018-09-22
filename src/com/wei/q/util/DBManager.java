package com.wei.q.util;

import java.sql.*;

public class DBManager {
    public static Connection getConnection() throws SQLException {
        return getConnection("root", "880516");
    }

    private static Connection getConnection(String username, String password) throws SQLException {
        DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/databaseWeb?useSSL=false&serverTimezone=GMT%2B8", username, password);
        return conn;
    }

    public static void setParams(PreparedStatement preStmt, Object... params) throws SQLException {
        if (params == null || params.length == 0) {
            return;
        }
        for (int i = 1; i <= params.length; i++) {
            Object param = params[i - 1];
            preStmt.setObject(i, param);
        }
    }

    public static int executeUpdate(String sql) throws SQLException {
        return executeUpdate(sql, new Object[]{});
    }

    public static int executeUpdate(String sql, Object... params) throws SQLException {
        Connection conn = null;
        PreparedStatement preStmt = null;
        try {
            conn = getConnection();
            preStmt = conn.prepareStatement(sql);
            setParams(preStmt, params);
            return preStmt.executeUpdate();
        } finally {
            if (preStmt != null) {
                preStmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    /**
     * 获取总行数
     *
     * @param sql
     * @return
     */
    public static int getCount(String sql) throws SQLException {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next()){
                return rs.getInt(1);
            }
            return 0;
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
}
