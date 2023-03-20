

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(25) NOT NULL, 
	last_name VARCHAR(25) NOT NULL,
	phone_num VARCHAR(15) NOT NULL,
	email VARCHAR(50) NOT NULL,
	address VARCHAR(100) NOT NULL
);

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	serial_number VARCHAR(20) NOT NULL,
	make VARCHAR(20) NOT NULL,
	model VARCHAR(20) NOT NULL,
	customer_id INTEGER NOT NULL 
);

ALTER TABLE car 
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);


CREATE TABLE salesman(
	salesman_id SERIAL PRIMARY KEY,
	first_name VARCHAR(25) NOT NULL, 
	last_name VARCHAR(25) NOT NULL
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL 
);

CREATE TABLE service_mechanic(
	service_mechanic_id serial PRIMARY KEY,
	mechanic_id INTEGER NOT NULL, 
	service_ticket_id INTEGER NOT NULL
);

ALTER TABLE service_mechanic 
ADD FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id);

ALTER TABLE service_mechanic 
ADD FOREIGN KEY(service_ticket_id) REFERENCES service_ticket(service_ticket_id);

CREATE TABLE sales_invoice(
	invoice_id SERIAL PRIMARY KEY, 
	invoice_number VARCHAR(20) NOT NULL,
	date TIMESTAMP,
	price NUMERIC NOT NULL,
	car_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL, 
	salesman_id INTEGER NOT NULL
);

ALTER TABLE sales_invoice 
ADD FOREIGN KEY(car_id) REFERENCES car(car_id);

ALTER TABLE sales_invoice 
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);

ALTER TABLE sales_invoice 
ADD FOREIGN KEY(salesman_id) REFERENCES salesman(salesman_id);

CREATE TABLE service_ticket(
	service_ticket_id SERIAL PRIMARY KEY,
	service_ticket_num INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL, 
	date_received TIMESTAMP,
	service VARCHAR(200) NOT NULL, 
	date_return TIMESTAMP,
	parts VARCHAR(100) NOT NULL, 
	price_parts NUMERIC NOT NULL 
);

ALTER TABLE service_ticket 
ADD FOREIGN KEY(car_id) REFERENCES car(car_id);

ALTER TABLE service_ticket 
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);

ALTER TABLE service_ticket 
ADD FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id);

CREATE OR REPLACE PROCEDURE add_customer(
	first_name VARCHAR, 
	last_name VARCHAR,
	phone_num VARCHAR,
	email VARCHAR,
	address VARCHAR,
	car_id INTEGER
)
LANGUAGE plpgsql 
AS $$
BEGIN 
	INSERT INTO customer(
	customer_id,
	first_name, 
	last_name,
	phone_num,
	email,
	address)
	VALUES(
	customer_id?
	first_name, 
	last_name,
	phone_num,
	email,
	address);
END;
$$;

CALL add_customer(
	'Bob', 
	'Benbow',
	'555-222-3333',
	'bob@benbow.com',
	'123 Dance Rd'
);

CREATE OR REPLACE PROCEDURE add_car(
	make VARCHAR,
	model VARCHAR,
	customer_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO car(
	make,
	model,
	customer_id
) VALUES(serial_number,
	make,
	model,
	customer_id);
END;
$$;

CALL add_car(
	2004,
	'Ford',
	'Focus',
	'John', 
	'Dudin',
	863
);

INSERT INTO customer(
	first_name, 
	last_name,
	phone_num,
	email,
	address)
	VALUES(
	'Glen', 
	'Gilroy',
	555-111-3333,
	'glen@glenyeah.com',
	'55 Road St.'
	)
);

INSERT INTO customer(
	first_name, 
	last_name,
	phone_num,
	email,
	address)
	VALUES(
	'John',
	'Kelly',
	555-222-3333,
	'john@verizon.net',
	'66 Down St.'
	)
);


INSERT INTO car(
	serial_number,
	make,
	model,
	customer_id
) VALUES(
	2843,
	'Jeep',
	'Loredo',
	customer_id);
)

INSERT INTO car(
serial_number,
	make,
	model,
	customer_id
) VALUES(
	9988,
	'Toyota',
	'Tacoma',
	customer_id
)

INSERT INTO salesman(
	first_name,
	last_name
) VALUES(
	'Brian',
	'Stanton'
);

INSERT INTO salesman(
	first_name,
	last_name
) VALUES(
	'Billy',
	'Cooper'
);

INSERT INTO mechanic(
	first_name,
	last_name
) VALUES(
	'Jan',
	'Jiggles'
);

INSERT INTO mechanic(
	first_name,
	last_name
) VALUES(
	'Coppy',
	'Copperton'
);

INSERT INTO service_mechanic(
	invoice_number,
	date,
	price,
	car_id,
	customer_id, 
	salesman_id
) VALUES(
	378,
	'January 3',
	500,
	1,
	1,
	1
);

INSERT INTO service_machanic( 
	invoice_number,
	date,
	price,
	car_id,
	customer_id, 
	salesman_id
) VALUES(
	379,
	'January 5',
	1000,
	2,
	2,
	2
);

INSERT INTO sales_invoice(
	service_ticket_num,
	car_id,
	customer_id,
	mechanic_id, 
	date_received,
	service, 
	date_return,
	parts, 
	price_parts 
) VALUES(
	54,
	1,
	1,
	1,
	'January 3',
	'Check brakes',
	'January 5',
	'Brakes',
	80
);

INSERT INTO sales_invoice(
	service_ticket_num,
	car_id,
	customer_id,
	mechanic_id, 
	date_received,
	service, 
	date_return,
	parts, 
	price_parts 
) VALUES(
	55,
	2,
	2,
	2,
	'January 5',
	'Rotate tires',
	'January 7',
	'Tires',
	200
);

