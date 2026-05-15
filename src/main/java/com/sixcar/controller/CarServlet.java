package com.sixcar.controller;

import com.sixcar.model.Car;
import com.sixcar.repository.CarRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/cars")
public class CarServlet extends HttpServlet {

    private final CarRepository carRepository = new CarRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");

        try {

            // =========================
            // DETALLE DE COCHE
            // =========================
            if (idParam != null) {

                int id = Integer.parseInt(idParam);

                Car car = carRepository.findById(id);

                req.setAttribute("car", car);

                req.getRequestDispatcher("/car-detail.jsp")
                        .forward(req, resp);

                return;
            }

            // =========================
            // LISTADO DE COCHES
            // =========================
            List<Car> cars = carRepository.findAll();

            req.setAttribute("cars", cars);

            req.getRequestDispatcher("/cars.jsp")
                    .forward(req, resp);

        } catch (Exception e) {

            e.printStackTrace();

            resp.setContentType("text/plain");
            resp.getWriter().println("Error processing cars");
        }
    }
}