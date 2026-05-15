<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>6Car</title>

    <!-- Bootstrap -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- CSS -->

    <link rel="stylesheet" href="css/styles.css">

</head>

<body>


<!-- =========================
     NAVBAR
========================= -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <div class="container">

        <a class="navbar-brand"
           href="#">

            6Car

        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse"
             id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="nav-link"
                       href="#">

                        Cars

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="#">

                        Login

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="#">

                        Register

                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>


<!-- =========================
     HERO
========================= -->

<section class="hero text-center">

    <div class="container">

        <h1 class="display-4">

            6Car

        </h1>

        <p class="lead">

            Buy and rent cars easily

        </p>

        <button class="btn btn-light">

            Explore Cars

        </button>

    </div>

</section>


<!-- =========================
     CARS SECTION
========================= -->

<section class="cars-section">

    <div class="container">

        <h2 class="text-center mb-4">

            Available Cars

        </h2>


        <!-- SEARCH -->

        <div class="row justify-content-center mb-4">

            <div class="col-md-6">

                <input type="text"
                       class="form-control"
                       placeholder="Search car...">

            </div>

        </div>


        <!-- CARDS -->

        <div class="row g-4">


            <!-- CARD 1 -->

            <div class="col-md-4">

                <div class="card bg-dark text-white h-100">

                    <img src="https://images.unsplash.com/photo-1555215695-3004980ad54e?q=80&w=1200&auto=format&fit=crop"
                         class="card-img-top"
                         alt="BMW">

                    <div class="card-body">

                        <h5 class="card-title">

                            BMW M4

                        </h5>

                        <p class="card-text">

                            Automatic • 2024

                        </p>

                        <p>

                            250€/day

                        </p>

                        <button class="btn btn-outline-light">

                            Details

                        </button>

                    </div>

                </div>

            </div>


            <!-- CARD 2 -->

            <div class="col-md-4">

                <div class="card bg-dark text-white h-100">

                    <img src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=1200&auto=format&fit=crop"
                         class="card-img-top"
                         alt="Audi">

                    <div class="card-body">

                        <h5 class="card-title">

                            Audi RS6

                        </h5>

                        <p class="card-text">

                            Automatic • 2023

                        </p>

                        <p>

                            320€/day

                        </p>

                        <button class="btn btn-outline-light">

                            Details

                        </button>

                    </div>

                </div>

            </div>


            <!-- CARD 3 -->

            <div class="col-md-4">

                <div class="card bg-dark text-white h-100">

                    <img src="https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=1200&auto=format&fit=crop"
                         class="card-img-top"
                         alt="Mercedes">

                    <div class="card-body">

                        <h5 class="card-title">

                            Mercedes AMG

                        </h5>

                        <p class="card-text">

                            Automatic • 2024

                        </p>

                        <p>

                            400€/day

                        </p>

                        <button class="btn btn-outline-light">

                            Details

                        </button>

                    </div>

                </div>

            </div>

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