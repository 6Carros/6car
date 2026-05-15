<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sixcar.model.Car" %>
<%@ page import="com.sixcar.model.Brand" %>
<%@ page import="java.util.List" %>

<%
    Car car = (Car) request.getAttribute("car");
    List<Brand> brands = (List<Brand>) request.getAttribute("brands");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title><%= (car != null) ? "Edit Car" : "Create Car" %> - 6Car</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
</head>

<body class="bg-dark text-white">

<div class="container mt-5">

    <a href="cars-crud?action=list" class="btn btn-light mb-4">← Back</a>

    <div class="card bg-dark border-light p-4">

        <h2 class="text-center mb-4 text-white fw-bold">
            <%= (car != null) ? "Edit Car" : "Create New Car" %>
        </h2>

        <!-- 🔥 FIX IMPORTANTE: action=create/update -->
        <form action="cars-crud?action=<%= (car != null) ? "update" : "create" %>" method="post">

            <% if (car != null) { %>
            <input type="hidden" name="id" value="<%= car.getId() %>">
            <% } %>

            <div class="row g-4">

                <div class="col-md-6">
                    <label class="form-label text-white">Model</label>
                    <input type="text" name="model" class="form-control"
                           value="<%= (car != null) ? car.getModel() : "" %>">
                </div>

                <div class="col-md-6">
                    <label class="form-label text-white">Brand</label>
                    <select name="brandId" class="form-select">

                        <% if (brands != null) {
                            for (Brand b : brands) { %>

                        <option value="<%= b.getId() %>"
                                <%= (car != null && car.getBrandId() == b.getId()) ? "selected" : "" %>>
                            <%= b.getName() %>
                        </option>

                        <% } } %>

                    </select>
                </div>

                <div class="col-md-4">
                    <label class="form-label text-white">Year</label>
                    <input type="number" name="year" class="form-control"
                           value="<%= (car != null) ? car.getYear() : "" %>">
                </div>

                <div class="col-md-4">
                    <label class="form-label text-white">Color</label>
                    <input type="text" name="color" class="form-control"
                           value="<%= (car != null) ? car.getColor() : "" %>">
                </div>

                <div class="col-md-4">
                    <label class="form-label text-white">Price/day</label>
                    <input type="number" step="0.01" name="pricePerDay" class="form-control"
                           value="<%= (car != null) ? car.getPricePerDay() : "" %>">
                </div>

                <div class="col-md-6">
                    <label class="form-label text-white">Image URL</label>
                    <input type="text" name="imageUrl" class="form-control"
                           value="<%= (car != null) ? car.getImageUrl() : "" %>">
                </div>

                <div class="col-md-6 d-flex align-items-center">
                    <input type="checkbox" name="available"
                        <%= (car != null && car.isAvailable()) ? "checked" : "" %>>
                    <label class="form-label text-white ms-2">Available</label>
                </div>

            </div>

            <div class="text-center mt-4">
                <button type="submit" class="btn btn-outline-light">
                    <%= (car != null) ? "Update" : "Create" %>
                </button>
            </div>

        </form>

    </div>

</div>

</body>
</html>