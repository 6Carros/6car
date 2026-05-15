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
            <h1>Available Cars</h1>

            <a href="cars-crud?action=new" class="btn btn-outline-light">
                + Add New Car
            </a>
        </div>

        <div class="row g-4">

            <%
                if (cars != null) {
                    for (Car c : cars) {
            %>

            <div class="col-md-4">

                <div class="card bg-dark text-white border border-secondary h-100">

                    <img src="<%= c.getImageUrl() %>" class="card-img-top" style="height:220px; object-fit:cover;">

                    <div class="card-body text-center">

                        <h5><%= c.getModel() %></h5>

                        <p>Brand: <%= c.getBrandName() %></p>
                        <p>Year: <%= c.getYear() %></p>
                        <p><%= c.getPricePerDay() %> €/day</p>

                        <div class="mt-3">

                            <!-- DETAIL FIXADO -->
                            <a href="cars-crud?action=detail&id=<%= c.getId() %>"
                               class="btn btn-outline-light btn-sm">
                                Details
                            </a>

                            <a href="cars-crud?action=edit&id=<%= c.getId() %>"
                               class="btn btn-outline-light btn-sm">
                                Edit
                            </a>

                            <a href="cars-crud?action=delete&id=<%= c.getId() %>"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Are you sure you want to delete this car?');">
                                Delete
                            </a>

                        </div>

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