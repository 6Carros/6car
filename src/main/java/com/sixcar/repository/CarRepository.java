package com.sixcar.repository;

import com.sixcar.model.Car;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarRepository {

    public List<Car> findAll() {

        List<Car> cars = new ArrayList<>();

        String sql = "SELECT * FROM cars";

        try (
                Connection connection = DatabaseConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Car car = new Car();

                car.setId(resultSet.getInt("id"));
                car.setModel(resultSet.getString("model"));
                car.setYear(resultSet.getInt("year"));

                cars.add(car);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cars;
    }
}