create database project;
use project;
# Now i am working in the project in the  project in the while useing in the project that time  use three csv file the csv file name is the book.csv,customber.csv,order.csv,
//*1. Retrieve all books in the "Fiction" genre.
2. Find books published after the year 1950.
3. List all customers from Canada.
4. Show orders placed in November 2023.
5. Retrieve the total stock of books available.
6. Find the details of the most expensive book.
7. Show all customers who ordered more than 1 quantity of a book.
8. Retrieve all orders where the total amount exceeds $20.
9. List all genres available in the Books table.
10. Find the book with the lowest stock.
11. Calculate the total revenue generated from all orders.*/

# we have import table  in the form of the  csv file 
select * from books;
select * from customers;
select * from orders;
# solve the qustin one by one 

# 1. Retrieve all books in the "Fiction" genre.
select * from books ;
select * from books 
where Genre ="Fiction";

# 2. Find books published after the year 1950.

select * from books 
where Published_Year = 1950 ;

# 3. List all customers from Canada.
select * from customers;

select * from customers
where Country='Canada';

# 4. Show orders placed in November 2023.
select * from  orders;

select * from  orders
where Order_Date>='2023-11-01' and Order_Date<='2023-11-30';

# 5. Retrieve the total stock of books available.

select sum(Stock) as total_books  from books;
# the answer is the stock= '25056'
 
# 6. Find the details of the most expensive book.
select * from books;
select Price from books
order by Price desc
limit 1;
 # answer = '49.98'

#  7. Show all customers who ordered more than 1 quantity of a book.

select * from customers;
select * from books;
select * from orders;


select * from orders 
where Quantity>1;

#8. Retrieve all orders where the total amount exceeds $20.
select * from customers;
select * from books;
select * from orders;

select * from orders
where Total_Amount>=20;

# 9. List all genres available in the Books table.
select * from customers;
select * from books;
select distinct Genre from books;
/* -> answer
'Biography'
'Fantasy'
'Non-Fiction'
'Fiction'
'Romance'
'Science Fiction'
'Mystery'*/

# 10. Find the book with the lowest stock. 
select * from books;

select * from books 
order by Stock asc
limit 1;

# Answer 
#->'378', 'Future-proofed heuristic function', 'Samantha Mcclain', 'Romance', '1903', '6.01', '0'

# 11. Calculate the total revenue generated from all orders.*/
select * from books;
select * from orders;

select sum(Total_Amount) as revenue_generated from orders;
# revenue_generated->revenue_generated '75628.66000000003'
# the basic qustion has been solved;

/*
Advance Queries

1. Retrieve the total number of books sold for each genre.
2. Find the average price of books in the "Fantasy" genre.
3. List customers who have placed at least 2 orders.
4. Find the most frequently ordered book.
5. Show the top 3 most expensive books of 'Fantasy' Genre.
6. Retrieve the total quantity of books sold by each author.
7. List the cities where customers who spent over $30 are located.
8. Find the customer who spent the most on orders.
9. Calculate the stock remaining after fulfilling all orders.
*/
# the sove the advance qustion one by one 

# firt quetion 
# 1. Retrieve the total number of books sold for each genre.
select * from orders;
select * from books;
select b.Genre,sum(o.Quantity) as total_number_of_books  from 
books b join orders o on b.Book_ID =o.Book_ID 
group by  b.Genre;
# the answer is 
/* 
Biography	     	285
Non-Fiction			351
Fantasy	    		446
Romance	    		439
Science Fiction		447
Mystery				504
Fiction				225
*/

# 2. Find the average price of books in the "Fantasy" genre.
select * from orders;
select * from customers;
select * from books;
select b.Genre,avg(b.Price) as avg_price_books  from 
books b join orders o on b.Book_ID =o.Book_ID 
where b.Genre ='Fantasy'
group by  b.Genre;
#  
# -> Fantasy	24.55925925925926
select avg(Price) Avg_price from books where 
Genre ='Fantasy';

# 3. List customers who have placed at least 2 orders.
select * from  customers;
select * from books;
select * from orders;
select c.Name, o.Quantity from customers c join orders o on c.Customer_ID=o.Customer_ID
where o.Quantity>=2;
# 

# the fourth qustion 
 # 4. Find the most frequently ordered book.
select * from  orders;
  select * from books;

select Quantity as  frequently_ordered from  orders
order by Quantity desc limit 2;

# to 4. Find the most frequently ordered book. 
select * from books;
select * from orders;
select * from  customers;
select Book_ID,count(Order_ID) as frequently_ordered from orders
group by Book_ID
order by frequently_ordered desc limit 1;



# 5. Show the top 3 most expensive books of 'Fantasy' Genre.

select * from books;
select * from orders;
select * from  customers;

select Book_ID,Title,Genre,Price from books
where Genre='Fantasy' order by Price desc limit 3;

# 6. Retrieve the total quantity of books sold by each author.
select * from orders;
select * from books;
select * from customers;

select b.Author,sum(o.Quantity) as total_book_sold from  orders o join books b
on o.Book_ID=b.Book_ID 
group by b.Author
order by b.Author desc ;

# 7. List the cities where customers who spent over $30 are located.
select * from books;
select * from customers;
select * from orders;
select distinct c.City,sum(Total_Amount) from 
customers c join orders o on o.Customer_ID=c.Customer_ID
where o.Total_Amount>=30
group by c.City;


# 8. Find the customer who spent the most on orders.
select * from customers;
select * from orders;
select c.Customer_ID,c.Name,sum(o.Total_Amount) as total_spent
from customers c join orders o on o.Customer_ID=c.Customer_ID
group by c.Name, c.Customer_ID
order by total_spent desc limit 10 ;

# 9. Calculate the stock remaining after fulfilling all orders.
select * from books;
select * from customers;
select * from orders;

SELECT
    b.Book_ID,
    b.Title,
    b.Stock,
    COALESCE(SUM(o.Quantity), 0) AS Order_quantity,
    b.Stock - COALESCE(SUM(o.Quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o
    ON b.Book_ID = o.Book_id
GROUP BY b.Book_id;
 













 