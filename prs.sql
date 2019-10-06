drop database if exists prs_db;
create database prs_db;
use prs_db;

create table user (
		id				int					primary key auto_increment unique,
		userName		varchar(20)			not null unique,
		passWord		varchar(10)			not null unique,
		firstName		varchar(20)			not null,
		lastName		varchar(20)			not null,
		phoneNumber		varchar(12)			not null,			
		Email			varchar(75)			not null,
		IsReviewer		tinyInt(1)			not null default (0),
		IsAdmin			tinyInt(1)			not null default (0)

);



Insert into user (username, password, firstname, lastname, phonenumber, email, isreviewer, isadmin) 
values ('dallen2', 'CatS@123', 'Debbie', 'Allen', '513-227-9021', 'dballen@gmail.zzz', '0', '0');
Insert into user (username, password, firstname, lastname, phonenumber, email, isreviewer, isadmin) 
values ('msand3', 'hulk@123', 'Michael', 'Sanders', '513-222-4594', 'msanders@gmail.zzz', '0', '0');



create table vendor (
	id 			int 			primary key auto_increment,
	code 		varchar(10) 	not null unique,
	name 		varchar(255) 	not null,
	Address 	varchar(255) 	not null,
	City		varchar(255)	not null,
    state		varchar(2)		not null,
    zip			varchar(5)		not null,
    phoneNumber varchar(12)		not null,
    Email		varchar(50)		not null
    );
    

    
Insert into vendor (code, name, address, city, state, zip, phoneNumber, Email) 
values ('001', 'Staples', '500 staples Dr', 'Framingham', 'MA', '01702', '508-253-5000', 'support@orders.staples.com');


create table request (
	id 					int 			primary key auto_increment,
	userID 				int(10) 		not null unique,
	Description			varchar(100) 	,
	Justification 		varchar(255) 	,
	Dateneeded			Date			,
    DeliveryMode		varchar(25)		,
    status				varchar(20)		,
    total 				Decimal(10,2)	,
    SubmittedDate		Datetime		,
    ReasonforRejection	varchar(100)	
    );
    
    Alter Table request
add foreign key (userid) References user(id);

insert into request (userID, Description, Justification, Dateneeded, DeliveryMode, status, total, submitteddate, reasonforrejection)
values ('1', 'smallred stapler', 'work desk', ('2022-04-20'), 'to office', 'active', '04.00', '2019-10-05', '');



create table Product (
	id 			int 			primary key auto_increment,
	vendorID 	int			 	not null,
	Partnumber 	varchar(50) 	not null unique,
	Name 		varchar(150) 	not null unique,
	price	 	Decimal(10,2)	not null,
    Unit		varchar(255)	not null,
    PhotoPath	varchar(255)
   );
   

    Alter Table Product
add foreign key (vendorID) References vendor(id);

    
    
    
Insert into product (vendorID, partnumber, Name, Price, Unit, Photopath) 
values ('1', 'ss123', 'red', '04.00', 'Slight stapler', 'C:\repos\sql-instruction\prs_db\shopping');
Insert into product (vendorID, partnumber, Name, Price, Unit, Photopath) 
values ('1', 'ss124', 'green', '04.00', 'Slight stapler', 'C:\repos\sql-instruction\prs_db\shopping2');


    
create table Lineitem (
id				int		primary key auto_increment,
requestID		int		unique,
productID		int		unique,
quantity		int		


);

insert into lineitem (requestId, productID, quantity)
values ( '1', '1', '1');

Alter Table lineitem
add foreign key (requestid) References request(id);

Alter table lineitem
add foreign key (productID) References product(id);

Drop user if exists prs_user@localhost;
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;


 







