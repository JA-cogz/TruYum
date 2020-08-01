use [Menu List]
go

select * from [dbo].[Menu_Admin] --1.b
go 
 
select * from [dbo].[Menu_Cust] --5.a
go

select * from [dbo].[Cart]
go

select * from [dbo].[user_cart]
go



insert into [dbo].[Menu_Admin] values 
('Sandwich',99.00,'Yes','2017-03-15','Main Course','Yes',
'Edit'),
('Burger',129.00,'Yes','2017-12-23','Main Course','No',
'Edit'),
('Pizza',149.00,'Yes','2017-08-12','Main Course','No',
'Edit'),
('French Fries',57.00,'No','2017-07-02','Starters','Yes',
'Edit'),
('Chocolate Brownie',32.00,'Yes','2017-11-02','dessert','Yes',
'Edit')   --1.a
go
 
 insert into [dbo].[Menu_Cust] values 
(2,'Burger',129.00,'Main Course','No',
'Add to Cart'),
(3,'Pizza',149.00,'Main Course','No',
'Add to Cart')
go

 insert into [dbo].[Cart] values 
(6,'Sandwich',99.00,'Yes'),
(2,'Burger',129.00,'No'),
(3,'Pizza',149.00,'No')
go
 

 select [Name] from Menu_Items
 where Active = 'Yes'
 go		--2.a								

 select [Name] from Menu_Admin
 where id = 1
 go		--3.a

 Update Menu_Admin
 set [Name]= 'Paneer tikka',[Price] =100.00,
 [Active] ='No',Date_of_Launch = '2017-05-02',Category = 'Starters',
 Free_Delivery = 'Yes',[Action] = 'Edit'
 where id =1
 go						--3.b

 select sum(Price) as Total 
 from Cart
 go  --5.b

 create proc no_users (@user_id int,@menu_item_id int) as
 begin
	insert into user_cart([user_id],id_item)
	values (@user_id,@menu_item_id)
 end

 exec no_users 1,1
 exec no_users 1,2
 exec no_users 2,3
 go   --4.a

 create proc delete_item (@user_id int,@menu_item_id int) as
 begin
	delete from user_cart
	where [user_id] = @user_id and id_item = @menu_item_id
 end
 go   --6.a

 exec delete_item 1,1