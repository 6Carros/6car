package com.sixcar.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String URL = "jdbc:mariadb://localhost:3306/sixcar";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    public static Connection getConnection() throws SQLException {

        try {
            //  Fuerza la carga del driver MariaDB
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Driver MariaDB no encontrado en el proyecto", e);
        }

        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}