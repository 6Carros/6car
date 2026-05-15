package com.sixcar.controller;

import com.sixcar.model.Brand;
import com.sixcar.repository.BrandRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/brands")
public class BrandServlet extends HttpServlet {

    private final BrandRepository brandRepository = new BrandRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            List<Brand> brands = brandRepository.findAll();

            req.setAttribute("brands", brands);

            req.getRequestDispatcher("/brands.jsp")
                    .forward(req, resp);

        } catch (Exception e) {

            e.printStackTrace();

            resp.getWriter().println("Error loading brands");
        }
    }
}