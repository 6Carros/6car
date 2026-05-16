<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sixcar.model.Brand" %>

<%
    Brand brand = (Brand) request.getAttribute("brand");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title><%= brand.getName() %> - 6Car</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="css/styles.css">

</head>

<body class="bg-dark text-white">

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
                    <a class="nav-link active" href="brands">
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

        <!-- BACK -->
        <a href="brands" class="btn btn-light mb-4">
            ← Back to brands
        </a>

        <div class="row justify-content-center">

            <div class="col-md-7">

                <div class="card bg-dark text-white border-light">

                    <div class="card-body text-center">

                        <h2 class="card-title mb-4">
                            <%= brand.getName() %>
                        </h2>

                        <p class="card-text">
                            <strong>Country:</strong> <%= brand.getCountry() %>
                        </p>

                        <p class="card-text">
                            <strong>Founded:</strong> <%= brand.getFoundedYear() %>
                        </p>

                        <div class="mt-4">
                            <h5 class="mb-2">Description</h5>

                            <p class="text-white">
                                <%= brand.getDescription() != null ? brand.getDescription() : "No description available" %>
                            </p>
                        </div>
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