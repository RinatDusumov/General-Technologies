use home_work_gentech;
create table schedule_of_classes(
	id integer primary key auto_increment,
    teacher_id integer,
    group_id integer,
    class_time character(5),
    foreign key(teacher_id) references teachers(id),
    foreign key(group_id) references list_of_groups(id)
);
create table teachers(
	id integer primary key auto_increment,
    full_name varchar(50),
    age integer
);
create table list_of_groups(
	id integer primary key auto_increment,
    group_name varchar(50),
    number_of_students integer
);
create table students(
	id integer primary key auto_increment,
    group_id integer,
    full_name varchar(50),
    age integer,
    foreign key(group_id) references list_of_groups(id)
);

-- Вывести имена студентов и названия групп, в которых они состоят
select
	t1.full_name, t2.group_name
from students t1
inner join list_of_groups t2
on t1.group_id = t2.id;