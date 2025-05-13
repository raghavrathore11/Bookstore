create database bookstore;
use bookstore;
select  genre ,count(*) as no_Of_book_sold
from books
group by genre;
create database book_store;
use book_store;
DROP TABLE books;


select * from books;
-- 1) Retrieve all books in the "Fiction" genre:
select *
 from books
where genre = "Fiction";



-- 2) Find books published after the year 1950:
select * from books
where Published_Year > 1950;

-- 3) List all customers from the Canada:
select * from customers;
select * from customers
where Country = "Canada";

-- 4) Show orders placed in November 2023:
select * from orders;
select * from orders 
where Order_Date between '2023-11-01'  and '2023-11-30';


-- 5) Retrieve the total stock of books available:
select* from books;

select sum( Stock) as total_stock 
from books;



-- 6) Find the details of the most expensive book:
select * from books
order by price desc
limit 1;


-- 7) Show all customers who ordered more than 1 quantity of a book:

select Customer_id,Quantity
from orders
where Quantity>1;


-- 8) Retrieve all orders where the total amount exceeds $20:

select * from orders
where Total_amount > 20;

-- 9) List all genres available in the Books table:

select genre  from books
group by genre;

select distinct genre from books;

-- 10) Find the book with the lowest stock:

select * from books
order by stock 
limit 1;

-- 11) Calculate the total revenue generated from all orders:
select sum(total_amount) as revenue from orders;

-- 12) Retrieve the total number of books sold for each genre:

select  b.genre, sum(o.quantity) as total_books
from orders as o 
join books as b on o.book_id= b.book_id
group by b.genre ;

-- 13) Find the average price of books in the "Fantasy" genre:

select genre, avg(price)as  avg_price
from books
where genre= "Fantasy";


-- 14) List customers who have placed at least 2 orders:

select o.customer_id, c.name ,count(c.name) as order_count
from orders as o 
join customers as c on o.customer_id= c.customer_id
group by c.name
having count(c.name)>=2;

SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >=2;

-- 15) Find the most frequently ordered book:

select o.book_id, b.title, count(o.book_id) as order_count
from orders as o
join books as b on o.book_id= b.book_id
group by o.book_id
order by order_count desc;

-- 16) Show the top 3 most expensive books of 'Fantasy' Genre :




select title, genre, price
from books
where genre="Fantasy"
order by price desc
limit 3;


-- 17) Retrieve the total quantity of books sold by each author:
select b.author, sum(o.quantity) as total_book_sold
from orders as o 
join books as b on o.book_id=b.book_id
group by b.author
order by total_book_sold desc;

-- 18) List the cities where customers who spent over $30 are located:

select c.city, sum(o.total_amount) as total_spent
from orders as o
join customers as c on o.customer_id= c.customer_id
group by city
having total_spent > 30
order by total_spent desc;


select distinct c.city , o.total_amount
from orders as o 
join customers as c on o.customer_id= c.customer_id
where o.total_amount>30;


-- 19) Find the customer who spent the most on orders:

select o.customer_id, c.name, sum(total_amount) as spent
from orders as o 
join customers as c on o.customer_id= c.customer_id
group by o.customer_id
order by spent desc
limit 1;



 -- 20) Calculate the stock remaining after fulfilling all orders:
 
 
select b.book_id,b.title,b.stock , COALESCE(sum(o.quantity),0) as sold_quantity , b.stock-  COALESCE(sum(o.quantity),0) as remain_stock
from books as b 
left join orders as o on b.book_id=o.book_id
group by b.book_id;




































