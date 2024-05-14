use hotel;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM phone_number WHERE id_client NOT IN (SELECT id_client FROM client);

-- Удалить записи об аренде для комнат, которые освободились раньше определенной даты:
DELETE FROM rent WHERE check_out < '2024-05-18';

-- Удалить типы комнат, которые не сдавались ни разу:
DELETE FROM room WHERE room_number NOT IN (SELECT DISTINCT room_number FROM rent);

-- Удалить клиентов, которые не снимали комнату:
DELETE FROM client WHERE id_client NOT IN (SELECT DISTINCT id_client FROM rent);

-- Удалить все записи о ценах:
DELETE FROM price;

-- Удалить всех клиентов, у которых нет номера телефона:
DELETE FROM client WHERE id_client NOT IN (SELECT DISTINCT id_client FROM phone_number);

-- Удалить аренду, которая длилась менее 2 дней:
DELETE FROM rent WHERE DATEDIFF(check_out, check_in) < 2;

-- Удалить комнаты, которые имеют более 3 спальных мест:
DELETE FROM room WHERE number_sleeping_places > 3;

select * from room;