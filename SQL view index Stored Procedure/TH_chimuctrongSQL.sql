-- tìm thông tin của khách hàng có tên là Land Of Toys Inc
select * from customers where customerName = 'Land of Toys Inc.';

-- EXPLAIN Query
explain select * from customers where customerName =  'Land of Toys Inc.';

-- thêm chỉ mục cho bảng customers
alter table customers add index idx_customername(customername);
explain select * from customers where customerName =  'Land of Toys Inc.';

--  Add index theo cặp 
alter table customers add index idx_fulname(contactfirstname, contactlastname);
explain select * from customers where contactFirstName = 'jean' or contactFirstName = 'king';

-- xóa index
alter table customers drop index idx_fulname;