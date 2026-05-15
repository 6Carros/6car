<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sixcar.model.Car" %>

<%
    Car car = (Car) request.getAttribute("car");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= car.getModel() %> - 6Car</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="css/styles.css">

</head>

<body>

<!-- ================= NAVBAR ================= -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <div class="container">

        <a class="navbar-brand" href="index.jsp">
            6Car
        </a>

        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link" href="cars">
                        Cars
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="brands">
                        Brands
                    </a>
                </li>

            </ul>

        </div>

    </div>

</nav>

<!-- ================= DETAIL ================= -->
<section class="cars-section py-5">

    <div class="container">

        <!-- BACK BUTTON -->
        <a href="cars" class="btn btn-light mb-4">
            ← Back to cars
        </a>

        <div class="row justify-content-center">

            <div class="col-md-8">

                <div class="card bg-dark text-white h-100 border-light">

                    <!-- IMAGE -->
                    <img src="<%= car.getImageUrl() %>"
                         class="card-img-top"
                         alt="<%= car.getModel() %>">

                    <div class="card-body text-center">

                        <h2 class="card-title mb-4">
                            <%= car.getModel() %>
                        </h2>

                        <p class="card-text">
                            <strong>Brand:</strong> <%= car.getBrandName() %>
                        </p>

                        <p class="card-text">
                            <strong>Color:</strong> <%= car.getColor() %>
                        </p>

                        <p class="card-text">
                            <strong>Year:</strong> <%= car.getYear() %>
                        </p>

                        <p class="card-text">
                            <strong>Price per day:</strong>
                            <%= car.getPricePerDay() %> €
                        </p>

                        <p class="card-text">
                            <strong>Availability:</strong>
                            <%= car.isAvailable() ? "Available" : "Not available" %>
                        </p>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>

<!-- ================= FOOTER ================= -->
<footer class="bg-dark text-center text-white p-4 mt-5">

    <p class="mb-0">
        2026 - 6Car Project
    </p>

</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>