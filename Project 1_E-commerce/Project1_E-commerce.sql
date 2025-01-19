CREATE DATABASE ecommerce;
USE ecommerce;


CREATE TABLE IF NOT EXISTS client (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    middleInit CHAR(3),
    lastName VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pjClient (
    idClient INT PRIMARY KEY,
    cnpj CHAR(14) NOT NULL UNIQUE,
    CONSTRAINT fk_pjClient FOREIGN KEY (idClient) REFERENCES client(idClient) ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS pfClient (
    idClient INT PRIMARY KEY,
    cpf CHAR(11) NOT NULL UNIQUE,
    birthDate DATE,
    contact VARCHAR(50),
    CONSTRAINT fk_pfClient FOREIGN KEY (idClient) REFERENCES client(idClient) ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(50),
    price DECIMAL(10, 2),
    classificationKids BOOL DEFAULT FALSE,
    category ENUM('Electronic', 'Clothing', 'Toy', 'Food', 'Furniture') NOT NULL,
    usersRating FLOAT DEFAULT 0
);


CREATE TABLE IF NOT EXISTS payment (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT NOT NULL,
    typePayment ENUM('Receipt', 'Card', 'Two cards'),
    limitAvailable FLOAT,
    CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES client(idClient) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT NOT NULL,
    orderDate DATE,
    orderStatus ENUM('Cancelled', 'Confirmed', 'In processing', 'Shipped', 'Delivered') DEFAULT 'In processing',
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    idPayment INT NOT NULL,
    CONSTRAINT fk_orders_client FOREIGN KEY (idClient) REFERENCES client(idClient) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_order_payment FOREIGN KEY (idPayment) REFERENCES payment(idPayment) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS productStorage (
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (cnpj)
);

CREATE TABLE IF NOT EXISTS seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    abstName VARCHAR(255),
    location VARCHAR(255),
    contact CHAR(11) NOT NULL
);


CREATE TABLE IF NOT EXISTS productOrder (
    idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Available', 'Unavailable') DEFAULT 'Available',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_product_order_product FOREIGN KEY (idPOproduct) REFERENCES product(idProduct) ON UPDATE CASCADE,
    CONSTRAINT fk_product_order_orders FOREIGN KEY (idPOorder) REFERENCES orders(idOrder) ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS productSeller (
    idSeller INT,
    idProduct INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idSeller, idProduct),
    CONSTRAINT fk_product_seller_seller FOREIGN KEY (idSeller) REFERENCES seller(idSeller) ON UPDATE CASCADE,
    CONSTRAINT fk_product_seller_product FOREIGN KEY (idProduct) REFERENCES product(idProduct) ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS storageLocation (
    idLproduct INT,
    idLstorage INT,
    quantity INT DEFAULT 0,
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct) ON UPDATE CASCADE,
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage) ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS productSupplier (
    idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier, idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier) ON UPDATE CASCADE,
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct) ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS delivery (
    idDelivery INT AUTO_INCREMENT PRIMARY KEY,
    idOrder INT NOT NULL,
    deliveryStatus ENUM('Delivered', 'In transit', 'Cancelled') DEFAULT 'In transit',
    trackingCode CHAR(10) UNIQUE,
    CONSTRAINT fk_delivery_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder) ON UPDATE CASCADE
);

INSERT INTO seller (idSeller, socialName, abstName, location, contact)
VALUES
(1, 'Seller A', 'Abbreviation A', 'Location A', '12345678901'),
(2, 'Seller B', 'Abbreviation B', 'Location B', '09876543210');

INSERT INTO client (idClient, firstName, lastName, address) VALUES
(1, 'Monkey D.', 'Luffy', 'Foosha Village, East Blue'),
(2, 'Roronoa', 'Zoro', 'Shimotsuki Village, East Blue'),
(3, 'Nami', 'Navigator', 'Kokoyashi Village, East Blue'),
(4, 'Sanji', 'Cook', 'Germa Kingdom, North Blue'),
(5, 'Tony Tony', 'Chopper', 'Drum Island, East Blue');


INSERT INTO payment (idPayment, idClient, typePayment, limitAvailable) VALUES
(1, 1, 'Card', 1000),
(2, 2, 'Receipt', 500),
(3, 3, 'Card', 1200),
(4, 4, 'Two cards', 800),
(5, 5, 'Card', 700);


INSERT INTO orders (idOrder, idClient, orderDate, orderStatus, orderDescription, sendValue, idPayment) VALUES
(1, 1, '2025-01-18', 'Delivered', 'Order for Luffy', 10, 1),
(2, 2, '2025-01-18', 'In processing', 'Order for Zoro', 10, 2), -- Substituído 'Pending' por 'In processing'
(3, 3, '2025-01-18', 'Delivered', 'Order for Nami', 10, 3),
(4, 5, '2025-01-18', 'Delivered', 'Order for Chopper', 10, 5);

INSERT INTO product (idProduct, pName, price, classificationKids, category, usersRating)
VALUES
(1, 'Meat Feast', 50.00, FALSE, 'Food', 4.5),
(2, 'Katana Premium', 150.00, FALSE, 'Electronic', 4.8),
(3, 'Clima-Tact', 300.00, FALSE, 'Electronic', 4.9),
(4, 'Cookbook Gourmet', 80.00, FALSE, 'Food', 4.7);

INSERT INTO productSeller (idSeller, idProduct, prodQuantity)
VALUES
(1, 1, 10),
(1, 2, 50),
(2, 3, 200),
(2, 4, 10);


INSERT INTO productStorage (idProdStorage, storageLocation)
VALUES
(1, 'Warehouse A'),
(2, 'Warehouse B');

INSERT INTO storageLocation (idLproduct, idLstorage, quantity)
VALUES
(1, 1, 50),
(1, 2, 25),
(2, 1, 30),
(2, 2, 10),
(3, 1, 100),
(3, 2, 50),
(4, 1, 75),
(4, 2, 20);

INSERT INTO supplier (idSupplier, socialName, cnpj, contact)
VALUES
(1, 'Supplier A', '12345678901234', '12345678901'),
(2, 'Supplier B', '09876543210987', '09876543210');

INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity)
VALUES
(1, 1, 60),
(1, 2, 40),
(2, 3, 100),
(2, 4, 25);


SELECT * FROM client;
SELECT * FROM pjClient;
SELECT * FROM pfClient;
SELECT * FROM product;
SELECT * FROM payment;
SELECT * FROM orders;
SELECT * FROM productStorage;
SELECT * FROM supplier;
SELECT * FROM seller;
SELECT * FROM productOrder;
SELECT * FROM productSeller;
SELECT * FROM storageLocation;
SELECT * FROM productSupplier;
SELECT * FROM delivery;
