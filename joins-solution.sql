--select * from addresses;
--1
select customers.first_name, customers.last_name, addresses.street, addresses.city, addresses.state, addresses.zip, addresses.address_type 
from customers join addresses
on "customers"."id" = "addresses"."customer_id";

--2
select orders.id, orders.total, orders.address_id, line_items.quantity, line_items.unit_price FROM orders JOIN line_items on "orders"."id" = "line_items"."order_id";

--3
select warehouse.warehouse, products.description from warehouse 
join warehouse_product 
on "warehouse"."id" = "warehouse_product"."warehouse_id"
join products 
on "products"."id" = "warehouse_product"."product_id"
where "products"."description" ILIKE 'cheetos';

--4
select warehouse.warehouse, products.description from warehouse 
join warehouse_product 
on "warehouse"."id" = "warehouse_product"."warehouse_id"
join products 
on "products"."id" = "warehouse_product"."product_id"
where "products"."description" ILIKE 'diet pepsi';

--5
select customers.first_name, customers.last_name, addresses.customer_id, count(addresses.customer_id)
from customers 
join addresses
on "customers"."id" = "addresses"."customer_id"
join orders
on "orders"."address_id" = "addresses"."customer_id"
group by "customers"."first_name", "customers"."last_name", "addresses"."customer_id";

--6
SELECT count(*) from "customers";

--7
select count(*) from "products";

--8
SELECT products.description, sum(warehouse_product.on_hand) FROM "products"
  JOIN warehouse_product
ON "warehouse_product"."product_id" = "products"."id"
where "products"."description" ILIKE 'diet pepsi'
group by "products"."description";
