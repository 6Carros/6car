USE sixcar;

-- =========================
-- BRANDS
-- =========================

INSERT INTO brands (name, country, founded_year, logo_url) VALUES
('BMW', 'Germany', 1916, 'images/bmw.png'),
('Audi', 'Germany', 1909, 'images/audi.png'),
('Toyota', 'Japan', 1937, 'images/toyota.png'),
('Ford', 'United States', 1903, 'images/ford.png'),
('Mercedes-Benz', 'Germany', 1926, 'images/mercedes.png');

-- =========================
-- CARS
-- =========================

INSERT INTO cars (
    brand_id,
    model,
    year,
    color,
    price_per_day,
    available,
    image_url
) VALUES
(1, 'M3 Competition', 2023, 'Black', 180.00, 1, 'images/m3.jpg'),
(1, 'X5', 2022, 'White', 150.00, 1, 'images/x5.jpg'),

(2, 'RS6 Avant', 2024, 'Grey', 220.00, 1, 'images/rs6.jpg'),
(2, 'A5 Sportback', 2021, 'Blue', 130.00, 0, 'images/a5.jpg'),

(3, 'Supra', 2023, 'Red', 170.00, 1, 'images/supra.jpg'),
(3, 'Corolla', 2020, 'Silver', 75.00, 1, 'images/corolla.jpg'),

(4, 'Mustang GT', 2022, 'Yellow', 190.00, 1, 'images/mustang.jpg'),
(4, 'Focus ST', 2019, 'White', 90.00, 1, 'images/focus.jpg'),

(5, 'AMG GT', 2024, 'Green', 250.00, 0, 'images/amg.jpg'),
(5, 'Class C Coupe', 2021, 'Black', 140.00, 1, 'images/classc.jpg');

-- =========================
-- USERS
-- =========================

INSERT INTO users (
    username,
    email,
    password,
    role
) VALUES
('admin', 'admin@6car.com', 'admin123', 'ADMIN'),
('adrian', 'adrian@6car.com', '1234', 'USER'),
('diego', 'diego@6car.com', '1234', 'USER'),
('alvaro', 'alvaro@6car.com', '1234', 'USER'),
('john_doe', 'john@example.com', 'password', 'USER');

-- =========================
-- RENTALS
-- =========================

INSERT INTO rentals (
    user_id,
    car_id,
    start_date,
    end_date,
    total_price,
    status
) VALUES
(2, 1, '2026-05-20', '2026-05-25', 900.00, 'CONFIRMED'),
(3, 3, '2026-05-18', '2026-05-22', 880.00, 'CONFIRMED'),
(4, 5, '2026-06-01', '2026-06-05', 680.00, 'PENDING'),
(5, 7, '2026-05-15', '2026-05-17', 380.00, 'COMPLETED');



