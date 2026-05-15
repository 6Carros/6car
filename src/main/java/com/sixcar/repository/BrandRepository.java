package com.sixcar.repository;

import com.sixcar.model.Brand;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BrandRepository {

    public List<Brand> findAll() {

        List<Brand> brands = new ArrayList<>();

        String sql = """
                SELECT id, name, country, founded_year, logo_url
                FROM brands
                """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {

                Brand brand = new Brand();

                brand.setId(rs.getInt("id"));
                brand.setName(rs.getString("name"));
                brand.setCountry(rs.getString("country"));
                brand.setFoundedYear(rs.getInt("founded_year"));
                brand.setLogoUrl(rs.getString("logo_url"));

                brands.add(brand);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return brands;
    }
}