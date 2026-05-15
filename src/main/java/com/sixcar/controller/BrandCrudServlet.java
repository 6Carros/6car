package com.sixcar.servlet;

import com.sixcar.model.Brand;
import com.sixcar.repository.BrandRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/brands-crud")
public class BrandCrudServlet extends HttpServlet {

    private final BrandRepository brandRepo = new BrandRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        try {

            if (action == null || action.equals("list")) {
                req.setAttribute("brands", brandRepo.findAll());
                req.getRequestDispatcher("/brands.jsp").forward(req, resp);
                return;
            }

            if ("detail".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("brand", brandRepo.findById(id));
                req.getRequestDispatcher("/brand-detail.jsp").forward(req, resp);
                return;
            }

            if ("new".equals(action)) {
                req.getRequestDispatcher("/brand-form.jsp").forward(req, resp);
                return;
            }

            if ("edit".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("brand", brandRepo.findById(id));
                req.getRequestDispatcher("/brand-form.jsp").forward(req, resp);
                return;
            }

            if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                brandRepo.delete(id);
                resp.sendRedirect("brands-crud?action=list");
                return;
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(500, "Brands error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        try {

            if (action == null) {
                resp.sendRedirect("brands-crud?action=list");
                return;
            }

            // ================= CREATE =================
            if ("create".equals(action)) {

                Brand b = new Brand();

                b.setName(req.getParameter("name"));
                b.setCountry(req.getParameter("country"));
                b.setFoundedYear(Integer.parseInt(req.getParameter("foundedYear")));
                b.setLogoUrl(req.getParameter("logoUrl"));

                brandRepo.insert(b);

                resp.sendRedirect("brands-crud?action=list");
                return;
            }

            // ================= UPDATE =================
            if ("update".equals(action)) {

                Brand b = new Brand();

                b.setId(Integer.parseInt(req.getParameter("id")));
                b.setName(req.getParameter("name"));
                b.setCountry(req.getParameter("country"));
                b.setFoundedYear(Integer.parseInt(req.getParameter("foundedYear")));
                b.setLogoUrl(req.getParameter("logoUrl"));

                brandRepo.update(b);

                resp.sendRedirect("brands-crud?action=list");
                return;
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(500, "Brands POST error");
        }
    }
}