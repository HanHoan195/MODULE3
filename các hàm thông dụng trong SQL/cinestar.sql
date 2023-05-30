-- create database cinestar;
create table film(
idfilm int not null primary key,
filmname varchar(255) not null,
typeoffilm varchar(50) not null,
durationtime varchar(255)
);

create table room(
idroom int not null primary key,
roomname int not null,
seats int not null,
status varchar(255)
);

create table showtime(
idshowtime int not null primary key,
idroom int not null,
idfilm int not null,
starttime datetime,
endtime datetime,
status varchar(255),
foreign key(idroom) references room(idroom),
foreign key(idfilm) references film(idfilm)
);

create table seats(
id int not null primary key,
idroom int not null,
rowseat int not null,
colseat int not null,
foreign key (idroom) references room(idroom)
);

create table `order`(
idorder int not null primary key,
idcustomer int not null,
customername varchar(255),
total double not null,
dateorder datetime,
foreign key (idcustomer) references customer(idcustomer)
);


create table customer(
idcustomer int not null primary key,
customername varchar(255),
age datetime
);

create table ticket(
idticket int not null primary key,
idcustomer int not null,
idshowtime int not null,
filmname varchar(255) not null,
seat varchar(10) not null,
total double not null,
foreign key (idcustomer) references customer(idcustomer),
foreign key (idshowtime) references showtime(idshowtime)
);




