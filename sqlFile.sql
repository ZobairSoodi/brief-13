CREATE DATABASE brief13;
USE brief13;

CREATE TABLE Client(
	id_client INT PRIMARY KEY,
    firstName VARCHAR(25),
    lastName VARCHAR(25),
    adress VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(50),
    password VARCHAR(25)
);
CREATE TABLE Product(
	id_product INT PRIMARY KEY,
    label VARCHAR(25),
    description VARCHAR(50),
    price FLOAT,
    quantity INT
);
CREATE TABLE Order_(
	id_order INT PRIMARY KEY,
    quantity_ordered INT,
    date_ordered DATE,
    shipping_adress VARCHAR(50)
);