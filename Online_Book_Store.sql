select * from Books
select * from Customers
select * from Orders

--1) Retreive all the books in the "Fiction" Genre
select * from Books where genre='Fiction';

--2) Find books published after the year 1950
select * from Books where published_year>1950

--3) List all the customers from canada
select * from Customers where Country='Canada'

--4) Show orders placed in November 2023
select * from Orders where order_date BETWEEN '2023-11-01' AND '2023-11-30'

--5) Retrieve the total stock of books available
select sum(stock) from Books

--6) Find the details of most expensive book
select * from Books where price=(select max(price) from Books)

--7) Show all customers who ordered more than 1 quantity of a book
select customer_id from Orders where quantity>1

--8) Retreive all orders where the total amount exceeds 20
select * from Orders where total_amount>20

--9) List all genres available
select distinct(genre) from Books

--10) Find the book with lowest stock
select * from Books where stock=(select min(stock) from Books)

--11) Calculate the total revenue generated from all orders
select 	sum(total_amount) from Orders

--12) Retreive the total number of books sold for each genre
select B.genre, sum(O.quantity) from Books as B inner join Orders as O on B.book_id=O.book_id group by B.genre

--13) Find the average price of books in the "Fantasy" genre
select genre, avg(price) from Books where genre='Fantasy' group by genre

--14) List customers who have placed at least 2 orders
select * from Orders where quantity>=2

--15) Find the most frequently ordered book
select O.Book_id, B.title  , count(O.order_id) as ORDER_COUNT from Books as B inner join Orders as O on B.book_id=O.book_id 
group by O.Book_id, B.title order by ORDER_COUNT DESC LIMIT 1

--16) Show the top 3 most expensive books of "Fantasy" genre
select * from Books where genre='Fantasy' order by price desc LIMIT 3;


--17) Retreive the total quantity of books sold by each author
select B.author, sum(O.quantity) as total_books_sold from Books as B inner join Orders as O on B.book_id=O.book_id group by B.author

--18) List the cities where customers who spent over $30 are loacted
select C.city, O.total_amount from Customers as C inner join Orders as O on C.customer_id=O.customer_id where O.total_amount>30

--19) Find the customers who spent the most on orders
select customer_id,sum(total_amount) as total_spent from Orders group by customer_id order by total_spent desc

--20) Calculate the stock remaining after the fulfilling all orrders
select b.book_id, b.title , b.stock, b.stock-coalesce(sum(O.quantity),0) as rem_quantity from books as b left join Orders as O on B.book_id=O.book_id 
group by b.book_id 