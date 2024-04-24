CREATE TABLE Coffee_inventory(
SKU varchar(200),
name_ varchar(25),
types_of_roast varchar(6),
pounds_on_hand decimal,
organic char(2),
low_acid char(2),
price_per_lb decimal
);
CREATE TABLE sales_transaction(
receipt_id bigserial,
sale_amount decimal,
sale_type varchar(8),
transaction_date timestamp
);
CREATE TABLE Store(	
Store_id bigserial,
store_manager varchar(100),
phone_number char(13),
street_address varchar(45),
city varchar(30),
zip char(5),
state char(2)
);