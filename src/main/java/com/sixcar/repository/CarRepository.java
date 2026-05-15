package com.sixcar.repository;

import com.sixcar.model.Car;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setBrandId(rs.getInt("brand_id"));
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

    public Car findById(int id) {

        String sql = """
                SELECT id, brand_id, model, year, color, price_per_day, available, image_url
                FROM cars
                WHERE id = ?
                """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {
                    Car car = new Car();

                    car.setId(rs.getInt("id"));
                    car.setBrandId(rs.getInt("brand_id"));
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
}