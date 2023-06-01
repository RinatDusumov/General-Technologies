-- https://western-appeal-39b.notion.site/GenTech-May-25-2023-3ce6b4694cd94204b61700b60e8dd41f

-- Вывести ко-во заказов, которое компания Speedy Express доставила в Brazil.
select
	count(*) as totalNumberOfOrders
from Orders
inner join Customers
on Orders.CustomerID = Customers.CustomerID
inner join Shippers
on Orders.ShipperID = Shippers.ShipperID
where 
	Shippers.ShipperName= "Speedy Express"
	and
	Customers.Country = "Brazil";
    
-- На какую сумму было отправлено товаров клиентам в USA
select
	sum(Products.price * OrderDetails.Quantity) as totalAmountOfGoodsShippedToUSA
from OrderDetails
inner join Products
on OrderDetails.ProductID = Products.ProductID
inner join Orders
on OrderDetails.OrderID = Orders.OrderID
inner join Customers
on Orders.CustomerID = Customers.CustomerID
where Customers.Country = "USA";