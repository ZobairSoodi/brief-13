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
INSERT INTO Client VALUES
(1,'fn1','ln1','adr1','tel1','em1','ps1'),
(2,'fn2','ln2','adr2','tel2','em2','ps2'),
(3,'fn3','ln3','adr3','tel3','em3','ps3');

CREATE TABLE Product(
	id_product INT PRIMARY KEY,
    label VARCHAR(25),
    description VARCHAR(50),
    price FLOAT,
    quantity_in_stock INT
);
INSERT INTO Product VALUES
(1,'lb1','desc1',43,12),
(2,'lb2','desc2',5,54),
(3,'lb3','desc3',123,43);

CREATE TABLE Order_(
	id_order INT PRIMARY KEY,
    date_ordered DATE,
    shipping_adress VARCHAR(50),
    id_client INT REFERENCES Client(id_client)
);
ALTER TABLE Order_ ADD FOREIGN KEY (id_client) REFERENCES Client(id_client);
INSERT INTO Order_ VALUES
(1,'2013-06-12','ad1',1),
(2,'2014-06-01','ad2',2),
(3,'2005-11-09','ad3',3);

CREATE TABLE Order_Product_Details(
	quantity_ INT,
    id_product INT,
    FOREIGN KEY(id_product) REFERENCES Product(id_product),
    id_order INT,
    FOREIGN KEY(id_order) REFERENCES Order_(id_order)
);
ALTER TABLE Order_Product_Details
ADD PRIMARY KEY(id_product,id_order);
INSERT INTO Order_Product_Details VALUES
(12,1,1),
(10,2,1),
(12,1,2),
(1,3,1);




/* R1 */
SELECT * FROM Client;

/* R2 */
SELECT * FROM Client
ORDER BY firstName, lastName;

/* R3 */
SELECT * FROM Order_ WHERE date_ordered = '2013-06-12';

/* R4 */
SELECT COUNT(id_order) FROM Order_ O
INNER JOIN Client C ON O.id_client = C.id_client
WHERE C.firstName = 'fn1' AND C.lastName = 'ln1';

/* R5 */
SELECT * FROM Product;

/* R6 */
SELECT * FROM Product WHERE price > 5;

/* R7 */
SELECT * FROM Product WHERE quantity_in_stock = 0;

/* R8 */
SELECT C.id_client, C.firstName, C.lastName,O.shipping_adress,O.date_ordered,OPD.quantity_ FROM Order_ O
INNER JOIN Client C ON C.id_client = O.id_client
INNER JOIN Order_Product_DEtails OPD ON OPD.id_order = O.id_order
WHERE C.firstName = 'fn1' AND C.lastName = 'ln1' AND O.date_ordered = '2013-06-12';

/* R9 */
SELECT C.id_client, C.firstName, C.lastName,O.shipping_adress,O.date_ordered,OPD.quantity_, (OPD.quantity_*P.price) FROM Order_ O
INNER JOIN Client C ON C.id_client = O.id_client
INNER JOIN Order_Product_DEtails OPD ON OPD.id_order = O.id_order
INNER JOIN Product P ON P.id_product = OPD.id_product
WHERE C.firstName = 'fn1' AND C.lastName = 'ln1' AND O.date_ordered = '2013-06-12';



