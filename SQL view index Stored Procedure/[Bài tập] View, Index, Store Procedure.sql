create table products(
id int not null primary key auto_increment,
productCode int not null,
productName varchar(255) not null,
productPrice double not null,
productAmount int not null,
productDescription varchar(255) not null,
productStatus int not null
); 

insert into products
values (3,'3', 'ip 13', 1100, 12, '128g', 1);


-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index idx_productcode 
on products (productCode);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index idx_name_price on products(productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products ;


-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view as
select productCode, productName, productPrice, productStatus
from products;

-- Tiến hành sửa đổi view
create or replace view product_view as
select productName, productPrice
from products;

-- Tiến hành xoá view
-- drop view product_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store procedure thêm một sản phẩm mới
USE `demo`;
DROP procedure IF EXISTS `addproduct`;

DELIMITER $$
USE `demo`$$
CREATE PROCEDURE `addproduct` (
	in new_id int,
	IN new_productCode int,
	IN new_productName varchar(255),
	IN new_productprice double,
	IN new_productAmount int,
	IN new_productDescription varchar(250),
	IN new_productStatus varchar(3)
    )
BEGIN
INSERT INTO `demo`.`products` (`id`, `productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`) 
VALUES (new_id,new_productCode, new_productName, new_productprice, new_productAmount, new_productDescription,new_productStatus);

END$$

DELIMITER ;


-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure updateproduct(
	in productid int,
	IN new_productCode int,
	IN new_productName varchar(255),
	IN new_productprice double,
	IN new_productAmount int,
	IN new_productDescription varchar(250),
	IN new_productStatus varchar(3)
)
begin 
update products
set productCode = new_productCode,
	productName = new_productName, 
	productPrice= new_productprice,
	productAmount =new_productAmount,
	productDescription=new_productDescription ,
	productStatus =new_productStatus
where id = productid;
end //
delimiter ;	

-- Tạo store procedure xoá sản phẩm theo id

delimiter //
create procedure deleteproduct(
in productid int
)
begin
delete from products 
where id = productid;
end //
delimiter ;





