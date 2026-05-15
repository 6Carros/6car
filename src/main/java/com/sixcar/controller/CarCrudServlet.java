package com.sixcar.servlet;

import com.sixcar.model.Car;
import com.sixcar.repository.CarRepository;
import com.sixcar.repository.BrandRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/cars-crud")
public class CarCrudServlet extends HttpServlet {

    private final CarRepository carRepo = new CarRepository();
    private final BrandRepository brandRepo = new BrandRepository();

    // =========================
    // GET (LIST / DETAIL / NEW / EDIT / DELETE)
    // =========================
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        try {

            // ================= LIST =================
            if (action == null || action.equals("list")) {

                req.setAttribute("cars", carRepo.findAll());
                req.getRequestDispatcher("/cars.jsp").forward(req, resp);
                return;
            }

            // ================= DETAIL =================
            if ("detail".equals(action)) {

                int id = Integer.parseInt(req.getParameter("id"));

                req.setAttribute("car", carRepo.findById(id));

                req.getRequestDispatcher("/car-detail.jsp").forward(req, resp);
                return;
            }

            // ================= NEW =================
            if ("new".equals(action)) {

                req.setAttribute("brands", brandRepo.findAll());

                req.getRequestDispatcher("/car-form.jsp").forward(req, resp);
                return;
            }

            // ================= EDIT =================
            if ("edit".equals(action)) {

                int id = Integer.parseInt(req.getParameter("id"));

                req.setAttribute("car", carRepo.findById(id));
                req.setAttribute("brands", brandRepo.findAll());

                req.getRequestDispatcher("/car-form.jsp").forward(req, resp);
                return;
            }

            // ================= DELETE =================
            if ("delete".equals(action)) {

                int id = Integer.parseInt(req.getParameter("id"));

                carRepo.delete(id);

                resp.sendRedirect("cars-crud?action=list");
                return;
            }

            // fallback
            resp.sendRedirect("cars-crud?action=list");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(500, "Error processing cars (GET)");
        }
    }

    // =========================
    // POST (CREATE / UPDATE)
    // =========================
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        try {

            // ================= CREATE =================
            if ("create".equals(action)) {

                Car c = new Car();

                c.setModel(req.getParameter("model"));
                c.setBrandId(Integer.parseInt(req.getParameter("brandId")));
                c.setYear(Integer.parseInt(req.getParameter("year")));
                c.setColor(req.getParameter("color"));
                c.setPricePerDay(Double.parseDouble(req.getParameter("pricePerDay")));
                c.setAvailable(req.getParameter("available") != null);
                c.setImageUrl(req.getParameter("imageUrl"));

                carRepo.insert(c);

                resp.sendRedirect("cars-crud?action=list");
                return;
            }

            // ================= UPDATE =================
            if ("update".equals(action)) {

                Car c = new Car();

                c.setId(Integer.parseInt(req.getParameter("id")));
                c.setModel(req.getParameter("model"));
                c.setBrandId(Integer.parseInt(req.getParameter("brandId")));
                c.setYear(Integer.parseInt(req.getParameter("year")));
                c.setColor(req.getParameter("color"));
                c.setPricePerDay(Double.parseDouble(req.getParameter("pricePerDay")));
                c.setAvailable(req.getParameter("available") != null);
                c.setImageUrl(req.getParameter("imageUrl"));

                carRepo.update(c);

                resp.sendRedirect("cars-crud?action=list");
                return;
            }

            // fallback
            resp.sendRedirect("cars-crud?action=list");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(500, "Error processing cars (POST)");
        }
    }
}