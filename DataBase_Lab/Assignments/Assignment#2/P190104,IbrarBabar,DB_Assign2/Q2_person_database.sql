create database person;

USE PERSON;

CREATE TABLE USERS (
USER_ID MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
USERNAME VARCHAR(15) NOT NULL,
PASSWORD VARCHAR(20) NOT NULL,
EMAIL VARCHAR(30) NOT NULL,
PRIMARY KEY (USER_ID)
);
INSERT INTO USERS VALUES(1, 'ali', 'max', 'Am@GMAIL.COM');
INSERT INTO USERS VALUES(2,'super','user','sup@GMAIL.COM');
INSERT INTO USERS VALUES(3,'fast','exam12','fast123@GMAIL.COM');
INSERT INTO USERS VALUES(4,'nawaz','vpn68','nuces@yahoo.COM');
INSERT INTO USERS VALUES(5,'aslam','dopxyz','supreme@yahoo.COM');
INSERT INTO USERS VALUES(6,'rimsha','punjab','giki5@outlook.COM');
INSERT INTO USERS VALUES(7,'ibrar','hello','hyed@gamil.COM');


INSERT INTO SUMMARY VALUES(1,7,2,1,4);