use gt41_42e;
drop table customers;
create table customers (
	id integer primary key auto_increment,
    first_name varchar (120) not null,
    last_name varchar (120) not null,
    age integer check (age > 18),
    phone integer not null,
    order_name varchar (120) not null,
    delivery_status integer check (delivery_status in (1, 0))
);
alter table customers
drop column first_name,
drop column last_name;

alter table customers
add full_name varchar (120) not null;

alter table customers 
change column id customer_id integer auto_increment;

alter table customers
add price integer not null;

alter table customers
drop column phone;

alter table customers
change price sum_price integer not null;

insert into customers(full_name, age, order_name, delivery_status, sum_price) 
			values( "Kris Krill" , 20 , "math_book, pen" , 0 , 9000 ) ,
				( "Kristin Brooks" , 50 , "notebook, pen, drawing_block" , 0 , 4500 ) ,
				( "Kristina Livshits" , 55 , "pencil, sharpener" , 1 , 2340 ) ,
				( "Kristina Nunez" , 43 , "math_book, eng_book, phil_book" , 1 , 18000 ) ,
				( "Kurtis Parham" , 19 , "pencil" , 1 , 350 ) ,
				( "Lai Kurtich" , 22 , "pen, sharpener" , 1 , 1200 ) ,
				( "Lakia Fitzen" , 21 , "notebook, pen" , 1 , 3500 ) ,
				( "Landon Neville" , 34 , "colored papers, pencil" , 1 , 2450 ) ,
				( "Latoria Siprasoeuth" , 32 , "pen, sharpener, rubber" , 1 , 4600 ) ,
				( "Laurice Goffredo" , 76 , "watercolors, drawing_block" , 1 , 1200 ) ,
				( "Laurice Grimstead" , 54 , "notebook" , 1 , 4500 ) ,
				( "Laurice Karl" , 19 , "colored papers" , 0 , 2250 ) ,
				( "Laveta Wida" , 34 , "pen, math_book" , 0 , 1170 ) ,
				( "Lecia Alvino" , 45 , "pencil, sharpener, notebook" , 1 , 9000 ) ,
				( "Lenore Sullivan" , 55 , "eng_book, notebook" , 1 , 175 ) ,
				( "Leon Schoepfer" , 67 , "notebook" , 0 , 600 ) ,
				( "Lexie Magee" , 54 , "watercolors, drawing_block, brushes" , 0 , 1750 ) ,
				( "Li Robleto" , 76 , "brushes, pencil, notebook" , 0 , 1225 ) ,
				( "Libby Krauss" , 78 , "brushes, watercolor" , 0 , 2300 ) ,
				( "Lillia Talbott" , 65 , "eng_book, pen, rubber" , 0 , 600 ) ,
				( "Linda Merida" , 54 , "notebook, pen, drawing_block" , 1 , 7700 ) ,
				( "Lisa Hughes" , 34 , "flag" , 1 , 5450 ) ,
				( "Lloyd Shackley" , 23 , "brushes, watercolor" , 1 , 4370 ) ,
				( "Lola Whitley" , 24 , "notebook" , 0 , 12200 ) ,
				( "Lonnie Colby" , 74 , "notepad" , 1 , 3375 ) ,
				( "Lorilee Bautista" , 24 , "pencil, sharpener" , 1 , 3800 ) ,
				( "Loris Thibadeau" , 54 , "notepad" , 1 , 4950 ) ,
				( "Lorita Koenig" , 59 , "flag" , 0 , 4425 ) ,
				( "Love Whistlehunt" , 47 , "notepad" , 1 , 5500 ) ,
				( "Lovie Ritacco" , 23 , "colored papers" , 1 , 3800 ) ,
				( "Loyd Huckeba" , 26 , "flag" , 0 , 300 ) ,
				( "Loyd Puchalla" , 25 , "notebook" , 1 , 3850 ) ,
				( "Luana Berends" , 38 , "pencil, sharpener, rubber" , 1 , 2725 ) ,
				( "Lucas Summerill" , 36 , "notepad, pen" , 0 , 2185 ) ,
				( "Luciano Lingenfelter" , 80 , "sharpener" , 1 , 6100 ) ,
				( "Lucila Heck" , 58 , "brushes, watercolor" , 1 , 1687.5 ) ,
				( "Luigi Nored" , 23 , "notepad" , 1 , 1900 ) ,
				( "Luis Pothoven" , 38 , "flag" , 1 , 2475 ) ,
				( "Luther Ardinger" , 49 , "notebook" , 1 , 2212.5 ) ,
				( "Mable Ballard" , 59 , "colored papers, pencil" , 1 , 2750 ) ,
				( "Maia Leggett" , 71 , "notepad" , 1 , 1900 ) ,
				( "Marc Domanski" , 58 , "rubber, pencil" , 1 , 4930 ) ,
				( "Marco Slivka" , 80 , "brushes, watercolor" , 1 , 2680 ) ,
				( "Margaret Bennett" , 82 , "pencil, sharpener, pen" , 1 , 1600 ) ,
				( "Marissa Pontius" , 69 , "notebook" , 1 , 9430 ) ,
				( "Markita Larner" , 58 , "notepad, flag" , 1 , 605 ) ,
				( "Martha Baker" , 38 , "colored papers, notebook" , 1 , 1030 ) ,
				( "Marvis Chou" , 27 , "pencil, sharpener" , 0 , 2180 ) ,
				( "Mary Barnes" , 28 , "brushes, watercolor" , 0 , 1655 ) ,
				( "Mary Wilson" , 78 , "notebook" , 0 , 2730 );
     -- Д/З_1           
-- 14. Найти тех покупателей, у которых сумма заказа больше 4000 и меньше 8000.                
select * from customers
where sum_price between 4000 and 8000;

-- 16. Удалить записи тех покупателей, которые заказывали только тетради
set sql_safe_updates = 0;
delete from customers
where order_name = "notebook";
set sql_safe_updates = 1;

-- 17. Найти тех покупателей, которые заказывали math_book, но не eng_book.
select * from customers
where order_name like "%math_book%" && order_name not like "%eng_book%"; 

-- 19. Удалить записи тех покупателей, у которых имя начинается на букву L, а фамилия заканчивается на O.
set sql_safe_updates = 0;
delete from customers
where full_name like "L%o";
set sql_safe_updates = 1;

-- 20.	Сделать скидку на 10% для тех покупателей, у которых статус заказа 0. 
set sql_safe_updates = 0;
update customers
set sum_price = sum_price - (sum_price * 0.10)
where delivery_status = 0;
set sql_safe_updates = 1;

-- 21.	Сделать скидку на столько процентов, сколько лет покупателю, если ему меньше 30.
set sql_safe_updates = 0;
update customers
set sum_price = 
case
	when age < 30 then sum_price - (age / 100 * sum_price)
    else sum_price
end;
set sql_safe_updates = 1;

-- 22.	Удалить записи тех покупателей, у которых статус доставки 0.
set sql_safe_updates = 0;
delete from customers
where delivery_status = 0;
set sql_safe_updates = 1;

-- 23.	Увеличить сумму заказа на 5% для тех покупателей, которые заказывали цветные бумаги.
set sql_safe_updates = 0;
update customers
set sum_price = 
case
	when order_name like '%colored papers%' then sum_price + (sum_price * 0.05)
    else sum_price
end;
set sql_safe_updates = 1;

-- 24.	Удалить таблицу
drop table customers;

	-- Д/З_2 
use gt41_42e;
drop table employess;
create table employess (
employeeid integer primary key auto_increment,
    fname varchar(50) not null,
    lastname varchar(100) not null,
    email varchar(100) not null,
    phone varchar(15) not null
);
alter table employess
add salary numeric(9,2);
alter table employess
modify column salary integer;
alter table employess
change fname first_name varchar(20);
alter table employess
drop column phone;
alter table employess
add department varchar(20) not null;

alter table employess
change lastname last_name varchar (120) not null;

insert into employess(first_name, last_name, email, salary, department) values("Steven","King", "SKING", 24000, "Sales");
insert into employess(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employess(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employess(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employess(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employess(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employess(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employess(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employess(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employess(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employess(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employess(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employess(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employess(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employess(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employess(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employess(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employess(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employess(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employess(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employess(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employess(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employess(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employess(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employess(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employess(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employess(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employess(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employess(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employess(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employess(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employess(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employess(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");

-- 1.	Используем таблицу employees.
-- 	Нужно повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, для HR 20% и для IT 35%. 
-- 	Записать данные в поле new_salary. Поле создавать не нужно, используем AS. 
select *,
case
	when department = "Sales" then salary + (salary * 0.2)
    when department = "Finance" then salary + (salary * 0.15)
    when department = "Shipping" then salary + (salary * 0.1)
    when department = "Marketing" then salary + (salary * 0.25)
    when department = "Human Resources" then salary + (salary * 0.2)
    when department = "IT" then salary + (salary * 0.35)
end as new_salary
from employess;

-- 2.	Создать поле new_salary numeric(7, 2), заполнить.
alter table employess
add new_salary numeric (7, 2) not null;
set sql_safe_updates = 0;
update employess
set new_salary = 
case
when department = "Sales" then salary + (salary * 0.2)
    when department = "Finance" then salary + (salary * 0.15)
    when department = "Shipping" then salary + (salary * 0.1)
    when department = "Marketing" then salary + (salary * 0.25)
    when department = "Human Resources" then salary + (salary * 0.2)
    when department = "IT" then salary + (salary * 0.35)
    else salary
end;
set sql_safe_updates = 1;

-- 3.	Используем таблицу customers.
-- 	Создать поле sale integer. 
create table customers;
alter table customers
add sale integer;

-- 4.	Заполнить поле:
-- 	Если sum_price < 5000 скидка null, если больше/равно 5000 и меньше 10000, 
--  скидка  5, если больше/равно 10000, скидка 10.
set sql_safe_updates = 0;
update customers
set sale = 
case
	when sum_price < 5000 then null
    when sum_price < 10000 then 5
    else 10
end;
set sql_safe_updates = 1;

-- 5.	Создать поле final_price. Заполнить поле соответственно, сделав скидки.
alter table customers
add final_price integer;
set sql_safe_updates = 0;
update customers
set final_price = 
case
	when sum_price < 5000 then null
    when sum_price < 10000 then sum_price - (sum_price * 0.05)
    else sum_price - (sum_price * 0.1)
end;
set sql_safe_updates = 1;

-- 6.	В order_name поменять math_book на mathematics_book, eng_book на english_book.
set sql_safe_updates = 0;
update customers
set order_name = 
case
	when order_name like '%math_book%' then replace(order_name, "math_book", "mathematics_book")
    when order_name like '%eng_book%' then replace(order_name, "eng_book", "english_book") 
    else order_name
end;
set sql_safe_updates = 1;

-- 7.	Вывести случайные числа от 1 до 10.
select round(rand() * 10, 0) as rand;

-- 8.	Используем таблицу employees.
-- 	Имя и фамилию соединить в новое поле full_name.
alter table employess
change column first_name full_name varchar (120) not null;
set sql_safe_updates = 0;
update employess
set full_name = concat_ws(" ", full_name, last_name);
set sql_safe_updates = 1;
alter table employess
drop column last_name;

-- 9.	Поле email перевести в нижний регистр.
set sql_safe_updates = 0;
update employess
set email = lower(email);
set sql_safe_updates = 1;

-- 10. Используем бд sakila
use sakila;

-- 11. Используем таблицу film
-- В description слово beautiful заменить словом amazing.
set sql_safe_updates = 0;
update film
set description = 
case
	when description like '%beautiful%' then replace(description, "beautiful", "amazing")
    when description like '%Beautiful%' then replace(description, "Beautiful", "amazing")
    else description
end;
set sql_safe_updates = 1;

-- 12. Вывести поле title_len (количество символов поле title).
set sql_safe_updates = 0;
update film
set title = concat_ws(" - ", title, length(title));
set sql_safe_updates = 1;
alter table film
change column title title_len varchar (50) not null;
select title_len from film;