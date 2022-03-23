drop database if exists SalesandProduct;
create database if not exists SalesandProduct;
use SalesandProduct;

drop table if exists SalesPeople;
create table if not exists  SalesPeople (
Snum int not null auto_increment ,
Sname varchar(15) not null ,
city varchar(10) not null ,
comm int not null default 1,
primary key(Snum)
);

insert into SalesPeople values 
(1001 ,'Peel', 'London', 12);
insert into SalesPeople values
(null, 'Serres', 'Sanjose' ,13),
(null, 'Motika', 'Paris', 11),
(null, 'Rifkin', 'Barcelona' ,15),
(null, 'Axelrod','Newyork' ,10);
select * from SalesPeople;

drop table if exists Customers;
create table if not exists  Customers (
Cnum int unsigned auto_increment ,
Cname varchar(15) not null,
City varchar(15) not null,
Snum int,
primary key(Cnum),
constraint fk_SalesandProduct
foreign key (Snum) references SalesPeople(Snum)
);
desc customers;

insert into Customers values 
(2001, 'Hoffman', 'London',1001),
(null, 'Giovanni','Rome', 1003),
(null, 'Liu', 'Sanjose', 1002),
(null, 'Grass','Berlin', 1002),
(null, 'Clemens' ,'London', 1001),
(null, 'Cisneros', 'Sanjose', 1003),
(null, 'Pereira', 'Rome', 1004);
desc customers;
select * from Customers;

drop table if exists Orders;
create table if not exists  Orders (
Onum int unsigned auto_increment ,
Amt decimal(7,2),
Odate date not null default '00-00-0000',
Cnum int unsigned not null,
Snum int not null,
primary key(Onum),
foreign key (Cnum) references Customers(Cnum),
foreign key (Snum) references SalesPeople(Snum)
);
desc orders;

insert into Orders values 
(3001, 18.69, '1990-10-03', 2002, 1003);
insert into Orders values
(null, 767.19,'1990-10-03', 2001, 1001),
(null, 1900.10 ,'1990-10-03' ,2006, 1004),
(null,  5160.45, '1990-10-03', 2003 ,1002),
(null,  1098.16,'1990-10-03', 2005,1003),
(null, 1713.23,'1990-10-04', 2002 ,1003),
(null,  75.75,'1990-10-04', 2004, 1002),
(null,  4273.00, '1990-10-05', 2006, 1001),
(null,  1309.95,'1990-10-06', 2004 ,1002),
(null,  9891.88, '1990-10-06' ,2006, 1001);

select * from Orders;

select
sp.Snum as 'Salesman_id',
sp.Sname as 'Salesman_name',
sp.city as 'city_name',
sp.comm as 'Commission_amt',
cu.Cnum as 'Customer_id',
cu.Cname as 'Customer_name',
cu.city as 'customer_city',
o.Onum as 'order_name',
o.Amt as 'amount',
o.Odate as 'order_date'
from orders as o
inner join customers as cu
inner join SalesPeople as sp;

/* Count the number of Salesperson whose name begin with ‘a’/’A’  */
select count(*) from SalesPeople where Sname like 'a%';

 /* Display all the Salesperson whose all orders worth is more than Rs. 2000 */
SELECT Snum, Sname FROM SalesPeople sp WHERE 1 < (SELECT COUNT(*)  from Orders where Amt > 2000);

/* Count the number of Salesperson belonging to Newyork */
SELECT COUNT(*)  from SalesPeople where city like '%newyork';

/* Display the number of Salespeople belonging to London and belonging to Paris */
SELECT *  from SalesPeople where city in ('newyork','paris');

/* Display the number of orders taken by each Salesperson and their date of orders */

select
sp1.Snum as 'Salesman_id',
sp1.Sname as 'Salesman_name',
o1.Odate as 'order_date'
from orders as o1
inner join SalesPeople as sp1;

SELECT COUNT(*) FROM Salespeople sp where Sname= 'Axelrod';