create database if not exists hotel;

use hotel;

-- Клієнт
CREATE TABLE client (
    id_client INT auto_increment PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    date_of_birth INT NOT NULL,
    passport_number INT NOT NULL UNIQUE
);

-- Номер телефона
CREATE TABLE phone_number (
    id_client INT auto_increment PRIMARY KEY,
    phone_number INT NOT NULL UNIQUE
);

-- Розцінка
CREATE TABLE price (
    room_type VARCHAR(255) PRIMARY KEY,
    price_per_day INT NOT NULL
);

-- Кімната
CREATE TABLE room (
    room_number INT PRIMARY KEY,
    number_sleeping_places INT NOT NULL,
    room_type VARCHAR(255) NOT NULL,
    FOREIGN KEY (room_type) REFERENCES price(room_type)
);

-- Розцінка
CREATE TABLE rent (
	room_number INT NOT NULL,
    id_client INT NOT NULL,
    PRIMARY KEY (room_number, id_client),
    check_in DATETIME NOT NULL,
    check_out DATETIME NOT NULL,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (room_number)  REFERENCES room(room_number)
);

CREATE INDEX idx_name ON client (name);
CREATE INDEX idx_surname ON client (surname);
CREATE INDEX idx_date_of_birth ON client (date_of_birth);
CREATE INDEX idx_room_type ON room (room_type);
CREATE INDEX idx_phone_number ON phone_number (phone_number);




