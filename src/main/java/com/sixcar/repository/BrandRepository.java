package com.sixcar.repository;

import com.sixcar.model.Brand;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandRepository {

    public List<Brand> findAll() {

        List<Brand> brands = new ArrayList<>();

        String sql = "SELECT * FROM brands";

        try (
                Connection connection = DatabaseConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Brand brand = new Brand();

                brand.setId(resultSet.getInt("id"));
                brand.setName(resultSet.getString("name"));
                brand.setCountry(resultSet.getString("country"));
                brand.setFoundedYear(resultSet.getInt("founded_year"));
                brand.setLogoUrl(resultSet.getString("logo_url"));

                brands.add(brand);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return brands;
    }
}