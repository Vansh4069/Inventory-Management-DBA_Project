-- Creating  the Database 
create database InventoryDB;

use InventoryDB;

--  tables and relationships 
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    ProductName VARCHAR(100) NOT NULL,
    QuantityInStock INT NOT NULL,
    ReorderLevel INT NOT NULL,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE PurchaseOrders (
    OrderID INT PRIMARY KEY IDENTITY,
    ProductID INT,
    QuantityOrdered INT,
    OrderDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- inserting sample data
INSERT INTO Suppliers (SupplierName, ContactNumber) VALUES 
('ABC Supplies', '123-456-7890'),
('XYZ Distributors', '987-654-3210');

INSERT INTO Products (ProductName, QuantityInStock, ReorderLevel, SupplierID) VALUES
('Laptop', 50, 10, 1),
('Keyboard', 200, 50, 2);

