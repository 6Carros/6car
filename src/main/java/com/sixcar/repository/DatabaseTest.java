package com.sixcar.repository;

import java.sql.Connection;

public class DatabaseTest {

    public static void main(String[] args) {

        try (Connection conn = DatabaseConnection.getConnection()) {

            if (conn != null) {
                System.out.println("CONEXIÓN OK A SIXCAR DB");
            }

        } catch (Exception e) {
            System.out.println("ERROR DE CONEXIÓN");
            e.printStackTrace();
        }
    }
}