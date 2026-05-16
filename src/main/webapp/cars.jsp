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
    <title>Cars - 6Car</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
</head>

<body class="bg-dark text-white">

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <div class="container">

        <a class="navbar-brand" href="index.jsp">6Car</a>

        <div class="collapse navbar-collapse">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link active" href="cars-crud?action=list">Cars</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="brands-crud?action=list">Brands</a>
                </li>

            </ul>

        </div>

    </div>

</nav>

<!-- 🔥 SEARCH BY BRAND -->
<div class="container mt-4">

    <form method="get" action="cars-crud" class="row justify-content-center">

        <input type="hidden" name="action" value="list">

        <div class="col-md-6">
            <input type="text"
                   name="brand"
                   class="form-control"
                   placeholder="Search by brand (BMW, Audi, Mercedes...)">
        </div>

        <div class="col-md-2">
            <button class="btn btn-outline-light w-100">
                Search
            </button>
        </div>

    </form>

</div>

<!-- CARS -->
<div class="container mt-5">

    <div class="row g-4">

        <%
            if (cars != null) {
                for (Car c : cars) {
        %>

        <div class="col-md-4">

            <div class="card bg-dark text-white border-light">

                <img src="<%= c.getImageUrl() %>" class="card-img-top">

                <div class="card-body text-center">

                    <h5><%= c.getModel() %></h5>

                    <!-- 🆕 BRAND NAME (JOIN) -->
                    <p><strong>Brand:</strong> <%= c.getBrandName() %></p>

                    <p><%= c.getYear() %></p>

                    <p class="fw-bold"><%= c.getPricePerDay() %> €/day</p>

                </div>

            </div>

        </div>

        <%
                }
            }
        %>

    </div>

</div>

</body>
</html>