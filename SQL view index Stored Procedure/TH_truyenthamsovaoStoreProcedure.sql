delimiter // 
create procedure getcusbyid
-- tham số loại in
(in cusnum int(11))
begin
select * from customers where customerNumber = cusnum;
end //
delimiter ;

-- gọi store procedure
call getcusbyid(175);

-- tham số loại out
delimiter //
create procedure getcustomercountbycity(
in in_city varchar(50),
out total int
)
begin
select count(customernumber)
into total from customers where city = in_city;
end //
delimiter ;

-- tham số loại inout
delimiter //
create procedure setcounter(
inout counter int,
in inc int
)
begin 
set counter = counter+ inc;
end //









