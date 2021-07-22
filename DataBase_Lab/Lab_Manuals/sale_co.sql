/* CH07_SaleCo2.SQL                                    	*/
/* Script file for ORACLE 9iR2 DBMS			*/
/* This script file creates the following tables:	*/
/* VENDOR, PRODUCT, CUSTOMER, INVOICE, LINE		*/
/* and loads the default data rows			*/

DROP DATABASE IF EXISTS sales_co;

CREATE DATABASE sales_co;

USE sales_co;

CREATE TABLE VENDOR (
V_CODE 		INTEGER,
V_NAME 		VARCHAR(35) NOT NULL,
V_CONTACT 	VARCHAR(15) NOT NULL,
V_AREACODE 	CHAR(3) NOT NULL,
V_PHONE 	CHAR(8) NOT NULL,
V_STATE 	CHAR(2) NOT NULL,
V_ORDER 	CHAR(1) NOT NULL,
PRIMARY KEY (V_CODE));


CREATE TABLE PRODUCT (
P_CODE 	VARCHAR(10) PRIMARY KEY,
P_DESCRIPT 	VARCHAR(35) NOT NULL,
P_INDATE 	DATE NOT NULL,
P_ONHAND 	FLOAT NOT NULL,
P_MIN 		FLOAT NOT NULL,
P_PRICE 	FLOAT NOT NULL,
P_DISCOUNT 	FLOAT NOT NULL,
V_CODE 		INTEGER,
CONSTRAINT PRODUCT_V_CODE_FK FOREIGN KEY(V_CODE) REFERENCES VENDOR(V_CODE));

CREATE TABLE CUSTOMER (
CUS_CODE	 FLOAT PRIMARY KEY,
CUS_LNAME	 VARCHAR(15) NOT NULL,
CUS_FNAME	 VARCHAR(15) NOT NULL,
CUS_INITIAL	 CHAR(1),
CUS_AREACODE 	 CHAR(3) DEFAULT '615' NOT NULL,
CUS_PHONE	 CHAR(8) NOT NULL,
CUS_BALANCE	 FLOAT DEFAULT 0.00,
CONSTRAINT  CUS_UI1  UNIQUE(CUS_LNAME,CUS_FNAME));


CREATE TABLE INVOICE (
INV_NUMBER     	 FLOAT PRIMARY KEY,
CUS_CODE	 FLOAT NOT NULL REFERENCES CUSTOMER(CUS_CODE),
INV_DATE  	 DATE NOT NULL,
INV_SUBTOTAL     FLOAT,
INV_TAX          FLOAT,
INV_TOTAL        FLOAT);


CREATE TABLE LINE (
INV_NUMBER 	 FLOAT NOT NULL,
LINE_NUMBER	 FLOAT NOT NULL,
P_CODE		 VARCHAR(10) NOT NULL,
LINE_UNITS	 FLOAT DEFAULT 0.00 NOT NULL,
LINE_PRICE	 FLOAT DEFAULT 0.00 NOT NULL,
LINE_TOTAL       FLOAT,
PRIMARY KEY  (INV_NUMBER,LINE_NUMBER),
FOREIGN KEY  (INV_NUMBER) REFERENCES INVOICE(INV_NUMBER) ON DELETE CASCADE,
FOREIGN KEY  (P_CODE) REFERENCES PRODUCT(P_CODE),
CONSTRAINT  LINE_UI1  UNIQUE(INV_NUMBER, P_CODE));



/* VENDOR rows						*/
INSERT INTO VENDOR VALUES(21225,'Bryson, Inc.'    ,'Smithson','615','223-3234','TN','Y');
INSERT INTO VENDOR VALUES(21226,'SuperLoo, Inc.'  ,'Flushing','904','215-8995','FL','N');
INSERT INTO VENDOR VALUES(21231,'D&E Supply'     ,'Singh'   ,'615','228-3245','TN','Y');
INSERT INTO VENDOR VALUES(21344,'Gomez Bros.'     ,'Ortega'  ,'615','889-2546','KY','N');
INSERT INTO VENDOR VALUES(22567,'Dome Supply'     ,'Smith'   ,'901','678-1419','GA','N');
INSERT INTO VENDOR VALUES(23119,'Randsets Ltd.'   ,'Anderson','901','678-3998','GA','Y');
INSERT INTO VENDOR VALUES(24004,'Brackman Bros.'  ,'Browning','615','228-1410','TN','N');
INSERT INTO VENDOR VALUES(24288,'ORDVA, Inc.'     ,'Hakford' ,'615','898-1234','TN','Y');
INSERT INTO VENDOR VALUES(25443,'B&K, Inc.'      ,'Smith'   ,'904','227-0093','FL','N');
INSERT INTO VENDOR VALUES(25501,'Damal Supplies'  ,'Smythe'  ,'615','890-3529','TN','N');
INSERT INTO VENDOR VALUES(25595,'Rubicon Systems' ,'Orton'   ,'904','456-0092','FL','Y');

/* PRODUCT rows						*/
INSERT INTO PRODUCT VALUES('11QER/31','Power painter, 15 psi., 3-nozzle'     ,'2003-11-03',  8,  5,109.99,0.00,25595);
INSERT INTO PRODUCT VALUES('13-Q2/P2','7.25-in. pwr. saw blade'              ,'2003-12-13', 32, 15, 14.99,0.05,21344);
INSERT INTO PRODUCT VALUES('14-Q1/L3','9.00-in. pwr. saw blade'              ,'2003-11-13', 18, 12, 17.49,0.00,21344);
INSERT INTO PRODUCT VALUES('1546-QQ2','Hrd. cloth, 1/4-in., 2x50'            ,'2004-01-04', 15,  8, 39.95,0.00,23119);
INSERT INTO PRODUCT VALUES('1558-QW1','Hrd. cloth, 1/2-in., 3x50'            ,'2004-01-15', 23,  5, 43.99,0.00,23119);
INSERT INTO PRODUCT VALUES('2232/QTY','B&D jigsaw, 12-in. blade'            ,'2003-12-10',  8,  5,109.92,0.05,24288);
INSERT INTO PRODUCT VALUES('2232/QWE','B&D jigsaw, 8-in. blade'             ,'2003-12-24',  6,  5, 99.87,0.05,24288);
INSERT INTO PRODUCT VALUES('2238/QPD','B&D cordless drill, 1/2-in.'         ,'2004-01-20', 12,  5, 38.95,0.05,25595);
INSERT INTO PRODUCT VALUES('23109-HB','Claw hammer'                          ,'2004-01-20', 23, 10,  9.95,0.10,21225);
INSERT INTO PRODUCT VALUES('23114-AA','Sledge hammer, 12 lb.'                ,'2004-01-20',  8,  5, 14.40,0.05,NULL );
INSERT INTO PRODUCT VALUES('54778-2T','Rat-tail file, 1/8-in. fine'          ,'2003-12-15', 43, 20,  4.99,0.00,21344);
INSERT INTO PRODUCT VALUES('89-WRE-Q','Hicut chain saw, 16 in.'              ,'2004-02-17', 11,  5,256.99,0.05,24288);
INSERT INTO PRODUCT VALUES('PVC23DRT','PVC pipe, 3.5-in., 8-ft'              ,'2004-02-20',188, 75,  5.87,0.00,NULL );
INSERT INTO PRODUCT VALUES('SM-18277','1.25-in. metal screw, 25'             ,'2004-03-01',172, 75,  6.99,0.00,21225);
INSERT INTO PRODUCT VALUES('SW-23116','2.5-in. wd. screw, 50'                ,'2004-02-24',237,100,  8.45,0.00,21231);
INSERT INTO PRODUCT VALUES('WR3/TT3' ,'Steel matting, 4''x8''x1/6", .5" mesh','2004-01-07', 18,  5,119.95,0.10,25595);


/* CUSTOMER rows					*/
INSERT INTO CUSTOMER VALUES(10010,'Ramas'   ,'Alfred','A' ,'615','844-2573',0);
INSERT INTO CUSTOMER VALUES(10011,'Dunne'   ,'Leona' ,'K' ,'713','894-1238',0);
INSERT INTO CUSTOMER VALUES(10012,'Smith'   ,'Kathy' ,'W' ,'615','894-2285',345.86);
INSERT INTO CUSTOMER VALUES(10013,'Olowski' ,'Paul'  ,'F' ,'615','894-2180',536.75);
INSERT INTO CUSTOMER VALUES(10014,'Orlando' ,'Myron' ,NULL,'615','222-1672',0);
INSERT INTO CUSTOMER VALUES(10015,'O''Brian','Amy'   ,'B' ,'713','442-3381',0);
INSERT INTO CUSTOMER VALUES(10016,'Brown'   ,'James' ,'G' ,'615','297-1228',221.19);
INSERT INTO CUSTOMER VALUES(10017,'Williams','George',NULL,'615','290-2556',768.93);
INSERT INTO CUSTOMER VALUES(10018,'Farriss' ,'Anne'  ,'G' ,'713','382-7185',216.55);
INSERT INTO CUSTOMER VALUES(10019,'Smith'   ,'Olette','K' ,'615','297-3809',0);


/* INVOICE rows						*/
INSERT INTO INVOICE VALUES(1001,10014,'2004-01-16',  24.90,  1.99,  26.89);
INSERT INTO INVOICE VALUES(1002,10011,'2004-01-16',   9.98,  0.80,  10.78);
INSERT INTO INVOICE VALUES(1003,10012,'2004-01-16', 153.85, 12.31, 166.16);
INSERT INTO INVOICE VALUES(1004,10011,'2004-01-17',  34.97,  2.80,  37.77);
INSERT INTO INVOICE VALUES(1005,10018,'2004-01-17',  70.44,  5.64,  76.08);
INSERT INTO INVOICE VALUES(1006,10014,'2004-01-17', 397.83, 31.83, 429.66);
INSERT INTO INVOICE VALUES(1007,10015,'2004-01-17',  34.97,  2.80,  37.77);
INSERT INTO INVOICE VALUES(1008,10011,'2004-01-17', 399.15, 31.93, 431.08);

/* LINE rows						*/
INSERT INTO LINE VALUES(1001,1,'13-Q2/P2',1,  14.99,  14.99);
INSERT INTO LINE VALUES(1001,2,'23109-HB',1,   9.95,   9.95);
INSERT INTO LINE VALUES(1002,1,'54778-2T',2,   4.99,   9.98);
INSERT INTO LINE VALUES(1003,1,'2238/QPD',1,  38.95,  38.95);
INSERT INTO LINE VALUES(1003,2,'1546-QQ2',1,  39.95,  39.95);
INSERT INTO LINE VALUES(1003,3,'13-Q2/P2',5,  14.99,  74.95);
INSERT INTO LINE VALUES(1004,1,'54778-2T',3,   4.99,  14.97);
INSERT INTO LINE VALUES(1004,2,'23109-HB',2,   9.95,  19.90);
INSERT INTO LINE VALUES(1005,1,'PVC23DRT',12,  5.87,  70.44);
INSERT INTO LINE VALUES(1006,1,'SM-18277',3,   6.99,  20.97);
INSERT INTO LINE VALUES(1006,2,'2232/QTY',1, 109.92, 109.92);
INSERT INTO LINE VALUES(1006,3,'23109-HB',1,   9.95,   9.95);
INSERT INTO LINE VALUES(1006,4,'89-WRE-Q',1, 256.99, 256.99);
INSERT INTO LINE VALUES(1007,1,'13-Q2/P2',2,  14.99,  29.98);
INSERT INTO LINE VALUES(1007,2,'54778-2T',1,   4.99,   4.99);
INSERT INTO LINE VALUES(1008,1,'PVC23DRT',5,   5.87,  29.35);
INSERT INTO LINE VALUES(1008,2,'WR3/TT3' ,3, 119.95, 359.85);
INSERT INTO LINE VALUES(1008,3,'23109-HB',1,   9.95,   9.95);
