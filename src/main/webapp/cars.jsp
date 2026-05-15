<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sixcar.model.Car" %>

<%
    List<Car> cars = (List<Car>) request.getAttribute("cars");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cars - 6Car</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="css/styles.css">

</head>

<body>

<!-- NAVBAR -->
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
                    <a class="nav-link active" href="cars">
                        Cars
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="brands">
                        Brands
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">
                        Login
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">
                        Register
                    </a>
                </li>

            </ul>

        </div>

    </div>

</nav>

<!-- CARS SECTION -->
<section class="cars-section">

    <div class="container">

        <h1 class="text-center mb-5">
            Available Cars
        </h1>

        <!-- SEARCH (solo visual por ahora) -->
        <div class="row justify-content-center mb-5">

            <div class="col-md-6">

                <input type="text"
                       class="form-control"
                       placeholder="Search car...">

            </div>

        </div>

        <!-- CARDS -->
        <div class="row g-4">

            <%
                if (cars != null && !cars.isEmpty()) {
                    for (Car car : cars) {
            %>

            <div class="col-md-4">

                <div class="card bg-dark text-white h-100">

                    <img src="<%= car.getImageUrl() %>"
                         class="card-img-top"
                         alt="<%= car.getModel() %>">

                    <div class="card-body">

                        <h5 class="card-title">
                            <%= car.getModel() %>
                        </h5>

                        <p class="card-text">
                            Color: <%= car.getColor() %>
                        </p>

                        <p class="card-text">
                            Year: <%= car.getYear() %>
                        </p>

                        <p class="card-text">
                            Price: <%= car.getPricePerDay() %> €/day
                        </p>

                        <p class="card-text">
                            Available:
                            <%= car.isAvailable() ? "Yes" : "No" %>
                        </p>

                        <!-- TEMPORAL: solo debug, luego será brand name -->
                        <p class="card-text">
                            Brand ID: <%= car.getBrandId() %>
                        </p>

                        <a href="cars?id=<%= car.getId() %>"
                           class="btn btn-outline-light">
                            Details
                        </a>

                    </div>

                </div>

            </div>

            <%
                    }
                } else {
            %>

                <div class="col-12 text-center text-muted">
                    No cars available
                </div>

            <%
                }
            %>

        </div>

    </div>

</section>

<!-- FOOTER -->
<footer class="bg-dark text-center text-white p-4 mt-5">

    <p class="mb-0">
        2026 - 6Car Project
    </p>

</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>