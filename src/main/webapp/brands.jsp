<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sixcar.model.Brand" %>

<%
    List<Brand> brands = (List<Brand>) request.getAttribute("brands");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Brands - 6Car</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
</head>

<body class="bg-dark text-white">

<nav class="navbar navbar-dark bg-dark border-bottom border-secondary">
    <div class="container">

        <a class="navbar-brand" href="index.jsp">6Car</a>

        <div>
            <a class="nav-link d-inline text-white" href="cars">Cars</a>
            <a class="nav-link d-inline text-white" href="brands">Brands</a>
        </div>

    </div>
</nav>

<section class="py-5">

    <div class="container">

        <div class="d-flex justify-content-between mb-4">
            <h1>Brands</h1>

            <a href="brands-crud?action=new" class="btn btn-outline-light">
                + Add New Brand
            </a>
        </div>

        <div class="row g-4">

            <%
                if (brands != null) {
                    for (Brand b : brands) {
            %>

            <div class="col-md-4">

                <div class="card bg-dark text-white border border-secondary text-center p-3 h-100">

                    <img src="<%= b.getLogoUrl() %>"
                         style="height:80px; object-fit:contain;"
                         class="mx-auto mb-3">

                    <h5><%= b.getName() %></h5>

                    <p><%= b.getCountry() %></p>
                    <p>Founded: <%= b.getFoundedYear() %></p>

                    <div class="mt-3">

                        <!-- DETAIL FIXADO -->
                        <a href="brands-crud?action=detail&id=<%= b.getId() %>"
                           class="btn btn-outline-light btn-sm">
                            Details
                        </a>

                        <a href="brands-crud?action=edit&id=<%= b.getId() %>"
                           class="btn btn-outline-light btn-sm">
                            Edit
                        </a>

                        <a href="brands-crud?action=delete&id=<%= b.getId() %>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this brand?');">
                            Delete
                        </a>

                    </div>

                </div>

            </div>

            <%
                    }
                }
            %>

        </div>

    </div>

</section>

</body>
</html>