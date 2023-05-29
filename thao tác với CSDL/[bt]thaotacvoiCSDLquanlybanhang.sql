-- Thêm dữ liệu vào trong 4 bảng 
insert into customer (cname, cage)
values('minhquan', 10),
('ngocoanh', 20),
('hongha', 50);

ALTER TABLE order1 MODIFY COLUMN odate DATE;

insert into order1(cid, odate)
values(1, '2006-03-21'),
(2,'2006-03-23'),
(1,'2006-03-16');	

insert into product(pname, pprice)
values ('may giat', 3),
		('tu lạnh' ,5),
		('dieu hòa', 7),
        ('quat',1),
        ('bep dien', 2);
        
insert into orderdetail(oid,pid, odqty)
values (1,1,3),
		(1,3,7),
		(1,4,2),
		(2,1,1),
		(3,1,8),
		(2,5,4),
		(2,3,3);
        
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oid, odate, ototalprice from order1;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cname, p.pname
from orderdetail odd join order1 o1 on odd.oid = o1.oid
join customer c on c.cid = o1.cid 
join product p on p.pid = odd.pid;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select cname from customer where cid not in (select cid from order1);-- truy vấn con	

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o1.oid, o1.odate, sum(od.odqty * p.pprice) as totalprice
from orderdetail od join order1 o1 on od.oid = o1.oid
join product p on od.pid = p.pid
group by o1.oid, o1.odate;

