/* creating/clearing database */
drop database HotelManager;
go
create database HotelManager;
go
use HotelManager;
go

/* Creating tables */

create table users(
	user_id int PRIMARY KEY identity(1, 1),
	username nvarchar(40) not null unique,
	password nvarchar(72) not null,
	name nvarchar(40) not null,
	surname nvarchar(40) not null,
	family nvarchar(40) not null,
	egn varchar(12) not null,
	telephone varchar(12) not null,
	email nvarchar(30) not null,
	hire_date datetime not null,
	active bit default 1,
	fire_date datetime default null
);

create table clients(
    client_id int PRIMARY KEY identity(1, 1),
	name nvarchar(40) not null,
	family nvarchar(40) not null,
	telephone varchar(12) not null,
	email nvarchar(10) not null,
	adult bit not null
);

create table rooms(
	room_id	int PRIMARY KEY identity(1, 1),
	capacity int not null,
	[type] varchar(10) not null CHECK ([type] IN('two_beds', 'apartaent', 'double_bed', 'penthaus', 'mezonet')),
	free bit default 1,
    bed_price_kid int not null,
	bed_price_adult int not null,
	number int
);

create table reservations(
	reservation_id int PRIMARY KEY identity(1, 1),
	room_id int not null foreign key references rooms(room_id),
	user_id int not null foreign key references users(user_id),
	begin_date datetime not null,
	end_date datetime not null,
	breakfast bit default 0,
	all_inclusive bit default 0,
	price int not null
);

create table reservations_clients(
	reservation_id int not null
		foreign key references reservations(reservation_id),
	client_id int not null
		foreign key references clients(client_id),
	primary key(reservation_id, client_id)
);


insert into users(username, password, name, surname, family, egn, telephone, email, hire_date)
values('egypt', 'osiris', 'Anna', 'Rock', 'Kein', '012345678', '088888888', 'none@mail.bg', GETDATE());
