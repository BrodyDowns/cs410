CREATE DATABASE IF NOT EXISTS car_rental;
USE car_rental;

DROP TABLE IF EXISTS Rental;
DROP TABLE IF EXISTS Car;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Model;
DROP TABLE IF EXISTS Client;


CREATE TABLE Client (
	client_code int PRIMARY KEY auto_increment,
    name varchar(100),
    license varchar(50),
    phone varchar(50)
);

CREATE TABLE Model (
	model_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name varchar(100),
    make varchar(100),
    size int,
    year int
);

CREATE TABLE Category (
	type varchar(50) PRIMARY KEY,
    fee decimal(5,2) UNIQUE
);


CREATE TABLE Car (
	car_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    plate varchar(20),
    miles integer,
    status varchar(10),
    model_id integer,
    FOREIGN KEY (model_id) REFERENCES Model (model_id)
);

CREATE TABLE Rental (
	rental_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    client_code int,
    car_id int,
    start_date datetime,
    end_date datetime,
    miles int,
    category_type varchar(50),
	FOREIGN KEY (category_type) REFERENCES Category (type),
    FOREIGN KEY (client_code) REFERENCES Client (client_code),
    FOREIGN KEY (car_id) REFERENCES Car (car_id)
);

//START DATA
// Catagory TABLE
insert into Category (type, fee) values ('economy', 30.00);
insert into Category (type, fee) values ('compact', 40.00);
insert into Category (type, fee) values ('mid-size', 50.00);
insert into Category (type, fee) values ('full-size', 60.00);
insert into Category (type, fee) values ('premium', 70.00);
insert into Category (type, fee) values ('luxury', 80.00);
	
// CLIENT TABLE
insert into Client (client_code, name, license, phone) values (1, 'Noak Guidetti', 'tVsRn6', '427-719-4294');
insert into Client (client_code, name, license, phone) values (2, 'Elisha Fife', 'mOu4HkqFF8Q', '774-711-3275');
insert into Client (client_code, name, license, phone) values (3, 'Kim Digle', 'vOXuDO5Be', '145-323-9951');
insert into Client (client_code, name, license, phone) values (4, 'Torrin Obee', 'idcKR6f', '466-163-8936');
insert into Client (client_code, name, license, phone) values (5, 'Deb Reoch', 'tjnFWDQ7sC', '177-291-8955');
insert into Client (client_code, name, license, phone) values (6, 'Timothee Grandham', 'ncirwlqBPJ', '606-174-6809');
insert into Client (client_code, name, license, phone) values (7, 'Lonnard MacKim', 'ypJKHu5Y', '863-643-8916');
insert into Client (client_code, name, license, phone) values (8, 'Frances Batiste', 'zAAfiq', '896-854-2851');
insert into Client (client_code, name, license, phone) values (9, 'Revkah Iffe', 'AroTXpkV0cqu', '368-601-4412');
insert into Client (client_code, name, license, phone) values (10, 'Gareth Campos', 'JpL2T5', '777-874-2656');
insert into Client (client_code, name, license, phone) values (11, 'Fletch Sewill', 'F5Ewck7R9d5', '431-402-9176');
insert into Client (client_code, name, license, phone) values (12, 'Steffane Elletson', 'oDoDeT5v', '249-532-8393');
insert into Client (client_code, name, license, phone) values (13, 'Lanny Bourthouloume', 'tZwexR88wK', '258-474-8306');
insert into Client (client_code, name, license, phone) values (14, 'Rabi Segrave', 'V5kC1XQ', '168-227-0102');
insert into Client (client_code, name, license, phone) values (15, 'Ezekiel Petticrow', 'PVOAjkemsY', '975-843-3067');
insert into Client (client_code, name, license, phone) values (16, 'Karlik Beaton', 'KLoCKqJPS', '554-710-1613');
insert into Client (client_code, name, license, phone) values (17, 'Salvador Pegrum', 'J970tI8ZV4O', '206-689-0504');
insert into Client (client_code, name, license, phone) values (18, 'Rowen Feighney', 'mfvPWitP', '940-402-3001');
insert into Client (client_code, name, license, phone) values (19, 'Ulrikaumeko Scrinage', 'nBUdB7DmwKb', '323-122-8991');
insert into Client (client_code, name, license, phone) values (20, 'Perrine O''Rafferty', 'N2WhAMzULnS', '231-280-2505');


// MODEL TABLE
insert into Model (model_id, name, make, size, year) values (1, 'Ram 2500 Club', 'Dodge', 5125, 1997);
insert into Model (model_id, name, make, size, year) values (2, 'Town Car', 'Lincoln', 3775, 2011);
insert into Model (model_id, name, make, size, year) values (3, 'SLK-Class', 'Mercedes-Benz', 1256, 2000);
insert into Model (model_id, name, make, size, year) values (4, 'Riviera', 'Buick', 1148, 1991);
insert into Model (model_id, name, make, size, year) values (5, 'Continental', 'Bentley', 4045, 2009);
insert into Model (model_id, name, make, size, year) values (6, 'Sunbird', 'Pontiac', 3596, 1992);
insert into Model (model_id, name, make, size, year) values (7, 'Passport', 'Honda', 4654, 1996);
insert into Model (model_id, name, make, size, year) values (8, 'Mustang', 'Ford', 2972, 1987);
insert into Model (model_id, name, make, size, year) values (9, 'Seville', 'Cadillac', 1143, 2004);
insert into Model (model_id, name, make, size, year) values (10, 'Grand Prix', 'Pontiac', 4585, 1984);
insert into Model (model_id, name, make, size, year) values (11, 'Mazda3', 'Mazda', 1691, 2006);
insert into Model (model_id, name, make, size, year) values (12, '300ZX', 'Nissan', 5569, 1991);
insert into Model (model_id, name, make, size, year) values (13, 'Corsica', 'Chevrolet', 5767, 1996);
insert into Model (model_id, name, make, size, year) values (14, 'Firebird', 'Pontiac', 3586, 2001);
insert into Model (model_id, name, make, size, year) values (15, 'Monaco', 'Dodge', 5849, 1992);
insert into Model (model_id, name, make, size, year) values (16, 'LHS', 'Chrysler', 3458, 1995);
insert into Model (model_id, name, make, size, year) values (17, 'Corolla', 'Toyota', 1824, 1992);
insert into Model (model_id, name, make, size, year) values (18, 'Journey', 'Dodge', 2472, 2010);
insert into Model (model_id, name, make, size, year) values (19, 'Camaro', 'Chevrolet', 4980, 1974);
insert into Model (model_id, name, make, size, year) values (20, 'E-Class', 'Mercedes-Benz', 4394, 2000);
insert into Model (model_id, name, make, size, year) values (21, 'Somerset', 'Buick', 4230, 1987);
insert into Model (model_id, name, make, size, year) values (22, 'Grand Vitara', 'Suzuki', 5102, 1999);
insert into Model (model_id, name, make, size, year) values (23, 'Passport', 'Honda', 1320, 1999);
insert into Model (model_id, name, make, size, year) values (24, 'Navigator', 'Lincoln', 5857, 2007);
insert into Model (model_id, name, make, size, year) values (25, 'Eos', 'Volkswagen', 4510, 2009);
insert into Model (model_id, name, make, size, year) values (26, '600', 'BMW', 1642, 1959);
insert into Model (model_id, name, make, size, year) values (27, 'Avalon', 'Toyota', 2862, 2012);
insert into Model (model_id, name, make, size, year) values (28, 'Express', 'Chevrolet', 5716, 2009);
insert into Model (model_id, name, make, size, year) values (29, 'VUE', 'Saturn', 5341, 2010);
insert into Model (model_id, name, make, size, year) values (30, 'i-350', 'Isuzu', 5501, 2006);
insert into Model (model_id, name, make, size, year) values (31, 'Bronco', 'Ford', 3782, 1992);
insert into Model (model_id, name, make, size, year) values (32, 'Cabriolet', 'Volkswagen', 4327, 1988);
insert into Model (model_id, name, make, size, year) values (33, 'Escort', 'Ford', 1344, 1991);
insert into Model (model_id, name, make, size, year) values (34, 'Cube', 'Nissan', 2077, 2010);
insert into Model (model_id, name, make, size, year) values (35, 'G', 'Infiniti', 4640, 2009);
insert into Model (model_id, name, make, size, year) values (36, 'Veracruz', 'Hyundai', 5779, 2008);
insert into Model (model_id, name, make, size, year) values (37, 'GTI', 'Volkswagen', 1493, 1988);
insert into Model (model_id, name, make, size, year) values (38, 'Suburban 1500', 'GMC', 1267, 1995);
insert into Model (model_id, name, make, size, year) values (39, 'rio', 'Volkswagen', 4144, 2000);
insert into Model (model_id, name, make, size, year) values (40, 'Grand Prix', 'Pontiac', 2117, 1979);
insert into Model (model_id, name, make, size, year) values (41, 'RX', 'Lexus', 3476, 2013);
insert into Model (model_id, name, make, size, year) values (42, 'DB9', 'Aston Martin', 3504, 2008);
insert into Model (model_id, name, make, size, year) values (43, 'iQ', 'Scion', 3018, 2012);
insert into Model (model_id, name, make, size, year) values (44, 'RL', 'Acura', 3177, 2005);
insert into Model (model_id, name, make, size, year) values (45, 'LeSabre', 'Buick', 3406, 1993);
insert into Model (model_id, name, make, size, year) values (46, 'QX', 'Infiniti', 900, 2003);
insert into Model (model_id, name, make, size, year) values (47, 'Bronco II', 'Ford', 4268, 1986);
insert into Model (model_id, name, make, size, year) values (48, 'Phantom', 'Rolls-Royce', 5974, 2006);
insert into Model (model_id, name, make, size, year) values (49, 'Altima', 'Nissan', 3593, 1996);
insert into Model (model_id, name, make, size, year) values (50, 'Rio', 'Kia', 1884, 2002);
insert into Model (model_id, name, make, size, year) values (51, 'Silverado 2500', 'Chevrolet', 5954, 1999);
insert into Model (model_id, name, make, size, year) values (52, 'Corsica', 'Chevrolet', 3604, 1995);
insert into Model (model_id, name, make, size, year) values (53, 'Intrepid', 'Dodge', 3875, 2001);
insert into Model (model_id, name, make, size, year) values (54, 'RL', 'Acura', 1888, 1998);
insert into Model (model_id, name, make, size, year) values (55, 'GTI', 'Volkswagen', 5870, 1985);
insert into Model (model_id, name, make, size, year) values (56, 'Tribeca', 'Subaru', 1044, 2010);
insert into Model (model_id, name, make, size, year) values (57, 'Challenger', 'Mitsubishi', 3565, 2003);
insert into Model (model_id, name, make, size, year) values (58, 'C-Class', 'Mercedes-Benz', 1551, 1993);
insert into Model (model_id, name, make, size, year) values (59, 'XLR', 'Cadillac', 2998, 2004);
insert into Model (model_id, name, make, size, year) values (60, 'TL', 'Acura', 3963, 1998);
insert into Model (model_id, name, make, size, year) values (61, 'Type-1h', 'Aptera', 680, 2010);
insert into Model (model_id, name, make, size, year) values (62, 'Corrado', 'Volkswagen', 3223, 1993);
insert into Model (model_id, name, make, size, year) values (63, 'Yukon XL 2500', 'GMC', 3492, 2004);
insert into Model (model_id, name, make, size, year) values (64, 'E-Series', 'Ford', 653, 2002);
insert into Model (model_id, name, make, size, year) values (65, 'Tracker', 'Geo', 5026, 1996);
insert into Model (model_id, name, make, size, year) values (66, 'CL-Class', 'Mercedes-Benz', 5434, 2011);
insert into Model (model_id, name, make, size, year) values (67, 'A6', 'Audi', 501, 2002);
insert into Model (model_id, name, make, size, year) values (68, 'Q7', 'Audi', 5047, 2010);
insert into Model (model_id, name, make, size, year) values (69, 'Neon', 'Dodge', 1239, 2003);
insert into Model (model_id, name, make, size, year) values (70, 'Durango', 'Dodge', 4716, 2011);
insert into Model (model_id, name, make, size, year) values (71, 'Swift', 'Suzuki', 4165, 2005);
insert into Model (model_id, name, make, size, year) values (72, 'A3', 'Audi', 4294, 2008);
insert into Model (model_id, name, make, size, year) values (73, 'Camaro', 'Chevrolet', 4764, 1993);
insert into Model (model_id, name, make, size, year) values (74, 'Corolla', 'Toyota', 561, 2003);
insert into Model (model_id, name, make, size, year) values (75, 'Paseo', 'Toyota', 2058, 1995);
insert into Model (model_id, name, make, size, year) values (76, 'Mark LT', 'Lincoln', 1918, 2006);
insert into Model (model_id, name, make, size, year) values (77, 'X-Type', 'Jaguar', 1191, 2006);
insert into Model (model_id, name, make, size, year) values (78, 'Sunfire', 'Pontiac', 2185, 1999);
insert into Model (model_id, name, make, size, year) values (79, 'Previa', 'Toyota', 4618, 1994);
insert into Model (model_id, name, make, size, year) values (80, 'Trooper', 'Isuzu', 1743, 1998);
insert into Model (model_id, name, make, size, year) values (81, 'Ascender', 'Isuzu', 3256, 2008);
insert into Model (model_id, name, make, size, year) values (82, 'Express 2500', 'Chevrolet', 5807, 1999);
insert into Model (model_id, name, make, size, year) values (83, 'Celica', 'Toyota', 4623, 2005);
insert into Model (model_id, name, make, size, year) values (84, 'Focus', 'Ford', 559, 2005);
insert into Model (model_id, name, make, size, year) values (85, 'Camaro', 'Chevrolet', 1166, 1998);
insert into Model (model_id, name, make, size, year) values (86, 'S-Class', 'Mercedes-Benz', 1055, 1992);
insert into Model (model_id, name, make, size, year) values (87, 'Passat', 'Volkswagen', 509, 1992);
insert into Model (model_id, name, make, size, year) values (88, 'E-Class', 'Mercedes-Benz', 2479, 1993);
insert into Model (model_id, name, make, size, year) values (89, 'Ranger', 'Ford', 1858, 2002);
insert into Model (model_id, name, make, size, year) values (90, 'Vantage', 'Aston Martin', 3920, 2010);
insert into Model (model_id, name, make, size, year) values (91, 'W123', 'Mercedes-Benz', 4335, 1977);
insert into Model (model_id, name, make, size, year) values (92, '4Runner', 'Toyota', 1704, 2005);
insert into Model (model_id, name, make, size, year) values (93, 'GTI', 'Volkswagen', 1094, 1998);
insert into Model (model_id, name, make, size, year) values (94, 'Sonoma', 'GMC', 2096, 2000);
insert into Model (model_id, name, make, size, year) values (95, 'Beretta', 'Chevrolet', 4115, 1993);
insert into Model (model_id, name, make, size, year) values (96, 'S10', 'Chevrolet', 4024, 1992);
insert into Model (model_id, name, make, size, year) values (97, 'Canyon', 'GMC', 1775, 2009);
insert into Model (model_id, name, make, size, year) values (98, 'Arnage', 'Bentley', 726, 2006);
insert into Model (model_id, name, make, size, year) values (99, 'Regal', 'Buick', 2437, 1996);
insert into Model (model_id, name, make, size, year) values (100, 'D150 Club', 'Dodge', 2137, 1993);


//Cars TABLE
insert into Car (car_id, plate, miles, status, model_id) values (1, 'Un9nD3U', 94422, 'available', 28);
insert into Car (car_id, plate, miles, status, model_id) values (2, 'zFanckvbie', 88090, 'available', 20);
insert into Car (car_id, plate, miles, status, model_id) values (3, 'KJtqKkN', 109086, 'available', 11);
insert into Car (car_id, plate, miles, status, model_id) values (4, 'bU4Wdq', 186523, 'available', 40);
insert into Car (car_id, plate, miles, status, model_id) values (5, 'eBa2QvH1XBK', 112134, 'available', 66);
insert into Car (car_id, plate, miles, status, model_id) values (6, 'uN51nRJi', 74299, 'available', 83);
insert into Car (car_id, plate, miles, status, model_id) values (7, 'GX0XbmEe', 51001, 'available', 38);
insert into Car (car_id, plate, miles, status, model_id) values (8, '10UsuP', 28722, 'available', 4);
insert into Car (car_id, plate, miles, status, model_id) values (9, 'LrtaAb5ka', 81229, 'available', 68);
insert into Car (car_id, plate, miles, status, model_id) values (10, 'yThRh1b', 43334, 'available', 86);
insert into Car (car_id, plate, miles, status, model_id) values (11, '4jGKTnx', 54188, 'available', 83);
insert into Car (car_id, plate, miles, status, model_id) values (12, 'Iu7SYswa5xb', 38135, 'available', 26);
insert into Car (car_id, plate, miles, status, model_id) values (13, 'GoOE2mmD9D', 25150, 'available', 99);
insert into Car (car_id, plate, miles, status, model_id) values (14, 'hloLjnSzK96', 198456, 'available', 57);
insert into Car (car_id, plate, miles, status, model_id) values (15, 'x1ln7HHbc41D', 39574, 'available', 82);
insert into Car (car_id, plate, miles, status, model_id) values (16, 'xCZIVz4OoEmm', 181834, 'available', 68);
insert into Car (car_id, plate, miles, status, model_id) values (17, 'scxGMUm4CaYk', 181082, 'available', 52);
insert into Car (car_id, plate, miles, status, model_id) values (18, '3NaB2PxFI23U', 66258, 'available', 2);
insert into Car (car_id, plate, miles, status, model_id) values (19, 'dSgDhugNhdv', 72992, 'available', 30);
insert into Car (car_id, plate, miles, status, model_id) values (20, 'G29DPeIdq', 80286, 'available', 91);
insert into Car (car_id, plate, miles, status, model_id) values (21, 'F1XT5Aern', 21342, 'available', 68);
insert into Car (car_id, plate, miles, status, model_id) values (22, 'u6oaShop', 183118, 'available', 87);
insert into Car (car_id, plate, miles, status, model_id) values (23, '63bYR8M', 1670, 'available', 64);
insert into Car (car_id, plate, miles, status, model_id) values (24, 'ZAGG2NgN1Nka', 130373, 'available', 22);
insert into Car (car_id, plate, miles, status, model_id) values (25, 'ZtyY6pmx', 74900, 'available', 2);
insert into Car (car_id, plate, miles, status, model_id) values (26, 'fn21jvQ', 197655, 'available', 55);
insert into Car (car_id, plate, miles, status, model_id) values (27, 'sj4rM6a', 163682, 'available', 24);
insert into Car (car_id, plate, miles, status, model_id) values (28, 'aAJKMQ', 183511, 'available', 49);
insert into Car (car_id, plate, miles, status, model_id) values (29, 'IRnukLnNeYT', 49592, 'available', 48);
insert into Car (car_id, plate, miles, status, model_id) values (30, 'ZiEBq3WMDp', 153191, 'available', 75);
insert into Car (car_id, plate, miles, status, model_id) values (31, 'K8aFlX6', 51728, 'available', 6);
insert into Car (car_id, plate, miles, status, model_id) values (32, 'h1OQFqJUV', 114056, 'available', 73);
insert into Car (car_id, plate, miles, status, model_id) values (33, 'AZGWfC', 127939, 'available', 62);
insert into Car (car_id, plate, miles, status, model_id) values (34, 'JbvktLGOleg', 97637, 'available', 52);
insert into Car (car_id, plate, miles, status, model_id) values (35, 'eTqJXUCNS', 127792, 'available', 64);
insert into Car (car_id, plate, miles, status, model_id) values (36, 'VvKw1G', 66170, 'available', 25);
insert into Car (car_id, plate, miles, status, model_id) values (37, 'j89FJO', 105127, 'available', 27);
insert into Car (car_id, plate, miles, status, model_id) values (38, 'yWABwIdg', 147266, 'available', 34);
insert into Car (car_id, plate, miles, status, model_id) values (39, 'CIuOTh2yBcPD', 108250, 'available', 28);
insert into Car (car_id, plate, miles, status, model_id) values (40, 'RbMdY7IcD', 179674, 'available', 99);
insert into Car (car_id, plate, miles, status, model_id) values (41, 'CDbDEfNhNzoU', 109819, 'available', 36);
insert into Car (car_id, plate, miles, status, model_id) values (42, 'KY8Xtofri6x', 58354, 'available', 8);
insert into Car (car_id, plate, miles, status, model_id) values (43, 'Nq6D5GaIYOpB', 180608, 'available', 72);
insert into Car (car_id, plate, miles, status, model_id) values (44, '5LnpLhLI', 100914, 'available', 2);
insert into Car (car_id, plate, miles, status, model_id) values (45, 'nlORvh', 106610, 'available', 74);
insert into Car (car_id, plate, miles, status, model_id) values (46, 'Irs08lqws', 138403, 'available', 39);
insert into Car (car_id, plate, miles, status, model_id) values (47, '7fZLJrrjJbrr', 144308, 'available', 28);
insert into Car (car_id, plate, miles, status, model_id) values (48, '7HzU68xi', 71772, 'available', 99);
insert into Car (car_id, plate, miles, status, model_id) values (49, 'TxsPAGM', 24820, 'available', 62);
insert into Car (car_id, plate, miles, status, model_id) values (50, '1yzAdPPsHzd', 130629, 'available', 36);
insert into Car (car_id, plate, miles, status, model_id) values (51, 'e3P6QmD', 111849, 'available', 79);
insert into Car (car_id, plate, miles, status, model_id) values (52, '6h9nbb3wqu', 74877, 'available', 80);
insert into Car (car_id, plate, miles, status, model_id) values (53, 'rGrVuU', 17764, 'available', 83);
insert into Car (car_id, plate, miles, status, model_id) values (54, 'XyyLV6tULzX', 50013, 'available', 27);
insert into Car (car_id, plate, miles, status, model_id) values (55, 'wc8VX8vjX', 13238, 'available', 18);
insert into Car (car_id, plate, miles, status, model_id) values (56, '4Q5L0ENMM', 173505, 'available', 28);
insert into Car (car_id, plate, miles, status, model_id) values (57, 'K5JWgKsCtdoZ', 20247, 'available', 34);
insert into Car (car_id, plate, miles, status, model_id) values (58, 'KVavxUj', 20519, 'available', 30);
insert into Car (car_id, plate, miles, status, model_id) values (59, 'adf7bi', 72033, 'available', 73);
insert into Car (car_id, plate, miles, status, model_id) values (60, 'JltUjKYfwFA', 161936, 'available', 87);
insert into Car (car_id, plate, miles, status, model_id) values (61, 'lx6i7VvxAoC', 151189, 'available', 27);
insert into Car (car_id, plate, miles, status, model_id) values (62, 'VndCPS', 27584, 'available', 1);
insert into Car (car_id, plate, miles, status, model_id) values (63, 'zRFMJPb', 172642, 'available', 19);
insert into Car (car_id, plate, miles, status, model_id) values (64, 'XvntDaBhjqe', 178582, 'available', 65);
insert into Car (car_id, plate, miles, status, model_id) values (65, 'F054j2I2', 193319, 'available', 10);
insert into Car (car_id, plate, miles, status, model_id) values (66, 'Mw7Ukqzk398O', 73233, 'available', 18);
insert into Car (car_id, plate, miles, status, model_id) values (67, 'mHTSMgCwk', 36239, 'available', 74);
insert into Car (car_id, plate, miles, status, model_id) values (68, 'wrBAd20t0', 122202, 'available', 56);
insert into Car (car_id, plate, miles, status, model_id) values (69, 'vkpwmvTe3x3Z', 14053, 'available', 48);
insert into Car (car_id, plate, miles, status, model_id) values (70, '9QV7yaf', 46968, 'available', 52);
insert into Car (car_id, plate, miles, status, model_id) values (71, 'bnvRhBPP3', 148903, 'available', 52);
insert into Car (car_id, plate, miles, status, model_id) values (72, '0pf1iU0', 63723, 'available', 61);
insert into Car (car_id, plate, miles, status, model_id) values (73, 'KBuYYA', 141202, 'available', 57);
insert into Car (car_id, plate, miles, status, model_id) values (74, 'qCAGFWRsKY', 147451, 'available', 1);
insert into Car (car_id, plate, miles, status, model_id) values (75, 'VnOYwfMWqe', 9695, 'available', 95);
insert into Car (car_id, plate, miles, status, model_id) values (76, 'WKV8eLCLDEy', 157473, 'available', 37);
insert into Car (car_id, plate, miles, status, model_id) values (77, 'kt9RnZGshWK', 88550, 'available', 42);
insert into Car (car_id, plate, miles, status, model_id) values (78, '6zDIVaCFO9Mm', 141333, 'available', 44);
insert into Car (car_id, plate, miles, status, model_id) values (79, 'H54OCcBN0', 20239, 'available', 22);
insert into Car (car_id, plate, miles, status, model_id) values (80, 'jjJGt6n60J', 96514, 'available', 50);
insert into Car (car_id, plate, miles, status, model_id) values (81, 'eVrwHAej7BR', 108686, 'available', 53);
insert into Car (car_id, plate, miles, status, model_id) values (82, 'QndpoYApNJdt', 115510, 'available', 19);
insert into Car (car_id, plate, miles, status, model_id) values (83, 'zuEIu1NI', 151812, 'available', 83);
insert into Car (car_id, plate, miles, status, model_id) values (84, '13xhYLWIo1DS', 158547, 'available', 50);
insert into Car (car_id, plate, miles, status, model_id) values (85, 'xLP2o8bl2F6', 104733, 'available', 72);
insert into Car (car_id, plate, miles, status, model_id) values (86, 'sJE8eEJB', 174518, 'available', 70);
insert into Car (car_id, plate, miles, status, model_id) values (87, 'ikCE1WhN63gm', 160317, 'available', 91);
insert into Car (car_id, plate, miles, status, model_id) values (88, 'u8VvOji99L', 196285, 'available', 93);
insert into Car (car_id, plate, miles, status, model_id) values (89, 'yafFk2Df', 9786, 'available', 24);
insert into Car (car_id, plate, miles, status, model_id) values (90, '5UAL6YIsK0i', 21010, 'available', 31);
insert into Car (car_id, plate, miles, status, model_id) values (91, '96Atjv', 36938, 'available', 86);
insert into Car (car_id, plate, miles, status, model_id) values (92, 'QDHbNH', 157649, 'available', 41);
insert into Car (car_id, plate, miles, status, model_id) values (93, 'RzxHUR', 175318, 'available', 34);
insert into Car (car_id, plate, miles, status, model_id) values (94, '5sxjGJ4VeZUU', 92694, 'available', 75);
insert into Car (car_id, plate, miles, status, model_id) values (95, 'mDaugsb', 95556, 'available', 20);
insert into Car (car_id, plate, miles, status, model_id) values (96, '6xz94OUorA', 148675, 'available', 84);
insert into Car (car_id, plate, miles, status, model_id) values (97, 'g6zfxdsH', 143899, 'available', 36);
insert into Car (car_id, plate, miles, status, model_id) values (98, 'gHqKRYD', 152906, 'available', 38);
insert into Car (car_id, plate, miles, status, model_id) values (99, '5JSBG1knmPx', 96650, 'available', 29);
insert into Car (car_id, plate, miles, status, model_id) values (100, '2vVT83h7yV', 106969, 'available', 72);
insert into Car (car_id, plate, miles, status, model_id) values (101, 'dmtYYt6E', 155925, 'available', 80);
insert into Car (car_id, plate, miles, status, model_id) values (102, '7dVi8l', 24591, 'available', 9);
insert into Car (car_id, plate, miles, status, model_id) values (103, 'SAEBth', 128630, 'available', 56);
insert into Car (car_id, plate, miles, status, model_id) values (104, 'LysgvzzEEYaM', 154415, 'available', 14);
insert into Car (car_id, plate, miles, status, model_id) values (105, 'HYZdaE5ReY', 159454, 'available', 18);
insert into Car (car_id, plate, miles, status, model_id) values (106, 'fINoVmsOuc', 70927, 'available', 93);
insert into Car (car_id, plate, miles, status, model_id) values (107, 'm2hoEH', 53418, 'available', 84);
insert into Car (car_id, plate, miles, status, model_id) values (108, '84mb15e', 36871, 'available', 27);
insert into Car (car_id, plate, miles, status, model_id) values (109, 'nZMe7cTK6y', 138807, 'available', 19);
insert into Car (car_id, plate, miles, status, model_id) values (110, 'wG0SY3XpMUMs', 189302, 'available', 51);
insert into Car (car_id, plate, miles, status, model_id) values (111, 'L4jGVCTNdX', 177445, 'available', 35);
insert into Car (car_id, plate, miles, status, model_id) values (112, '9nob9OXX1', 179810, 'available', 30);
insert into Car (car_id, plate, miles, status, model_id) values (113, 'jtzfLO', 96045, 'available', 99);
insert into Car (car_id, plate, miles, status, model_id) values (114, '3RxS0a5O', 96677, 'available', 42);
insert into Car (car_id, plate, miles, status, model_id) values (115, 'lmkE3gX', 183314, 'available', 64);
insert into Car (car_id, plate, miles, status, model_id) values (116, 'PY6GjgRAp0', 80504, 'available', 22);
insert into Car (car_id, plate, miles, status, model_id) values (117, '9u8EMHaj', 138029, 'available', 68);
insert into Car (car_id, plate, miles, status, model_id) values (118, '8vbhgGNCNl', 31912, 'available', 63);
insert into Car (car_id, plate, miles, status, model_id) values (119, 'Yqs2xwyU', 11059, 'available', 15);
insert into Car (car_id, plate, miles, status, model_id) values (120, 'WeUmUPM', 132481, 'available', 67);
insert into Car (car_id, plate, miles, status, model_id) values (121, 'zaYAXLiF', 86597, 'available', 34);
insert into Car (car_id, plate, miles, status, model_id) values (122, '4PBLsyGPHe9', 18825, 'available', 34);
insert into Car (car_id, plate, miles, status, model_id) values (123, 'iwGckEk', 10113, 'available', 12);
insert into Car (car_id, plate, miles, status, model_id) values (124, 'LMA80c', 75452, 'available', 17);
insert into Car (car_id, plate, miles, status, model_id) values (125, 'mlIoce3a', 97153, 'available', 63);
insert into Car (car_id, plate, miles, status, model_id) values (126, 'qFWfxsAEymkH', 105500, 'available', 34);
insert into Car (car_id, plate, miles, status, model_id) values (127, 'hvbRcrM5XgI', 47401, 'available', 55);
insert into Car (car_id, plate, miles, status, model_id) values (128, 'B5p4r1aNc', 179672, 'available', 74);
insert into Car (car_id, plate, miles, status, model_id) values (129, 'hqm2eRD', 15605, 'available', 29);
insert into Car (car_id, plate, miles, status, model_id) values (130, 'pAJ2bZ4YALd', 123577, 'available', 25);
insert into Car (car_id, plate, miles, status, model_id) values (131, 'hrouwHAczq', 28716, 'available', 53);
insert into Car (car_id, plate, miles, status, model_id) values (132, 'OdonvC8VoZf', 172552, 'available', 61);
insert into Car (car_id, plate, miles, status, model_id) values (133, 'T13bgn1kvza', 134476, 'available', 45);
insert into Car (car_id, plate, miles, status, model_id) values (134, 'dhQiulN', 86210, 'available', 69);
insert into Car (car_id, plate, miles, status, model_id) values (135, '9m0ZUj', 81591, 'available', 47);
insert into Car (car_id, plate, miles, status, model_id) values (136, 'o9TmRfPB', 166680, 'available', 16);
insert into Car (car_id, plate, miles, status, model_id) values (137, 'OF2Uv64', 8215, 'available', 26);
insert into Car (car_id, plate, miles, status, model_id) values (138, '3tJ0yWIfwyvt', 8692, 'available', 70);
insert into Car (car_id, plate, miles, status, model_id) values (139, 'pU2VRsI', 127903, 'available', 5);
insert into Car (car_id, plate, miles, status, model_id) values (140, '1tHLyKE2', 8322, 'available', 74);
insert into Car (car_id, plate, miles, status, model_id) values (141, 'JW34jgoN2ld', 110663, 'available', 81);
insert into Car (car_id, plate, miles, status, model_id) values (142, 'zAaGhhqB1c', 105070, 'available', 99);
insert into Car (car_id, plate, miles, status, model_id) values (143, '92Qq3y', 58871, 'available', 98);
insert into Car (car_id, plate, miles, status, model_id) values (144, '7Gs1s3K9p', 182895, 'available', 42);
insert into Car (car_id, plate, miles, status, model_id) values (145, 'wfzUXJ7hL', 51094, 'available', 38);
insert into Car (car_id, plate, miles, status, model_id) values (146, 'TQI8RkKceAp', 172587, 'available', 55);
insert into Car (car_id, plate, miles, status, model_id) values (147, 'F64paQx8', 62668, 'available', 13);
insert into Car (car_id, plate, miles, status, model_id) values (148, '5LZIrw6uNuP', 178488, 'available', 57);
insert into Car (car_id, plate, miles, status, model_id) values (149, '8tw8I2', 175040, 'available', 68);
insert into Car (car_id, plate, miles, status, model_id) values (150, '2kJnDq', 168148, 'available', 51);
insert into Car (car_id, plate, miles, status, model_id) values (151, '2UirbSIkf', 31350, 'available', 71);
insert into Car (car_id, plate, miles, status, model_id) values (152, '0J9RHv', 109885, 'available', 78);
insert into Car (car_id, plate, miles, status, model_id) values (153, 'pMGrARcZU', 10178, 'available', 55);
insert into Car (car_id, plate, miles, status, model_id) values (154, 'jCtwmVA', 73219, 'available', 30);
insert into Car (car_id, plate, miles, status, model_id) values (155, 'FuRoQqKEXfBj', 157805, 'available', 87);
insert into Car (car_id, plate, miles, status, model_id) values (156, 'Syfivqm', 16970, 'available', 77);
insert into Car (car_id, plate, miles, status, model_id) values (157, '4SsudHxg', 57617, 'available', 83);
insert into Car (car_id, plate, miles, status, model_id) values (158, 'frmFlQ', 134083, 'available', 86);
insert into Car (car_id, plate, miles, status, model_id) values (159, 'GGFsUM', 743, 'available', 44);
insert into Car (car_id, plate, miles, status, model_id) values (160, 'fbL2pdAYe', 75384, 'available', 24);
insert into Car (car_id, plate, miles, status, model_id) values (161, 'h3meRlX8oA', 103013, 'available', 87);
insert into Car (car_id, plate, miles, status, model_id) values (162, 'aR4jbegkf', 127054, 'available', 93);
insert into Car (car_id, plate, miles, status, model_id) values (163, 'NlvRg6Zgs', 184988, 'available', 99);
insert into Car (car_id, plate, miles, status, model_id) values (164, 'tdQk6BzEOYy', 68169, 'available', 33);
insert into Car (car_id, plate, miles, status, model_id) values (165, 'h8qmBQZvUz6', 173410, 'available', 73);
insert into Car (car_id, plate, miles, status, model_id) values (166, 'lOstgLsxfeXw', 105671, 'available', 9);
insert into Car (car_id, plate, miles, status, model_id) values (167, 'JxyqLzQY', 133957, 'available', 69);
insert into Car (car_id, plate, miles, status, model_id) values (168, 'SbVUJXZA', 31595, 'available', 33);
insert into Car (car_id, plate, miles, status, model_id) values (169, 'vTVO98gfLY', 115107, 'available', 61);
insert into Car (car_id, plate, miles, status, model_id) values (170, 'if5so9F', 185368, 'available', 4);
insert into Car (car_id, plate, miles, status, model_id) values (171, 'U8iYAHkeem1', 186956, 'available', 29);
insert into Car (car_id, plate, miles, status, model_id) values (172, 'x4T8pk75mN', 12075, 'available', 28);
insert into Car (car_id, plate, miles, status, model_id) values (173, 'GpBIgpxKI1D6', 159332, 'available', 55);
insert into Car (car_id, plate, miles, status, model_id) values (174, 'SiijCyuiKT6E', 7690, 'available', 92);
insert into Car (car_id, plate, miles, status, model_id) values (175, 'Z8xpBJDXgJ', 36395, 'available', 77);
insert into Car (car_id, plate, miles, status, model_id) values (176, 'dLgAOpR', 26302, 'available', 87);
insert into Car (car_id, plate, miles, status, model_id) values (177, 'XNsr3sT', 8645, 'available', 36);
insert into Car (car_id, plate, miles, status, model_id) values (178, 'Hp4RoZDt', 55255, 'available', 46);
insert into Car (car_id, plate, miles, status, model_id) values (179, 'r4iOZeavitx3', 129782, 'available', 25);
insert into Car (car_id, plate, miles, status, model_id) values (180, '0lnJ8njj', 74594, 'available', 61);
insert into Car (car_id, plate, miles, status, model_id) values (181, 'AgfLZoRrbc', 4055, 'available', 60);
insert into Car (car_id, plate, miles, status, model_id) values (182, 'O4l7uog4HlA', 68584, 'available', 1);
insert into Car (car_id, plate, miles, status, model_id) values (183, 'TdaffsDoc', 108222, 'available', 91);
insert into Car (car_id, plate, miles, status, model_id) values (184, 'M9lqUEAB', 125124, 'available', 36);
insert into Car (car_id, plate, miles, status, model_id) values (185, 'YFymgF', 112063, 'available', 2);
insert into Car (car_id, plate, miles, status, model_id) values (186, 'bCVQWq', 195513, 'available', 58);
insert into Car (car_id, plate, miles, status, model_id) values (187, 'Y0cKyEQ3ahIK', 171670, 'available', 44);
insert into Car (car_id, plate, miles, status, model_id) values (188, 'nTBgcc2', 65372, 'available', 98);
insert into Car (car_id, plate, miles, status, model_id) values (189, 'XZ2WxoAqH62', 30823, 'available', 5);
insert into Car (car_id, plate, miles, status, model_id) values (190, 'wfxJC3', 40095, 'available', 18);
insert into Car (car_id, plate, miles, status, model_id) values (191, 'UwklDgjzahf', 86975, 'available', 33);
insert into Car (car_id, plate, miles, status, model_id) values (192, '5QWqbuUiA', 138726, 'available', 79);
insert into Car (car_id, plate, miles, status, model_id) values (193, '1jZjHBZdYGf', 16003, 'available', 66);
insert into Car (car_id, plate, miles, status, model_id) values (194, 'r2C5E6O9', 180963, 'available', 68);
insert into Car (car_id, plate, miles, status, model_id) values (195, 'bo5Mk0', 66695, 'available', 19);
insert into Car (car_id, plate, miles, status, model_id) values (196, 'j4FJIp1F', 117452, 'available', 20);
insert into Car (car_id, plate, miles, status, model_id) values (197, '0moIGoOeA3', 44507, 'available', 10);
insert into Car (car_id, plate, miles, status, model_id) values (198, 'kXxVP5RsJ8T4', 75957, 'available', 97);
insert into Car (car_id, plate, miles, status, model_id) values (199, '9Ph4BiEAPQ', 158263, 'available', 40);
insert into Car (car_id, plate, miles, status, model_id) values (200, 'R1O2lGfl', 199121, 'available', 83);
insert into Car (car_id, plate, miles, status, model_id) values (201, 'TWqJVhC', 150931, 'available', 14);
insert into Car (car_id, plate, miles, status, model_id) values (202, 'JocL3RyCnVDv', 924, 'available', 88);
insert into Car (car_id, plate, miles, status, model_id) values (203, '4BMmVdcwv', 240, 'available', 5);
insert into Car (car_id, plate, miles, status, model_id) values (204, 'N6JNfZc', 178449, 'available', 59);
insert into Car (car_id, plate, miles, status, model_id) values (205, 'z63Axb4', 182826, 'available', 54);
insert into Car (car_id, plate, miles, status, model_id) values (206, 'pV7dL03jBed', 168072, 'available', 61);
insert into Car (car_id, plate, miles, status, model_id) values (207, 'fxavSiasA6u', 63532, 'available', 95);
insert into Car (car_id, plate, miles, status, model_id) values (208, 'n7oQvAGz1a', 66986, 'available', 26);
insert into Car (car_id, plate, miles, status, model_id) values (209, 'k53YKvpzuFx9', 176399, 'available', 46);
insert into Car (car_id, plate, miles, status, model_id) values (210, 'ptoDwNJO', 73773, 'available', 96);
insert into Car (car_id, plate, miles, status, model_id) values (211, 'HUyPBZj', 128943, 'available', 42);
insert into Car (car_id, plate, miles, status, model_id) values (212, 'I8IdYY', 182138, 'available', 51);
insert into Car (car_id, plate, miles, status, model_id) values (213, 'BQ6q3h', 122803, 'available', 39);
insert into Car (car_id, plate, miles, status, model_id) values (214, 'xMTZPDWlwr', 90486, 'available', 46);
insert into Car (car_id, plate, miles, status, model_id) values (215, 'DvMlXt', 127509, 'available', 65);
insert into Car (car_id, plate, miles, status, model_id) values (216, '4SBohhl6aG7', 57785, 'available', 22);
insert into Car (car_id, plate, miles, status, model_id) values (217, 'ERlPbs', 115424, 'available', 41);
insert into Car (car_id, plate, miles, status, model_id) values (218, 'MPIcRRll4', 168325, 'available', 33);
insert into Car (car_id, plate, miles, status, model_id) values (219, 'zsMWnOtX', 124003, 'available', 6);
insert into Car (car_id, plate, miles, status, model_id) values (220, 'oSXK77PPchH7', 131222, 'available', 60);
insert into Car (car_id, plate, miles, status, model_id) values (221, 'FctVxs0Q', 45477, 'available', 44);
insert into Car (car_id, plate, miles, status, model_id) values (222, 'XEw9Jwu1j', 50506, 'available', 10);
insert into Car (car_id, plate, miles, status, model_id) values (223, 'lhvg9rOE3qr', 86788, 'available', 97);
insert into Car (car_id, plate, miles, status, model_id) values (224, '0oz4cStGw7', 117184, 'available', 28);
insert into Car (car_id, plate, miles, status, model_id) values (225, 'uf6Emf', 66627, 'available', 80);
insert into Car (car_id, plate, miles, status, model_id) values (226, '1mGJhUz', 64809, 'available', 34);
insert into Car (car_id, plate, miles, status, model_id) values (227, 'WQlwz7wUeK', 134289, 'available', 40);
insert into Car (car_id, plate, miles, status, model_id) values (228, '4AngiAOtMMr', 138069, 'available', 38);
insert into Car (car_id, plate, miles, status, model_id) values (229, 'i2qK9XU1zqS', 45574, 'available', 18);
insert into Car (car_id, plate, miles, status, model_id) values (230, 'dmX58XRYn', 28444, 'available', 99);
insert into Car (car_id, plate, miles, status, model_id) values (231, 'VFhxoUZK', 41528, 'available', 91);
insert into Car (car_id, plate, miles, status, model_id) values (232, 'bF1Ma1', 136755, 'available', 13);
insert into Car (car_id, plate, miles, status, model_id) values (233, '1u1E8SJOxfB', 53022, 'available', 92);
insert into Car (car_id, plate, miles, status, model_id) values (234, 'rpzMib', 50740, 'available', 24);
insert into Car (car_id, plate, miles, status, model_id) values (235, 'N8aR3RJ', 104246, 'available', 90);
insert into Car (car_id, plate, miles, status, model_id) values (236, 'uCkcch4jV', 7079, 'available', 68);
insert into Car (car_id, plate, miles, status, model_id) values (237, 'gWQ2OYf', 180269, 'available', 81);
insert into Car (car_id, plate, miles, status, model_id) values (238, 'SPXNwKQp5', 146101, 'available', 17);
insert into Car (car_id, plate, miles, status, model_id) values (239, 'rPj6xjZHda', 61604, 'available', 61);
insert into Car (car_id, plate, miles, status, model_id) values (240, 'uK7NWllp', 10321, 'available', 71);
insert into Car (car_id, plate, miles, status, model_id) values (241, 'EQ99kFA', 161257, 'available', 59);
insert into Car (car_id, plate, miles, status, model_id) values (242, '3arqpo7', 115596, 'available', 86);
insert into Car (car_id, plate, miles, status, model_id) values (243, 'w8Ko1Udn0i', 112428, 'available', 4);
insert into Car (car_id, plate, miles, status, model_id) values (244, 'aOQ7VU', 190210, 'available', 17);
insert into Car (car_id, plate, miles, status, model_id) values (245, 'Tq9bDJ08jhE6', 99128, 'available', 67);
insert into Car (car_id, plate, miles, status, model_id) values (246, '0CBuP7rWtlz', 115161, 'available', 80);
insert into Car (car_id, plate, miles, status, model_id) values (247, 'iVK5ok', 116113, 'available', 31);
insert into Car (car_id, plate, miles, status, model_id) values (248, 'K8TetbUvBB5', 124030, 'available', 47);
insert into Car (car_id, plate, miles, status, model_id) values (249, 'e9COBPm2', 131122, 'available', 9);
insert into Car (car_id, plate, miles, status, model_id) values (250, 'Lb3Up9V11Wii', 48597, 'available', 69);
insert into Car (car_id, plate, miles, status, model_id) values (251, 'ILXsQltW6IJ', 22881, 'available', 44);
insert into Car (car_id, plate, miles, status, model_id) values (252, 'ha0zY3b', 57137, 'available', 68);
insert into Car (car_id, plate, miles, status, model_id) values (253, 'Sju3lMSSy', 34755, 'available', 38);
insert into Car (car_id, plate, miles, status, model_id) values (254, 'ULROiy07bf', 28565, 'available', 12);
insert into Car (car_id, plate, miles, status, model_id) values (255, 'hQ75TFHgeQ', 37260, 'available', 72);
insert into Car (car_id, plate, miles, status, model_id) values (256, 'nKLf9MJL', 105303, 'available', 13);
insert into Car (car_id, plate, miles, status, model_id) values (257, 'kqhgbuE', 182063, 'available', 33);
insert into Car (car_id, plate, miles, status, model_id) values (258, 'NCo9zrd02Br', 151534, 'available', 64);
insert into Car (car_id, plate, miles, status, model_id) values (259, 'YpvFhV4', 126712, 'available', 76);
insert into Car (car_id, plate, miles, status, model_id) values (260, 'UUYPC29', 197801, 'available', 2);
insert into Car (car_id, plate, miles, status, model_id) values (261, 'xQPBHKK', 170471, 'available', 15);
insert into Car (car_id, plate, miles, status, model_id) values (262, 'FdUB4r48au', 135374, 'available', 72);
insert into Car (car_id, plate, miles, status, model_id) values (263, 'YdS9AO8QcghM', 25236, 'available', 62);
insert into Car (car_id, plate, miles, status, model_id) values (264, '3xGZsxeZIYNj', 155646, 'available', 44);
insert into Car (car_id, plate, miles, status, model_id) values (265, 'X61oUp9Y5OEz', 92359, 'available', 84);
insert into Car (car_id, plate, miles, status, model_id) values (266, 'Cz2Yd2Er', 167369, 'available', 36);
insert into Car (car_id, plate, miles, status, model_id) values (267, 'u3U8e15', 65902, 'available', 36);
insert into Car (car_id, plate, miles, status, model_id) values (268, 'It6CQWViQ', 42354, 'available', 99);
insert into Car (car_id, plate, miles, status, model_id) values (269, '1EY9JGE', 158266, 'available', 9);
insert into Car (car_id, plate, miles, status, model_id) values (270, 'dYmJ4KTLfNR', 188663, 'available', 43);
insert into Car (car_id, plate, miles, status, model_id) values (271, 'ZbmlcjDnoIv', 156839, 'available', 65);
insert into Car (car_id, plate, miles, status, model_id) values (272, 'udrSIAD9', 120700, 'available', 21);
insert into Car (car_id, plate, miles, status, model_id) values (273, 'tw169x0P9X', 33611, 'available', 55);
insert into Car (car_id, plate, miles, status, model_id) values (274, 'O5318pf9qV', 65267, 'available', 6);
insert into Car (car_id, plate, miles, status, model_id) values (275, 'lTe8hPjJj0Ju', 158553, 'available', 77);
insert into Car (car_id, plate, miles, status, model_id) values (276, 'LVNrnYbh', 171886, 'available', 36);
insert into Car (car_id, plate, miles, status, model_id) values (277, 'Ek0OtLpZ', 192811, 'available', 96);
insert into Car (car_id, plate, miles, status, model_id) values (278, '96Fwtfz', 26727, 'available', 98);
insert into Car (car_id, plate, miles, status, model_id) values (279, 'zDGpFODmyYI', 192609, 'available', 12);
insert into Car (car_id, plate, miles, status, model_id) values (280, 'qe0O4to', 43981, 'available', 97);
insert into Car (car_id, plate, miles, status, model_id) values (281, 'EzrAKHiPB', 97863, 'available', 58);
insert into Car (car_id, plate, miles, status, model_id) values (282, 'vgNjjjeEAr1', 102967, 'available', 60);
insert into Car (car_id, plate, miles, status, model_id) values (283, 'eW6TvbX', 111149, 'available', 78);
insert into Car (car_id, plate, miles, status, model_id) values (284, 'pwLzrPyGS7', 9844, 'available', 77);
insert into Car (car_id, plate, miles, status, model_id) values (285, 'Ctsrouu', 173185, 'available', 14);
insert into Car (car_id, plate, miles, status, model_id) values (286, 'ExN6E8q', 181671, 'available', 56);
insert into Car (car_id, plate, miles, status, model_id) values (287, 'Lq955fRN3R', 101462, 'available', 67);
insert into Car (car_id, plate, miles, status, model_id) values (288, 'klTXIR7s7R3s', 44807, 'available', 51);
insert into Car (car_id, plate, miles, status, model_id) values (289, '1kXEiup', 161622, 'available', 81);
insert into Car (car_id, plate, miles, status, model_id) values (290, 'XnoTrpjRhB43', 75567, 'available', 9);
insert into Car (car_id, plate, miles, status, model_id) values (291, 'ltQxsSIa', 107912, 'available', 58);
insert into Car (car_id, plate, miles, status, model_id) values (292, '50dvBE4KR', 37933, 'available', 81);
insert into Car (car_id, plate, miles, status, model_id) values (293, 'fwTttt', 83803, 'available', 67);
insert into Car (car_id, plate, miles, status, model_id) values (294, 'gXW8h3aO', 133994, 'available', 62);
insert into Car (car_id, plate, miles, status, model_id) values (295, 'vqWB1H', 119515, 'available', 100);
insert into Car (car_id, plate, miles, status, model_id) values (296, 'wTO9TQLFi0', 71863, 'available', 92);
insert into Car (car_id, plate, miles, status, model_id) values (297, '35dH46oow8wQ', 115609, 'available', 49);
insert into Car (car_id, plate, miles, status, model_id) values (298, 'rq5uDHUcy', 156507, 'available', 95);
insert into Car (car_id, plate, miles, status, model_id) values (299, 'cz6ZgC9dTzBE', 132129, 'available', 93);
insert into Car (car_id, plate, miles, status, model_id) values (300, 'jAYGZ7Ecc', 27281, 'available', 36);
