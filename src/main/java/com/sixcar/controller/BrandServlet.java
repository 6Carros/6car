package com.sixcar.servlet;

import com.sixcar.model.Brand;
import com.sixcar.repository.BrandRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/brands")
public class BrandServlet extends HttpServlet {

    private final BrandRepository repository = new BrandRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");

        try {

            // =========================
            // DETAIL
            // =========================
            if (idParam != null) {

                int id = Integer.parseInt(idParam);

                Brand brand = repository.findById(id);

                req.setAttribute("brand", brand);

                req.getRequestDispatcher("/brand-detail.jsp")
                        .forward(req, resp);

                return;
            }

            // =========================
            // LIST
            // =========================
            req.setAttribute("brands", repository.findAll());

            req.getRequestDispatcher("/brands.jsp")
                    .forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(500, "Error processing brands");
        }
    }
}