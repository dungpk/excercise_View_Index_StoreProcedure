create database product_demo;

use product_demo;

drop table products;
CREATE TABLE Products (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  productCode VARCHAR(255),
  productName VARCHAR(255),
  productPrice DECIMAL(10,2),
  productAmount INT,
  productDescription TEXT,
  productStatus bit
);


CREATE UNIQUE INDEX idx_productCode ON Products (productCode);

CREATE INDEX idx_productName_productPrice ON Products (productName, productPrice);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES ('P001', 'Product 1', 1000, 10, 'Description for Product 1', true),
       ('P002', 'Product 2', 2000, 20, 'Description for Product 2', true),
       ('P003', 'Product 3', 3000, 30, 'Description for Product 3', false),
       ('P004', 'Product 4', 3000, 30, 'Description for Product 4', false),
	   ('P005', 'Product 5', 3000, 30, 'Description for Product 5', false),
       ('P006', 'Product 6', 3000, 30, 'Description for Product 6', false),
       ('P007', 'Product 7', 6666, 30, 'Description for Product 7', false),
       ('P008', 'Product 8', 18222, 30, 'Description for Product 8', false),
       ('P009', 'Product 9', 51711, 30, 'Description for Product 9', false),
       ('P0010', 'Product 10', 67323, 30, 'Description for Product 10', false),
       ('P0011', 'Product 11', 5555, 30, 'Description for Product 11', false),
       ('P0012', 'Product 12', 2222, 30, 'Description for Product 12', false),
       ('P0013', 'Product 13', 5555, 30, 'Description for Product 13', false),
	   ('P0014', 'Product 14', 41253, 30, 'Description for Product 14', false)
	;
    
CREATE VIEW product_views AS

SELECT productName, productCode, productPrice,productStatus

FROM  Products;
       
select * from product_views;


CREATE OR REPLACE VIEW product_views AS

SELECT productName, productCode, productPrice,productStatus

FROM Products

WHERE productStatus = true;

DROP VIEW product_views;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

DELIMITER //

CREATE PROCEDURE findAllProducts()

BEGIN

  SELECT * FROM products;

END //

DELIMITER ;

call findAllProducts();

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //

CREATE PROCEDURE addProduct(
IN  in_productCode VARCHAR(50),
IN  in_productName VARCHAR(255),
IN  in_productPrice DECIMAL(10,2),
IN  in_productAmount INT,
IN  in_productDescription TEXT,
IN  in_productStatus bit
)
BEGIN

  INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES (in_productCode, in_productName, in_productPrice, in_productAmount, in_productDescription, in_productStatus);

END //

DELIMITER ;

call addProduct('P0015', 'Product 15', 41253, 220, 'Description for Product 15', false);

-- Tạo store procedure sửa thông tin sản phẩm theo id

DELIMITER //

CREATE PROCEDURE fixProduct(
IN  in_Id INT	,
IN  in_productCode VARCHAR(50),
IN  in_productName VARCHAR(255),
IN  in_productPrice DECIMAL(10,2),
IN  in_productAmount INT,
IN  in_productDescription TEXT,
IN  in_productStatus bit
)
BEGIN

  UPDATE products 
  SET productCode = in_productCode, productName = in_productName,productPrice = in_productPrice,productAmount = in_productAmount,
					roductDescription = in_productDescription,productStatus = in_productStatus
  WHERE id = in_Id;

END //
DELIMITER ;

DROP PROCEDURE fixproduct;

call fixProduct(29,'P0016', 'Product 16', 41253, 220, 'Description for Product 16', false);

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //

CREATE PROCEDURE removeProduct(
IN  in_Id INT
)
BEGIN

  DELETE FROM products WHERE id = in_id;

END //
DELIMITER ;

call removeProduct(434);