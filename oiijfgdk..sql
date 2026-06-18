create database Cinema

 create TABLE Customers (
    customer_id INT PRIMARY KEY,
    name nchar (50),
    phone VARCHAR(15))
 
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title nchar(100),
    duration INT,
    price DECIMAL(4,2));

CREATE TABLE Halls (
    hall_id INT PRIMARY KEY,
    hall_name NCHAR(50),
    capacity INT);
CREATE TABLE MovieTicket (
    MovieTicket_id INT PRIMARY KEY,
    customer_id INT,
    movie_id INT,
    hall_id INT,
    seats INT,
    reservation_date DATE,

    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (hall_id) REFERENCES Halls(hall_id)
);
INSERT INTO Customers (customer_id, name, phone)
VALUES 
(1, 'Ahmed', '01012345678'),
(2, 'Sara', '01123456789'),
(3, 'Omar', '01234567890'),
(4, 'Mona', '01098765432'),
(5, 'Ali', '01199887766');

ALTER TABLE Movies
ALTER COLUMN price DECIMAL(10,2);


INSERT INTO Movies (movie_id, title, duration, price)
VALUES 
(1, 'Avatar', 180, 120),
(2, 'Interstellar', 170, 100),
(3, 'Joker', 140, 80),
(4, 'Inception', 150, 110),
(5, 'Titanic', 195, 90);

INSERT INTO Halls (hall_id, hall_name, capacity)
VALUES 
(1, 'Hall A', 100),
(2, 'VIP Hall', 40),
(3, 'Hall B', 80),
(4, 'Hall C', 120),
(5, 'Hall D', 60);

INSERT INTO MovieTicket (MovieTicket_id, customer_id, movie_id, hall_id, seats,  reservation_date )
VALUES 
(1, 1, 1, 1, 2, '2026/05/11'),
(2, 2, 2, 2, 3, '2026/05/11'),
(3, 3, 3, 3, 1, '2026/05/12'),
(4, 4, 4, 4, 4, '2026/05/12'),
(5, 5, 5, 5, 2, '2026/05/13');

SELECT 
    Customers.name,
    Movies.title,
    Halls.hall_name,
    MovieTicket.seats,
    MovieTicket.reservation_date
FROM MovieTicket
JOIN Customers ON MovieTicket.customer_id = Customers.customer_id
JOIN Movies ON MovieTicket.movie_id = Movies.movie_id
JOIN Halls ON MovieTicket.hall_id = Halls.hall_id;

SELECT 
    Movies.title,
    COUNT(MovieTicket.MovieTicket_id),         
    SUM(MovieTicket.seats),        
    AVG(MovieTicket.seats),              
    MAX(MovieTicket.seats),                 
    MIN(MovieTicket.seats)            
FROM MovieTicket
JOIN Movies ON MovieTicket.movie_id = Movies.movie_id
GROUP BY Movies.title
ORDER BY Movies.title ASC;

SELECT 
    Customers.name,
    SUM(MovieTicket.seats) 
FROM MovieTicket
JOIN Customers ON MovieTicket.customer_id = Customers.customer_id
GROUP BY Customers.name;


SELECT * FROM Customers;
SELECT * FROM Movies;
SELECT * FROM Halls;
SELECT * FROM MovieTicket;

SELECT TOP 1 *
FROM Movies
ORDER BY price DESC;

SELECT TOP 1 *
FROM Movies
ORDER BY price ASC;


SELECT 
    Customers.name,
    Movies.title,
    Halls.hall_name,
    MovieTicket.seats,
    Movies.price,
    (MovieTicket.seats * Movies.price) AS total_price,
    MovieTicket.reservation_date
FROM MovieTicket
JOIN Customers ON MovieTicket.customer_id = Customers.customer_id
JOIN Movies ON MovieTicket.movie_id = Movies.movie_id
JOIN Halls ON MovieTicket.hall_id = Halls.hall_id;


SELECT *
FROM Movies
WHERE duration > 160;

DELETE FROM Customers
WHERE customer_id = 5;