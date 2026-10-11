SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS salon;
CREATE DATABASE salon;

\c salon;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    phone VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id) NOT NULL,
    service_id INT REFERENCES services(service_id) NOT NULL,
    time VARCHAR(20) NOT NULL
);

INSERT INTO services (service_id, name) VALUES 
(1, 'cut'),
(2, 'color'),
(3, 'perm'),
(4, 'style'),
(5, 'trim');
