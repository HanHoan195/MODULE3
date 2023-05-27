create database quanlydiemthi;
create table hocsinh(
mahs int primary key not null auto_increment,
tenhs varchar(255) not null,
monhoc varchar(255) not null,
ngaysinh datetime,
lop varchar(20),
gioitinh varchar(20)
);
create table monhoc(
mamh varchar(20) primary key,
tenmh varchar(50)
);
create table bangdiem(
mahs int,
mamh int ,
diemthi int,
ngaykt datetime,
primary key(mahs, mamh)
);
create table giaovien(
magv varchar(20) primary key,
tengv varchar(20),
sdt varchar(10)
);

alter table bangdiem
add foreign key (mamh) references monhoc(mamh);

alter table monhoc
MODIFY column mamh int;
alter table monhoc
add constraint FK_magv foreign key (magv) references giaovien(magv);

