#Create a database name person and create the tables

CREATE DATABASE person;

USE person;

CREATE TABLE Users(
	user_id INT PRIMARY KEY,
	username VARCHAR(15),
	password VARCHAR(15),
	email VARCHAR(20)
);

CREATE TABLE Summary(
	id INT PRIMARY KEY,
	total_users INT,
	Yahoo INT,
	Hotmail INT,
	Gmail INT
);

DELIMITER //

CREATE PROCEDURE insert_data_into_users(IN user_id INT, IN username VARCHAR(15), IN password VARCHAR(15), IN email VARCHAR(20) )
    BEGIN
    INSERT INTO Users VALUES (user_id, username, password, email);
    END //


DELIMITER ;


call insert_data_into_users(1, 'ali', 'max', 'am@gmail.com');

call insert_data_into_users(2, 'super', 'user1', 'sup@gmail.com');

call insert_data_into_users(3, 'fast', 'exam12', 'fast123@gmail.com');

call insert_data_into_users(4, 'nawaz', 'vpn68', 'ns420@gmail.com');
