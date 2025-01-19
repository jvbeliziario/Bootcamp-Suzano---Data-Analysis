CREATE DATABASE sunny_repair_shop;
USE sunny_repair_shop;

CREATE TABLE IF NOT EXISTS person (
    cpf CHAR(11) PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    middleInit CHAR(3),
    lastName VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS client (
    cpf CHAR(11) PRIMARY KEY,
    contact CHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    CONSTRAINT fk_client_person FOREIGN KEY (cpf) REFERENCES person(cpf) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS mechanic (
    cpf CHAR(11) PRIMARY KEY,
    specialization VARCHAR(50) NOT NULL,
    CONSTRAINT fk_mechanic_person FOREIGN KEY (cpf) REFERENCES person(cpf) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS orders (
    orderNumber INT AUTO_INCREMENT PRIMARY KEY,
    issueDate DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    orderStatus ENUM('Cancelled', 'Confirmed', 'In processing') DEFAULT 'In processing',
    expirationDate DATE NOT NULL,
    vehicleModel VARCHAR(50) NOT NULL,
    cpf CHAR(11),
    CONSTRAINT fk_order_person FOREIGN KEY (cpf) REFERENCES person(cpf) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS service (
    idService INT AUTO_INCREMENT PRIMARY KEY,
    serviceType VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS part (
    idPart INT AUTO_INCREMENT PRIMARY KEY,
    partType VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS orderService (
    orderNumber INT,
    idService INT,
    PRIMARY KEY (orderNumber, idService),
    CONSTRAINT fk_orderService_order FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber) ON UPDATE CASCADE,
    CONSTRAINT fk_orderService_service FOREIGN KEY (idService) REFERENCES service(idService) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS orderPart (
    orderNumber INT,
    idPart INT,
    quantity INT NOT NULL,
    PRIMARY KEY (orderNumber, idPart),
    CONSTRAINT fk_orderPart_order FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber) ON UPDATE CASCADE,
    CONSTRAINT fk_orderPart_part FOREIGN KEY (idPart) REFERENCES part(idPart) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS orderMechanic (
    orderNumber INT,
    cpf CHAR(11),
    hoursWorked DECIMAL(3, 1) NOT NULL,
    PRIMARY KEY (orderNumber, cpf),
    CONSTRAINT fk_orderMechanic_order FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber) ON UPDATE CASCADE,
    CONSTRAINT fk_orderMechanic_mechanic FOREIGN KEY (cpf) REFERENCES mechanic(cpf) ON UPDATE CASCADE
);

INSERT INTO person (cpf, firstName, middleInit, lastName, address)
VALUES
('12345678901', 'Monkey', 'D', 'Luffy', 'Going Merry'),
('23456789012', 'Roronoa', 'Z', 'Zoro', 'Kuraigana Island'),
('34567890123', 'Sanji', 'V', 'Vinsmoke', 'Baratie'),
('45678901234', 'Tony', 'T', 'Chopper', 'Drum Island'),
('56789012345', 'Nico', 'R', 'Robin', 'Ohara'),
('67890123456', 'Franky', 'C', 'Cutty', 'Water 7');

INSERT INTO client (cpf, contact, email)
VALUES
('12345678901', '12345678901', 'luffy@strawhats.com'),
('23456789012', '23456789012', 'zoro@strawhats.com'),
('34567890123', '34567890123', 'sanji@strawhats.com');

INSERT INTO mechanic (cpf, specialization)
VALUES
('45678901234', 'Engine Repair'),
('56789012345', 'Diagnostics'),
('67890123456', 'Structural Repair');

INSERT INTO orders (issueDate, price, expirationDate, vehicleModel, cpf)
VALUES
('2023-01-01', 1200.00, '2023-01-05', 'Sunny Boat', '12345678901'),
('2023-01-02', 2500.00, '2023-01-10', 'Mini Merry', '23456789012'),
('2023-01-03', 1500.00, '2023-01-08', 'Shark Submerge', '34567890123'),
('2023-01-04', 3000.00, '2023-01-15', 'Going Merry', '12345678901');

INSERT INTO service (serviceType, price)
VALUES
('Hull Repair', 200.00),
('Sail Replacement', 150.00),
('Cannon Maintenance', 300.00);

INSERT INTO part (partType, price)
VALUES
('Anchor', 100.00),
('Mast', 500.00),
('Cannon', 1000.00);

INSERT INTO orderService (orderNumber, idService)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(4, 2);

INSERT INTO orderPart (orderNumber, idPart, quantity)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 1, 1),
(4, 3, 1);

INSERT INTO orderMechanic (orderNumber, cpf, hoursWorked)
VALUES
(1, '45678901234', 15.0),
(2, '56789012345', 20.0),
(3, '67890123456', 10.0),
(4, '45678901234', 25.0),
(4, '56789012345', 30.0);

SELECT CONCAT(person.firstName, ' ', person.lastName) AS clientName, COUNT(orders.orderNumber) AS totalOrders
FROM person
JOIN orders ON person.cpf = orders.cpf
GROUP BY person.cpf
HAVING totalOrders > 1;

SELECT CONCAT(person.firstName, ' ', person.lastName) AS clientName, orders.vehicleModel, service.serviceType, orders.expirationDate
FROM person, orders, service, orderService
WHERE person.cpf = orders.cpf AND orders.orderNumber = orderService.orderNumber AND orderService.idService = service.idService
ORDER BY orders.expirationDate;


