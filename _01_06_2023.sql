-- https://western-appeal-39b.notion.site/GenTech-Jun-1-2023-6e155fabc0b94466bbaab0f30c62e01a 

-- Выполнить расчет З/П менеджеров за весь период заказов из расчета ставки в 10%
select 
	Employees.LastName,
    Employees.FirstName,
    count(*) as total_order,
    count(*) * 0.1 as salary
from Orders
inner join Employees
on Orders.EmployeeID = Employees.EmployeeID
group by Orders.EmployeeID;

-- Вывести сотрудников, у которых ко-во заказов менее 20
select
	Employees.LastName,
	Employees.FirstName,
    count(*) as total_orders
from Orders 
inner join Employees
on Orders.EmployeeID = Employees.EmployeeID
group by Orders.EmployeeID
having total_orders <= 20
order by total_orders desc;

-- Вывести названия компаний-перевозчиков и сколько заказов каждая из них доставила
select
	Suppliers.SupplierName,
    count(*) total_orders
from OrderDetails
inner join Products
on OrderDetails.ProductID = Products.ProductID
inner join Suppliers
on Products.SupplierID = Suppliers.SupplierID
group by OrderDetails.OrderID;

-- Для клиентов из Mexico очистить контактные имена
set sql_safe_updates = 0;
update Customers
set ContactName= ""
where Country = "Mexico";
set sql_safe_updates = 1;

-- Описать связи между таблицами, напр., след. образом:
-- Orders.CustomerID (M:1) Customers.CustomerID
create table Orders (
	OrderID integer primary key auto_increment,
    CustomerID integer,
    foreign key (CustomerID) references Customers(CustomerID)
);
create table Customers (
	CustomerID integer primary key auto_increment
);