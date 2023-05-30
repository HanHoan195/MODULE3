-- tạo view
create view customers_views as
select customernumber, customername, phone
from customers;

-- cập nhật view
create or replace view customer_views as
select customername, city, phone
from customers ;

-- xoóa view 
drop view customer_view;