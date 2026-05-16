package com.sixcar.repository;

import com.sixcar.model.Brand;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandRepository {

    public List<Brand> findAll() {

        List<Brand> brands = new ArrayList<>();

        String sql = """
                SELECT id, name, country, founded_year, logo_url, description
                FROM brands
                """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {

                Brand b = new Brand();

                b.setId(rs.getInt("id"));
                b.setName(rs.getString("name"));
                b.setCountry(rs.getString("country"));
                b.setFoundedYear(rs.getInt("founded_year"));
                b.setLogoUrl(rs.getString("logo_url"));
                b.setDescription(rs.getString("description"));

                brands.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return brands;
    }

    public Brand findById(int id) {

        String sql = """
                SELECT id, name, country, founded_year, logo_url, description
                FROM brands WHERE id=?
                """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {

                    Brand b = new Brand();

                    b.setId(rs.getInt("id"));
                    b.setName(rs.getString("name"));
                    b.setCountry(rs.getString("country"));
                    b.setFoundedYear(rs.getInt("founded_year"));
                    b.setLogoUrl(rs.getString("logo_url"));
                    b.setDescription(rs.getString("description"));

                    return b;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // ================= INSERT =================
    public void insert(Brand b) {

        String sql = """
                INSERT INTO brands (name, country, founded_year, logo_url, description)
                VALUES (?, ?, ?, ?, ?)
                """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, b.getName());
            stmt.setString(2, b.getCountry());
            stmt.setInt(3, b.getFoundedYear());
            stmt.setString(4, b.getLogoUrl());
            stmt.setString(5, b.getDescription());

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================= UPDATE =================
    public void update(Brand b) {

        String sql = """
                UPDATE brands
                SET name=?, country=?, founded_year=?, logo_url=?, description=?
                WHERE id=?
                """;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, b.getName());
            stmt.setString(2, b.getCountry());
            stmt.setInt(3, b.getFoundedYear());
            stmt.setString(4, b.getLogoUrl());
            stmt.setInt(6, b.getId());
            stmt.setString(5, b.getDescription());

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================= DELETE =================
    public void delete(int id) {

        String sql = "DELETE FROM brands WHERE id=?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}