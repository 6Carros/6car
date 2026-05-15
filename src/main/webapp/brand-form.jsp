<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sixcar.model.Brand" %>

<%
    Brand brand = (Brand) request.getAttribute("brand");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title><%= (brand != null) ? "Edit Brand" : "Create Brand" %> - 6Car</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
</head>

<body class="bg-dark text-white">

<div class="container mt-5">

    <a href="brands-crud?action=list" class="btn btn-light mb-4">← Back</a>

    <div class="card bg-dark border-light p-4">

        <h2 class="text-center mb-4 text-white fw-bold">
            <%= (brand != null) ? "Edit Brand" : "Create New Brand" %>
        </h2>

        <!-- 🔥 FIX IMPORTANTE -->
        <form action="brands-crud?action=<%= (brand != null) ? "update" : "create" %>" method="post">

            <% if (brand != null) { %>
            <input type="hidden" name="id" value="<%= brand.getId() %>">
            <% } %>

            <div class="row g-4">

                <div class="col-md-6">
                    <label class="form-label text-white">Name</label>
                    <input type="text" name="name" class="form-control"
                           value="<%= (brand != null) ? brand.getName() : "" %>">
                </div>

                <div class="col-md-6">
                    <label class="form-label text-white">Country</label>
                    <input type="text" name="country" class="form-control"
                           value="<%= (brand != null) ? brand.getCountry() : "" %>">
                </div>

                <div class="col-md-6">
                    <label class="form-label text-white">Founded Year</label>
                    <input type="number" name="foundedYear" class="form-control"
                           value="<%= (brand != null) ? brand.getFoundedYear() : "" %>">
                </div>

                <div class="col-md-6">
                    <label class="form-label text-white">Logo URL</label>
                    <input type="text" name="logoUrl" class="form-control"
                           value="<%= (brand != null) ? brand.getLogoUrl() : "" %>">
                </div>

            </div>

            <div class="text-center mt-4">
                <button type="submit" class="btn btn-outline-light">
                    <%= (brand != null) ? "Update" : "Create" %>
                </button>
            </div>

        </form>

    </div>

</div>

</body>
</html>