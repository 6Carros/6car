package com.sixcar.servlet;

import com.sixcar.model.Car;
import com.sixcar.repository.CarRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/cars")
public class CarServlet extends HttpServlet {

    private final CarRepository repository = new CarRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");

        try {

            // DETAIL
            if (idParam != null) {

                int id = Integer.parseInt(idParam);

                Car car = repository.findById(id);

                req.setAttribute("car", car);

                req.getRequestDispatcher("/car-detail.jsp")
                        .forward(req, resp);

                return;
            }

            // LIST
            req.setAttribute("cars", repository.findAll());

            req.getRequestDispatcher("/cars.jsp")
                    .forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(500, "Error processing cars");
        }
    }
}