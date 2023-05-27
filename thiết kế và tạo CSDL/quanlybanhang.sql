-- create database quanlybanhang;

create table customer(
cid int not null primary key auto_increment,
cname varchar(255) not null,
cage int not null
);

create table Order1(
oid int primary key auto_increment,
cid int not null,
odate datetime,
ototalprice double not null,
foreign key(cid) references customer(cid)
);

create table product(
pid int not null primary key auto_increment,
pname varchar(255) not null,
pprice double not null
);

create table orderdetail(
oid int not null,
pid int not null,
odqty int not null default 1,
foreign key (oid) references order1(oid),
foreign key (pid) references product(pid)
);