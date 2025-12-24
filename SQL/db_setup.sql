create database pizza_delivery_db;
use pizza_delivery_db;

CREATE TABLE order_details (
    order_details_id INTEGER NOT NULL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    pizza_id VARCHAR(14) NOT NULL,
    quantity INTEGER NOT NULL
);

CREATE TABLE orders (
    order_id INTEGER NOT NULL PRIMARY KEY,
    date DATE NOT NULL,
    time VARCHAR(8) NOT NULL
);

CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(12) NOT NULL PRIMARY KEY,
    name VARCHAR(42) NOT NULL,
    category VARCHAR(7) NOT NULL,
    ingredients VARCHAR(97) NOT NULL
);

CREATE TABLE pizzas (
    pizza_id VARCHAR(14) NOT NULL PRIMARY KEY,
    pizza_type_id VARCHAR(12) NOT NULL,
    size VARCHAR(3) NOT NULL,
    price NUMERIC(5 , 2 ) NOT NULL
);

select count(*) from order_details