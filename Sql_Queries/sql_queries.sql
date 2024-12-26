CREATE TABLE animal (
    id INTEGER PRIMARY KEY,
    shelter_id INTEGER NOT NULL REFERENCES shelter(id) ON DELETE CASCADE ON UPDATE CASCADE,
    type INTEGER NOT NULL REFERENCES animal_type(id) ON DELETE CASCADE ON UPDATE CASCADE,
    breed_type INTEGER NOT NULL REFERENCES breed(id) ON DELETE CASCADE ON UPDATE CASCADE,
    age INTEGER NOT NULL,
    rate INTEGER,
    gender VARCHAR(10) NOT NULL,
    colour VARCHAR(15),
    cage_size VARCHAR(2),
    height FLOAT,
    weight FLOAT
);

CREATE TABLE shelter (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    email VARCHAR(150) NOT NULL
);

CREATE TABLE pet_accessories (
    shelter_id INTEGER NOT NULL REFERENCES shelter(id) ON DELETE CASCADE ON UPDATE CASCADE,
    item VARCHAR(100) NOT NULL,
    quantity BIGINT NOT NULL,
    price BIGINT NOT NULL
);

CREATE TABLE staff (
    id INTEGER PRIMARY KEY,
    shelter_id INTEGER NOT NULL REFERENCES shelter(id) ON DELETE CASCADE ON UPDATE CASCADE,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    password VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    contact_number BIGINT NOT NULL
);

CREATE TABLE donation (
    animal_id INTEGER NOT NULL REFERENCES animal(id) ON DELETE CASCADE ON UPDATE CASCADE,
    customer_id INTEGER NOT NULL REFERENCES customer(id) ON DELETE CASCADE ON UPDATE CASCADE,
    donation_info VARCHAR(150),
    date VARCHAR(100) NOT NULL,
    shelter_id INTEGER NOT NULL REFERENCES shelter(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE description (
    animal_id INTEGER NOT NULL REFERENCES animal(id) ON DELETE CASCADE ON UPDATE CASCADE,
    food_preferences VARCHAR(25),
    special_day VARCHAR(100)
);

CREATE TABLE breed (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE animal_type (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE customer (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(255),
    contact_number BIGINT NOT NULL
);

CREATE TABLE medication (
    breed_id INTEGER NOT NULL REFERENCES breed(id) ON DELETE CASCADE ON UPDATE CASCADE,
    allergies VARCHAR(100),
    veterinarian VARCHAR(100),
    vaccination_date VARCHAR(50) NOT NULL
);


# Adoption
Create Table adopt
(
	animal_id integer references animal(id) ON DELETE CASCADE ON UPDATE CASCADE,
	customer_id integer references customer(id) ON DELETE CASCADE ON UPDATE CASCADE,
	date varchar(50),
	payment_mode varchar(10)
);

-- Checking
select * from adopt limit 10;

select * from animal limit 10;

select * from animal_type;

select * from breed limit 10;

select * from customer limit 10;

select * from description limit 10;

select * from donation limit 10;

select * from medication limit 10;

select * from pet_accessories limit 10;

select * from shelter;

select * from staff limit 10;
