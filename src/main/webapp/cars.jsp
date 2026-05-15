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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="css/styles.css">

</head>

<body>

<!-- ================= NAVBAR ================= -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <div class="container">

        <a class="navbar-brand" href="index.jsp">6Car</a>

        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link active" href="cars">Cars</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="brands">Brands</a>
                </li>

            </ul>

        </div>

    </div>

</nav>

<!-- ================= CARS ================= -->
<section class="cars-section">

    <div class="container">

        <h1 class="text-center mb-5">Available Cars</h1>

        <div class="row g-4">

            <%
                if (cars != null && !cars.isEmpty()) {
                    for (Car c : cars) {
            %>

            <div class="col-md-4">

                <div class="card bg-dark text-white h-100 border-light">

                    <img src="<%= c.getImageUrl() %>"
                         class="card-img-top"
                         alt="<%= c.getModel() %>">

                    <div class="card-body text-center">

                        <h5 class="card-title">
                            <%= c.getModel() %>
                        </h5>

                        <p class="card-text">
                            Brand: <%= c.getBrandName() %>
                        </p>

                        <p class="card-text">
                            Year: <%= c.getYear() %>
                        </p>

                        <p class="fw-bold">
                            <%= c.getPricePerDay() %> €/day
                        </p>

                        <p class="card-text">
                            Available:
                            <%= c.isAvailable() ? "Yes" : "No" %>
                        </p>

                        <a href="cars?id=<%= c.getId() %>"
                           class="btn btn-outline-light btn-sm">
                            Details
                        </a>

                    </div>

                </div>

            </div>

            <%
                }
            } else {
            %>

            <div class="text-center text-muted">
                No cars available
            </div>

            <%
                }
            %>

        </div>

    </div>

</section>

<!-- ================= FOOTER ================= -->
<footer class="bg-dark text-center text-white p-4 mt-5">

    <p class="mb-0">2026 - 6Car Project</p>

</footer>

</body>
</html>