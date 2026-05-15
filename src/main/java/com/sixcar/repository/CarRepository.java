package com.sixcar.repository;

import com.sixcar.model.Car;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarRepository {

    public List<Car> findAll() {

        List<Car> cars = new ArrayList<>();

        String sql = """
                SELECT id, brand_id, model, year, color, price_per_day, available, image_url
                FROM cars
                """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {

                Car c = new Car();

                c.setId(rs.getInt("id"));
                c.setBrandId(rs.getInt("brand_id"));
                c.setModel(rs.getString("model"));
                c.setYear(rs.getInt("year"));
                c.setColor(rs.getString("color"));
                c.setPricePerDay(rs.getDouble("price_per_day"));
                c.setAvailable(rs.getBoolean("available"));
                c.setImageUrl(rs.getString("image_url"));

                cars.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cars;
    }

    public Car findById(int id) {

        String sql = """
                SELECT id, brand_id, model, year, color, price_per_day, available, image_url
                FROM cars WHERE id = ?
                """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {

                    Car c = new Car();

                    c.setId(rs.getInt("id"));
                    c.setBrandId(rs.getInt("brand_id"));
                    c.setModel(rs.getString("model"));
                    c.setYear(rs.getInt("year"));
                    c.setColor(rs.getString("color"));
                    c.setPricePerDay(rs.getDouble("price_per_day"));
                    c.setAvailable(rs.getBoolean("available"));
                    c.setImageUrl(rs.getString("image_url"));

                    return c;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // ================= INSERT =================
    public void insert(Car c) {

        String sql = """
                INSERT INTO cars (brand_id, model, year, color, price_per_day, available, image_url)
                VALUES (?, ?, ?, ?, ?, ?, ?)
                """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, c.getBrandId());
            stmt.setString(2, c.getModel());
            stmt.setInt(3, c.getYear());
            stmt.setString(4, c.getColor());
            stmt.setDouble(5, c.getPricePerDay());
            stmt.setBoolean(6, c.isAvailable());
            stmt.setString(7, c.getImageUrl());

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================= UPDATE =================
    public void update(Car c) {

        String sql = """
                UPDATE cars
                SET brand_id=?, model=?, year=?, color=?, price_per_day=?, available=?, image_url=?
                WHERE id=?
                """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, c.getBrandId());
            stmt.setString(2, c.getModel());
            stmt.setInt(3, c.getYear());
            stmt.setString(4, c.getColor());
            stmt.setDouble(5, c.getPricePerDay());
            stmt.setBoolean(6, c.isAvailable());
            stmt.setString(7, c.getImageUrl());
            stmt.setInt(8, c.getId());

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================= DELETE =================
    public void delete(int id) {

        String sql = "DELETE FROM cars WHERE id=?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}