use [Menu List]
go 

create table Menu_Admin
(
	id int Primary key NOT NULL identity(1,1),
	[Name] char(35),
	Price  decimal(5,2),
	Active char(3),
	Date_of_Launch Date,
	Category char(25),
	Free_Delivery char(3),
	[Action] char(4)
)
go

create table Cart
(
	id_cart_item int,
	_id_cart int Primary key identity(1,1),
	[Name] char(35),
	Price  decimal(5,2),
	Free_Delivery char(3),
	constraint fk_id_cart foreign key (id_cart_item)
	references Menu_Admin (id)
)
go

create table Menu_Cust
(
	_id int,
	[Name] char(35),
	Price  decimal(5,2),
	Category char(25),
	Free_Delivery char(3),
	[Action] char(20),
	constraint fk_id foreign key (_id)
	references Menu_Admin (id)
)
go

create table user_cart
(
	[user_id] int, --cart
	id_item int,	--Menu_Cust
	constraint [fk_user_id] foreign key ([user_id])
	references Cart (_id_cart),
	constraint [fk_id_item] foreign key ([id_item])
	references Menu_Admin (id)
)
go


drop table [dbo].[Cart]
drop table [dbo].[Menu_Cust]
drop table [dbo].[Menu_Admin]
drop table [dbo].[user_cart]
