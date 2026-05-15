package com.sixcar.repository;

import com.sixcar.model.Car;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CarRepository {

    // =========================
    // FIND ALL (JOIN OK)
    // =========================
    public List<Car> findAll() {

        List<Car> cars = new ArrayList<>();

        String sql = """
            SELECT 
                c.id,
                c.brand_id,
                c.model,
                c.year,
                c.color,
                c.price_per_day,
                c.available,
                c.image_url,
                b.name AS brand_name
            FROM cars c
            JOIN brands b ON c.brand_id = b.id
        """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {

                Car car = new Car();

                car.setId(rs.getInt("id"));
                car.setBrandId(rs.getInt("brand_id"));
                car.setBrandName(rs.getString("brand_name"));
                car.setModel(rs.getString("model"));
                car.setYear(rs.getInt("year"));
                car.setColor(rs.getString("color"));
                car.setPricePerDay(rs.getDouble("price_per_day"));
                car.setAvailable(rs.getBoolean("available"));
                car.setImageUrl(rs.getString("image_url"));

                cars.add(car);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cars;
    }

    // =========================
    // FIND BY ID (JOIN OK)
    // =========================
    public Car findById(int id) {

        String sql = """
            SELECT 
                c.id,
                c.brand_id,
                c.model,
                c.year,
                c.color,
                c.price_per_day,
                c.available,
                c.image_url,
                b.name AS brand_name
            FROM cars c
            JOIN brands b ON c.brand_id = b.id
            WHERE c.id = ?
        """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {

                    Car car = new Car();

                    car.setId(rs.getInt("id"));
                    car.setBrandId(rs.getInt("brand_id"));
                    car.setBrandName(rs.getString("brand_name"));
                    car.setModel(rs.getString("model"));
                    car.setYear(rs.getInt("year"));
                    car.setColor(rs.getString("color"));
                    car.setPricePerDay(rs.getDouble("price_per_day"));
                    car.setAvailable(rs.getBoolean("available"));
                    car.setImageUrl(rs.getString("image_url"));

                    return car;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // =========================
    // INSERT
    // =========================
    public void insert(Car car) {

        String sql = """
            INSERT INTO cars (brand_id, model, year, color, price_per_day, available, image_url)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, car.getBrandId());
            stmt.setString(2, car.getModel());
            stmt.setInt(3, car.getYear());
            stmt.setString(4, car.getColor());
            stmt.setDouble(5, car.getPricePerDay());
            stmt.setBoolean(6, car.isAvailable());
            stmt.setString(7, car.getImageUrl());

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // =========================
    // UPDATE
    // =========================
    public void update(Car car) {

        String sql = """
            UPDATE cars
            SET brand_id=?, model=?, year=?, color=?, price_per_day=?, available=?, image_url=?
            WHERE id=?
        """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, car.getBrandId());
            stmt.setString(2, car.getModel());
            stmt.setInt(3, car.getYear());
            stmt.setString(4, car.getColor());
            stmt.setDouble(5, car.getPricePerDay());
            stmt.setBoolean(6, car.isAvailable());
            stmt.setString(7, car.getImageUrl());
            stmt.setInt(8, car.getId());

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // =========================
    // DELETE
    // =========================
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