package com.transport.dao;

import java.sql.*;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Properties;

public class DBConnection {
    private static final Properties CONFIG = loadConfig();
    private static Properties loadConfig() {
        Properties config = new Properties();
        Path file = Path.of("config", "database.properties");
        if (Files.exists(file)) {
            try (InputStream stream = Files.newInputStream(file)) { config.load(stream); }
            catch (java.io.IOException e) { throw new IllegalStateException("Configuration MySQL illisible", e); }
        }
        return config;
    }
    private static String setting(String env, String key, String fallback) {
        String value = System.getenv(env);
        return value != null ? value : CONFIG.getProperty(key, fallback);
    }
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
            setting("TRANSPORT_DB_URL", "db.url", "jdbc:mysql://localhost:3306/transport_demo"),
            setting("TRANSPORT_DB_USER", "db.user", "root"),
            setting("TRANSPORT_DB_PASSWORD", "db.password", ""));
    }
    
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public static void closeStatement(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public static void closeResultSet(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}