<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>6Car</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="css/styles.css">

</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <div class="container">

        <a class="navbar-brand" href="index.jsp">6Car</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link" href="cars.jsp">Cars</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">Login</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">Register</a>
                </li>

            </ul>

        </div>

    </div>

</nav>

<!-- HERO -->
<section class="hero text-center">

    <div class="container">

        <h1 class="display-4">6Car</h1>

        <p class="lead">Buy and rent cars easily</p>

        <a href="cars.jsp" class="btn btn-light">
            Explore Cars
        </a>

    </div>

</section>

<!-- FEATURED CARS -->
<section class="cars-section">

    <div class="container">

        <h2 class="text-center mb-5">Featured Cars</h2>

        <div class="row g-4">

            <!-- BMW -->
            <div class="col-md-4">

                <div class="card bg-dark text-white h-100">

                    <img src="images/bmw.jpg" class="card-img-top" alt="BMW">

                    <div class="card-body">

                        <h5 class="card-title">BMW M4</h5>

                        <p class="card-text">Automatic • Sport car</p>

                    </div>

                </div>

            </div>

            <!-- CHEVROLET -->
            <div class="col-md-4">

                <div class="card bg-dark text-white h-100">

                    <img src="images/chevrolet.jpg" class="card-img-top" alt="Chevrolet">

                    <div class="card-body">

                        <h5 class="card-title">Chevrolet Camaro</h5>

                        <p class="card-text">Automatic • Muscle car</p>

                    </div>

                </div>

            </div>

            <!-- PORSCHE -->
            <div class="col-md-4">

                <div class="card bg-dark text-white h-100">

                    <img src="images/porsche.jpg" class="card-img-top" alt="Porsche">

                    <div class="card-body">

                        <h5 class="card-title">Porsche 911</h5>

                        <p class="card-text">Automatic • Luxury sport</p>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>

<!-- FOOTER -->
<footer class="bg-dark text-center text-white p-4 mt-5">

    <p class="mb-0">2026 - 6Car Project</p>

</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>