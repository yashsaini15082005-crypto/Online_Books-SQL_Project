CREATE TABLE books(
book_id INT PRIMARY KEY,
title VARCHAR(255),
author VARCHAR(255),
gener VARCHAR(255),
published_year INT,
price NUMERIC (10,2),
stock INT 
);
SELECT* FROM books;


CREATE TABLE customers(
customer_id INT PRIMARY KEY,
name VARCHAR(255),
email VARCHAR(255),
phone VARCHAR(255),
city VARCHAR(255),
country VARCHAR(255)
);
SELECT*FROM customers;

CREATE TABLE orders(
order_ID INT PRIMARY KEY,
customer_id INT REFERENCES customers(customer_ID),
book_id INT REFERENCES books(book_id),
order_date DATE,
quantity INT,
total_amount NUMERIC(10,2)
);
SELECT*FROM orders;



--BASIC QUESTIONS OF SQL:
--1) Retrive all books in  the "Fiction" genre:
SELECT* FROM books
where gener='Fiction';

--2) Find books published after the year 1950:
SELECT*FROM books
WHERE published_year>1950;

--3) List all customers from the Canada:
SELECT* FROM customers
WHERE country='Canada';

--4) Show orders placed in november 2023:
SELECT*FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30'; 

--5) Retrive the total stock of books avilable:
SELECT SUM(stock) AS Total_stock FROM books;

--6) Find the details of the most expensive book:
SELECT* FROM books ORDER BY Price DESC LIMIT 1;

--7) Show all customers who orderd more than one quantity of book:
SELECT * from orders
WHERE quantity>1;

--8) Retrive all orders where the total amount exceeds $20:
SELECT* FROM orders
WHERE total_amount>20;

--9) List all genres avilable in the books table:
SELECT DISTINCT genre FROM books; 

ALTER TABLE books
RENAME COLUMN gener to genre;

--10)Find the books with the lowest stock:
SELECT*FROM books
ORDER BY stock
LIMIT 1;



--11) Calcuate the total revenue genersted from all orders:
SELECT SUM(total_amount) AS revenue FROM orders;


--ADVANCE SQL QUESTIONS----
-- Retrive the total number of books sold for each genre:

SELECT* FROM orders

SELECT b.genre, SUM(o.quantity)
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre;

--2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(price) AS Average_price
FROM books
WHERE genre='Fantasy';

--3) List customers who have placed at least 2 orders:
SELECT o.customer_id , c.name, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id= c.customer_id
GROUP BY o.customer_id , c.name
HAVING COUNT(order_id)>=2;

--4) 