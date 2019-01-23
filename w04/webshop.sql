CREATE TABLE customers(
	id int(8) PRIMARY KEY AUTO_INCREMENT,
	name varchar(32),
	address varchar(64)
);

CREATE TABLE orders(
	id int(8) PRIMARY KEY AUTO_INCREMENT,
	customer_id int(8),
	FOREIGN KEY (customer_id) REFERENCES customers(id),
	created timestamp,
	shipped timestamp
);

CREATE TABLE products(
	id int(8) PRIMARY KEY AUTO_INCREMENT,
	name varchar(32),
	price int(8)
);

CREATE TABLE order_details(
	order_id int(8),
	FOREIGN KEY (order_id) REFERENCES orders(id),
	product_id int(8),
	FOREIGN KEY (product_id) REFERENCES products(id)
);
