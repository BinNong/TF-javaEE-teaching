package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/tf";
    public static final String USER = "root";
    public static final String PASSWORD = "123456";
    public static final ThreadLocal<Connection> connectionLock = new ThreadLocal<>();

    private DatabaseConnection() {
    }

    private static Connection rebuildConnection(){
        Connection conn = null;
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL, USER, PASSWORD);
        }catch(Exception e){
            e.printStackTrace();
        }

        return conn;
    }

    public static Connection getConnection(){
        Connection conn = connectionLock.get();
        if(conn == null){
            conn = rebuildConnection();
            connectionLock.set(conn);
        }

        return conn;
    }

    public static void closeConnection(){
        Connection conn = connectionLock.get();
        if(conn != null){
            try{
                conn.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        connectionLock.remove();
    }
}
