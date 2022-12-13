USE oar8;

CREATE TABLE food_bank(
	fb_id INT PRIMARY KEY NOT NULL auto_increment,
	fb_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone_number VARCHAR(15) NOT NULL

)ENGINE = InnoDB;

CREATE TABLE address(
	address_id INT PRIMARY KEY NOT NULL auto_increment,
	street VARCHAR(100) NOT NULL,
	city VARCHAR(100) NOT NULL,
	state CHAR(2) NOT NULL,
	zip VARCHAR(5) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE food_bank_address(
	fk_fb_id INT NOT NULL,
	FOREIGN KEY (fk_fb_id)
	REFERENCES food_bank(fb_id),
	fk_address_id INT NOT NULL,
	FOREIGN KEY (fk_address_id)
	REFERENCES address(address_id)
)ENGINE = InnoDB;

CREATE TABLE volunteer(
	vol_id INT PRIMARY KEY NOT NULL auto_increment,
	first_name VARCHAR(15) NOT NULL,
	last_name VARCHAR(15) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone_number VARCHAR(15)NOT NULL,
	age VARCHAR(2) NOT NULL

)ENGINE = InnoDB;

CREATE TABLE food_bank_volunteer(
	fk_fb_id INT NOT NULL,
	FOREIGN KEY (fk_fb_id)
	REFERENCES food_bank(fb_id),
	fk_vol_id INT NOT NULL,
	FOREIGN KEY (fk_vol_id)
	REFERENCES volunteer(vol_id)
)ENGINE = InnoDB;

CREATE TABLE volunteer_address(
	fk_vol_id INT NOT NULL,
	FOREIGN KEY (fk_vol_id)
	REFERENCES volunteer(vol_id),
	fk_address_id INT NOT NULL,
	FOREIGN KEY (fk_address_id)
	REFERENCES address(address_id)
)ENGINE = InnoDB;

CREATE TABLE employee(
	employee_id INT PRIMARY KEY NOT NULL auto_increment,
	first_name VARCHAR(15) NOT NULL,
	last_name VARCHAR(15) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone_number VARCHAR(15)NOT NULL,
	age VARCHAR(2) NOT NULL,
	job_title VARCHAR(50) NOT NULL,
	salary VARCHAR(10) NOT NULL,
	fk_food_bank_id INT NOT NULL,
	FOREIGN KEY (fk_food_bank_id)
	REFERENCES food_bank(fb_id)

)ENGINE = InnoDB;

CREATE TABLE employee_address(
	fk_employee_id INT NOT NULL,
	FOREIGN KEY (fk_employee_id)
	REFERENCES employee(employee_id),
	fk_address_id INT NOT NULL,
	FOREIGN KEY (fk_address_id)
	REFERENCES address(address_id)
)ENGINE = InnoDB;

CREATE TABLE donation(
	donation_id INT PRIMARY KEY NOT NULL auto_increment,
	donation_name VARCHAR(50) NOT NULL,
	description VARCHAR(100) NOT NULL,
	fk_org_id INT,
	FOREIGN KEY (fk_org_id)
	REFERENCES org(org_id),
	fk_drive_id INT,
	FOREIGN KEY (fk_drive_id)
	REFERENCES food_drive(drive_id),
	fk_fb_id INT NOT NULL,
	FOREIGN KEY (fk_fb_id)
	REFERENCES food_bank(fb_id)

)ENGINE = InnoDB;

CREATE TABLE org(
	org_id INT PRIMARY KEY NOT NULL auto_increment,
	org_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone_number VARCHAR(15)NOT NULL,
	fk_address_id INT NOT NULL,
	FOREIGN KEY (fk_address_id)
	REFERENCES address(address_id)
	
)ENGINE = InnoDB;
CREATE TABLE item(
	item_id INT PRIMARY KEY NOT NULL auto_increment,
	item_name VARCHAR(50) NOT NULL,
	weight INT NOT NULL,
	expiration_date DATE NOT NULL,
	needs_refridgeration BOOLEAN NOT NULL,
	needs_frozen BOOLEAN NOT NULL,
	description VARCHAR(500),
	brand VARCHAR(50)

)ENGINE = InnoDB;

CREATE TABLE item_donation(
	fk_item_id INT NOT NULL,
	FOREIGN KEY (fk_item_id)
	REFERENCES item(item_id),
	fk_donation_id INT NOT NULL,
	FOREIGN KEY (fk_donation_id)
	REFERENCES donation(donation_id),
	item_quantity INT NOT NULL
)ENGINE = InnoDB;

CREATE TABLE food_drive(
	drive_id INT PRIMARY KEY NOT NULL auto_increment,
	description VARCHAR(500) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	fk_org_id INT NOT NULL,
	FOREIGN KEY (fk_org_id)
	REFERENCES org(org_id)

)ENGINE = InnoDB;

CREATE TABLE distribution(
	dist_id INT PRIMARY KEY NOT NULL auto_increment,
	description VARCHAR(500) NOT NULL,
	dist_date DATE NOT NULL,
	fk_address_id INT,
	FOREIGN KEY (fk_address_id)
	REFERENCES address(address_id),
	fk_fb_id INT NOT NULL,
	FOREIGN KEY (fk_fb_id)
	REFERENCES food_bank(fb_id),
	fk_pantry_id INT,
	FOREIGN KEY (fk_pantry_id)
	REFERENCES food_pantry(pantry_id)
)ENGINE = InnoDB;

CREATE TABLE food_pantry(
	pantry_id INT PRIMARY KEY NOT NULL auto_increment,
	pantry_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL,
	fk_address_id INT NOT NULL,
	FOREIGN KEY (fk_address_id)
	REFERENCES address(address_id),
	people_being_helped INT NOT NULL
)ENGINE = InnoDB;

CREATE TABLE food_box(
	box_id INT PRIMARY KEY NOT NULL auto_increment,
	box_name VARCHAR(50) NOT NULL,
	description VARCHAR(500) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE distribution_box(
	fk_dist_id INT NOT NULL,
	FOREIGN KEY (fk_dist_id)
	REFERENCES distribution(dist_id),
	fk_box_id INT NOT NULL,
	FOREIGN KEY (fk_box_id)
	REFERENCES food_box(box_id),
	box_quantity INT NOT NULL
)ENGINE = InnoDB;

CREATE TABLE box_item(
	fk_box_id INT NOT NULL,
	FOREIGN KEY (fk_box_id)
	REFERENCES food_box(box_id),
	fk_item_id INT NOT NULL,
	FOREIGN KEY (fk_item_id)
	REFERENCES item(item_id),
	item_quantity INT NOT NULL
)ENGINE = InnoDB;

select * from food_bank;
INSERT INTO food_bank(fb_name, email, phone_number)
VALUES('Greater Pittsburgh Community Food Bank','gpcfb@gmail.com','(412) 460-3663');
INSERT INTO food_bank(fb_name, email, phone_number)
VALUES('Second Harvest Food Bank of Northwest Pennsylvania','shfbnp@gmail.com','(814) 459-3663');
INSERT INTO food_bank(fb_name, email, phone_number)
VALUES('Kansas Food Bank','kfb@gmail.com','(316) 265-3663');
INSERT INTO food_bank(fb_name, email, phone_number)
VALUES('Feeding Tampa Bay','ftb@gmail.com','(813) 254-1190');
INSERT INTO food_bank(fb_name, email, phone_number)
VALUES('Houston Food Bank','hfb@gmail.com','(713) 223-3700');
INSERT INTO food_bank(fb_name, email, phone_number)
VALUES('San Antonio Food Bank','safb@gmail.com','(210) 337-3663');
INSERT INTO food_bank(fb_name, email, phone_number)
VALUES('North Texas Food Bank','ntfb@gmail.com','(214) 330-1396');
INSERT INTO food_bank(fb_name, email, phone_number)
VALUES('San Francisco-Marin Food Bank','sfmfb@gmail.com','(415) 282-1900');
INSERT INTO food_bank(fb_name, email, phone_number)
VALUES('Los Angeles Regional Food Bank','larfb@gmail.com','(323) 234-3030');
INSERT INTO food_bank(fb_name, email, phone_number)
VALUES('Feeding South Florida','fsf@gmail.com','(954) 518-1818');

select * from address;
INSERT INTO address(street, city, state, zip)
VALUES('5200 Enrique M. Barrera Pkwy', 'San Antonio', 'TX', '78227');
INSERT INTO address(street, city, state, zip)
VALUES('3677 Mapleshade Ln', 'Plano', 'TX', '75075');
INSERT INTO address(street, city, state, zip)
VALUES('535 Portwall St', 'Houston', 'TX', '77029');
INSERT INTO address(street, city, state, zip)
VALUES('1 N Linden St', 'Duquesne', 'PA', '15110');
INSERT INTO address(street, city, state, zip)
VALUES('900 Pennsylvania Ave', 'San Francisco', 'CA', '94107');
INSERT INTO address(street, city, state, zip)
VALUES('1507 Grimm Dr', 'Erie', 'PA', '16501');
INSERT INTO address(street, city, state, zip)
VALUES('2501 SW 32nd Terrace', 'Pembroke Park', 'FL', '33023');
INSERT INTO address(street, city, state, zip)
VALUES('1734 E 41st St', 'Los Angeles', 'CA', '33023');
INSERT INTO address(street, city, state, zip)
VALUES('1919 E Douglas Ave', 'Wichita', 'KS', '67221');
INSERT INTO address(street, city, state, zip)
VALUES('4702 Transport Drive Building #6', 'Tampa', 'FL', '33605');

select * from food_bank_address;
INSERT INTO food_bank_address(fk_fb_id, fk_address_id)
VALUES (6,1);
INSERT INTO food_bank_address(fk_fb_id, fk_address_id)
VALUES (7,2);
INSERT INTO food_bank_address(fk_fb_id, fk_address_id)
VALUES (5,3);
INSERT INTO food_bank_address(fk_fb_id, fk_address_id)
VALUES (1,4);
INSERT into food_bank_address(fk_fb_id, fk_address_id)
VALUES (8,5);
INSERT into food_bank_address(fk_fb_id, fk_address_id)
VALUES (2,6);
INSERT INTO food_bank_address(fk_fb_id, fk_address_id)
VALUES (10,7);
INSERT INTO food_bank_address(fk_fb_id, fk_address_id)
VALUES (9,8);
INSERT INTO food_bank_address(fk_fb_id, fk_address_id)
VALUES (3,9);
INSERT INTO food_bank_address(fk_fb_id, fk_address_id)
VALUES (4,10);

select * from volunteer;
INSERT INTO volunteer(first_name, last_name, email, phone_number, age)
VALUES('Oscar','Rodriguez','orodsa@gmail.com','(210) 742-5734','19');
INSERT INTO volunteer(first_name, last_name, email, phone_number, age)
VALUES('Bob','Richardson','brich@gmail.com','(210) 753-1356','49');
INSERT INTO volunteer(first_name, last_name, email, phone_number, age)
VALUES('Sam','Delac','samdsf@gmail.com','(210) 426-7837','33');
INSERT INTO volunteer(first_name, last_name, email, phone_number, age)
VALUES('Ross','Smith','rosssmith23@gmail.com','(210) 184-8548','22');
INSERT INTO volunteer(first_name, last_name, email, phone_number, age)
VALUES('Hector','Oladipo','heco333@gmail.com','(210) 634-6432','56');
INSERT INTO volunteer(first_name, last_name, email, phone_number, age)
VALUES('James','Wade','jwade56@gmail.com','(210) 742-4274','66');
INSERT INTO volunteer(first_name, last_name, email, phone_number, age)
VALUES('Louis','Popovich','pop4263@gmail.com','(210) 567-3247','47');
INSERT INTO volunteer(first_name, last_name, email, phone_number, age)
VALUES('Anne','Peppers','apep3@gmail.com','(210) 837-3786','37');
INSERT INTO volunteer(first_name, last_name, email, phone_number, age)
VALUES('Denise','Dillard','ddillard35@gmail.com','(210) 246-8734','47');
INSERT INTO volunteer(first_name, last_name, email, phone_number, age)
VALUES('Ben','Roethlisberger','bigben7@gmail.com','(210) 457-4115','26');

select * from food_bank_volunteer;
INSERT INTO food_bank_volunteer(fk_fb_id, fk_vol_id)
VALUES (1,6);
INSERT INTO food_bank_volunteer(fk_fb_id, fk_vol_id)
VALUES (2,6);
INSERT INTO food_bank_volunteer(fk_fb_id, fk_vol_id)
VALUES (3,6);
INSERT INTO food_bank_volunteer(fk_fb_id, fk_vol_id)
VALUES (4,6);
INSERT INTO food_bank_volunteer(fk_fb_id, fk_vol_id)
VALUES (5,6);
INSERT INTO food_bank_volunteer(fk_fb_id, fk_vol_id)
VALUES (6,6);
INSERT INTO food_bank_volunteer(fk_fb_id, fk_vol_id)
VALUES (8,6);
INSERT INTO food_bank_volunteer(fk_fb_id, fk_vol_id)
VALUES (9,6);
INSERT INTO food_bank_volunteer(fk_fb_id, fk_vol_id)
VALUES (10,6);
INSERT INTO food_bank_volunteer(fk_fb_id, fk_vol_id)
VALUES (7,6);

INSERT INTO address(street, city, state, zip)
VALUES('202 Oriole Ln', 'San Antonio', 'TX', '78228');
INSERT INTO address(street, city, state, zip)
VALUES('148 Belden Ave', 'San Antonio', 'TX', '78214');
INSERT INTO address(street, city, state, zip)
VALUES('158 Belden Ave', 'San Antonio', 'TX', '78214');
INSERT INTO address(street, city, state, zip)
VALUES('627 Blaine', 'San Antonio', 'TX', '78202');
INSERT INTO address(street, city, state, zip)
VALUES('358 E Huisache Ave', 'San Antonio', 'TX', '78212');
INSERT INTO address(street, city, state, zip)
VALUES('230 E Craig Pl', 'San Antonio', 'TX', '78212');
INSERT INTO address(street, city, state, zip)
VALUES('534 Ruiz St', 'San Antonio', 'TX', '78207');
INSERT INTO address(street, city, state, zip)
VALUES('229 Roberts St', 'San Antonio', 'TX', '78208');
INSERT INTO address(street, city, state, zip)
VALUES('11015 Reverie Ln', 'San Antonio', 'TX', '78216');
INSERT INTO address(street, city, state, zip)
VALUES('17814 Winter Hill', 'San Antonio', 'TX', '78258');

select * from volunteer_address;
INSERT INTO volunteer_address(fk_vol_id, fk_address_id)
VALUES (6,11);
INSERT INTO volunteer_address(fk_vol_id, fk_address_id)
VALUES (7,12);
INSERT INTO volunteer_address(fk_vol_id, fk_address_id)
VALUES (1,13);
INSERT INTO volunteer_address(fk_vol_id, fk_address_id)
VALUES (3,14);
INSERT INTO volunteer_address(fk_vol_id, fk_address_id)
VALUES (9,15);
INSERT INTO volunteer_address(fk_vol_id, fk_address_id)
VALUES (10,16);
INSERT INTO volunteer_address(fk_vol_id, fk_address_id)
VALUES (2,17);
INSERT INTO volunteer_address(fk_vol_id, fk_address_id)
VALUES (4,18);
INSERT INTO volunteer_address(fk_vol_id, fk_address_id)
VALUES (8,19);
INSERT INTO volunteer_address(fk_vol_id, fk_address_id)
VALUES (5,20);

select * from employee;
INSERT INTO employee(first_name, last_name, email, phone_number, age, job_title, salary, fk_food_bank_id)
VALUES('Robert','Martin','rbmao3@gmail.com','(210) 474-2468','59','President','120,000','1');
INSERT INTO employee(first_name, last_name, email, phone_number, age, job_title, salary, fk_food_bank_id)
VALUES('Quinn','Smith','sqtl56@gmail.com','(210) 465-2747','55','President','100650','2');
INSERT INTO employee(first_name, last_name, email, phone_number, age, job_title, salary, fk_food_bank_id)
VALUES('Mildred','Cortes','mcorts56@gmail.com','(210) 264-2747','49','President','110,000','3');
INSERT INTO employee(first_name, last_name, email, phone_number, age, job_title, salary, fk_food_bank_id)
VALUES('Fenella','Wardle','fward3@gmail.com','(210) 180-2306','47','President','100,000','4');
INSERT INTO employee(first_name, last_name, email, phone_number, age, job_title, salary, fk_food_bank_id)
VALUES('Cecilia','Walker','ceci63@gmail.com','(210) 400-4653','63','President','105,000','5');
INSERT INTO employee(first_name, last_name, email, phone_number, age, job_title, salary, fk_food_bank_id)
VALUES('Kirsten','Chaney','chane3y@gmail.com','(210) 467-3467','39','President','107,000','6');
INSERT INTO employee(first_name, last_name, email, phone_number, age, job_title, salary, fk_food_bank_id)
VALUES('Conan','Jones','conanjones@gmail.com','(210) 785-7237','58','President','104,000','7');
INSERT INTO employee(first_name, last_name, email, phone_number, age, job_title, salary, fk_food_bank_id)
VALUES('Virgil','Childs','ch1ld5@gmail.com','(210) 600-3794','46','President','115,000','8');
INSERT INTO employee(first_name, last_name, email, phone_number, age, job_title, salary, fk_food_bank_id)
VALUES('Jevan','Villanueva','jvilla5634@gmail.com','(210) 427-9590','55','President','160,000','9');
INSERT INTO employee(first_name, last_name, email, phone_number, age, job_title, salary, fk_food_bank_id)
VALUES('Arla','Turnbull','turnbullarla@gmail.com','(210) 135-8546','60','President','160,000','10');

select * from employee_address;
INSERT INTO employee_address(fk_employee_id, fk_address_id)
VALUES (9,1);
INSERT INTO employee_address(fk_employee_id, fk_address_id)
VALUES (4,2);
INSERT INTO employee_address(fk_employee_id, fk_address_id)
VALUES (7,3);
INSERT INTO employee_address(fk_employee_id, fk_address_id)
VALUES (10,4);
INSERT INTO employee_address(fk_employee_id, fk_address_id)
VALUES (3,5);
INSERT INTO employee_address(fk_employee_id, fk_address_id)
VALUES (1,6);
INSERT INTO employee_address(fk_employee_id, fk_address_id)
VALUES (5,7);
INSERT INTO employee_address(fk_employee_id, fk_address_id)
VALUES (2,8);
INSERT INTO employee_address(fk_employee_id, fk_address_id)
VALUES (8,9);
INSERT INTO employee_address(fk_employee_id, fk_address_id)
VALUES (6,10);

select * from donation;
INSERT INTO donation(donation_name, description, fk_drive_id, fk_fb_id)
VALUES('Cans from elementary school','Met goal of 1000 cans of food.',2,1);
INSERT INTO donation(donation_name, description, fk_drive_id, fk_fb_id)
VALUES('Water from private school','Met goal of 100 cases of water bottles',1,2);
INSERT INTO donation(donation_name, description, fk_drive_id, fk_fb_id)
VALUES('Produce from Charity Run','Some of the produce was eaten by insect and did not meet goal.',5,3);
INSERT INTO donation(donation_name, description, fk_drive_id, fk_fb_id)
VALUES('Cans from High School','Did not meet goal of 5000 cans of food.',6,4);
INSERT INTO donation(donation_name, description, fk_drive_id, fk_fb_id)
VALUES('Food from Sporting Event','Met goal of 500 pounds of food.',4,5);
INSERT INTO donation(donation_name, description, fk_org_id, fk_fb_id)
VALUES('Produce from grocery store','Met goal of 7500 pounds of produce!',1,6);
INSERT INTO donation(donation_name, description, fk_org_id, fk_fb_id)
VALUES('Food from Bank','100 Pounds of food from a local bank',3,7);
INSERT INTO donation(donation_name, description, fk_org_id, fk_fb_id)
VALUES('Water from Bottling Company','Water bottle company donated 5000 bottles of water',10,8);
INSERT INTO donation(donation_name, description, fk_org_id, fk_fb_id)
VALUES('Food from Farm','A farm donated 500 pounds of their crops.',8,9);
INSERT INTO donation(donation_name, description, fk_org_id, fk_fb_id)
VALUES('Food from Grocery Store','Grocery Store donated 250 pounds of food that was not being sold.',4,10);

select * from org;
INSERT INTO org(org_name, email, phone_number, fk_address_id)
VALUES('H-E-B','heb@gmail.com','(210) 368-4722',1);
INSERT INTO org(org_name, email, phone_number, fk_address_id)
VALUES('Wonder Bank','help@wonderbank.com','(573) 347-4367',2);
INSERT INTO org(org_name, email, phone_number, fk_address_id)
VALUES('Bank of North Texas','help@bnt.com','(389) 835-8463',3);
INSERT INTO org(org_name, email, phone_number, fk_address_id)
VALUES('Quick-E-Mart','quikemart@gmail.com','(625) 783-3565',4);
INSERT INTO org(org_name, email, phone_number, fk_address_id)
VALUES('Reagan High School','reagan@neisd.net','(210) 331-4723',5);
INSERT INTO org(org_name, email, phone_number, fk_address_id)
VALUES('Macarthur High School','machs@neisd.net','(210) 426-2423',6);
INSERT INTO org(org_name, email, phone_number, fk_address_id)
VALUES('Churchill High School','wchs@neisd.net','(210) 364-8453',7);
INSERT INTO org(org_name, email, phone_number, fk_address_id)
VALUES('Flacksville Farm','flacksville@gmail.com','(246) 357-3754',8);
INSERT INTO org(org_name, email, phone_number, fk_address_id)
VALUES('Johnson Elementary School','johnson@neisd.net', '(210) 325-3725',9);
INSERT INTO org(org_name, email, phone_number, fk_address_id)
VALUES('Ozarka Bottling Company', 'bottling@ozarka.com', '(246) 642-6223',10);

select * from item_donation;
INSERT INTO item_donation(fk_item_id, fk_donation_id, item_quantity)
VALUES (1,6,580);
INSERT INTO item_donation(fk_item_id, fk_donation_id, item_quantity)
VALUES (2,3,1211);
INSERT INTO item_donation(fk_item_id, fk_donation_id, item_quantity)
VALUES (3,4,352);
INSERT INTO item_donation(fk_item_id, fk_donation_id, item_quantity)
VALUES (5,9,1724);
INSERT INTO item_donation(fk_item_id, fk_donation_id, item_quantity)
VALUES (4,2,235);
INSERT INTO item_donation(fk_item_id, fk_donation_id, item_quantity)
VALUES (6,8,237);
INSERT INTO item_donation(fk_item_id, fk_donation_id, item_quantity)
VALUES (7,4,279);
INSERT INTO item_donation(fk_item_id, fk_donation_id, item_quantity)
VALUES (8,7,223);
INSERT INTO item_donation(fk_item_id, fk_donation_id, item_quantity)
VALUES (9,10,3845);
INSERT INTO item_donation(fk_item_id, fk_donation_id, item_quantity)
VALUES (10,6,256);

select * from item;
INSERT INTO item(item_name, weight, expiration_date, needs_refridgeration, needs_frozen, description, brand)
VALUES('Water bottle',16,'2025-12-30',false,false,'Single 16oz water bottle', 'ozark');
INSERT INTO item(item_name, weight, expiration_date, needs_refridgeration, needs_frozen, description)
VALUES('Beans',4,'2027-12-30',false,false,'Single 4oz can of beans');
INSERT INTO item(item_name, weight, expiration_date, needs_refridgeration, needs_frozen, description)
VALUES('Green Pepper',16,'2025-12-30',false,false,'Single green pepper');
INSERT INTO item(item_name, weight, expiration_date, needs_refridgeration, needs_frozen, description)
VALUES('Apple',2,'2020-12-6',true,false,'Single 2oz apple');
INSERT INTO item(item_name, weight, expiration_date, needs_refridgeration, needs_frozen, description)
VALUES('Baby Carrots',3,'2020-3-5',false,false,'Single 3oz bag of baby carrots');
INSERT INTO item(item_name, weight, expiration_date, needs_refridgeration, needs_frozen, description)
VALUES('Meat',16,'2020-5-16',false,true,'16oz Package of 93% Lean ground beef');
INSERT INTO item(item_name, weight, expiration_date, needs_refridgeration, needs_frozen, description)
VALUES('Mixed Nuts',16,'2021-8-2',false,false,'Single 10oz bag of mixed nuts. Does contain nuts.');
INSERT INTO item(item_name, weight, expiration_date, needs_refridgeration, needs_frozen, description)
VALUES('Potato Chips',16,'2021-12-7',false,false,'Assorted 16 pack of 1oz potato chips');
INSERT INTO item(item_name, weight, expiration_date, needs_refridgeration, needs_frozen, description)
VALUES('Granola Bar',16,'2021-12-2',false,false,'box of 32 granola bars');
INSERT INTO item(item_name, weight, expiration_date, needs_refridgeration, needs_frozen, description, brand)
VALUES('Water bottle',32,'2025-12-18',false,false,'Single 32oz water bottle', 'ozark');

select * from food_drive;
INSERT INTO food_drive(description, start_date, end_date, fk_org_id)
VALUES('Collecting cans from elementary school','2020-1-6','2020-2-20',9);
INSERT INTO food_drive(description, start_date, end_date, fk_org_id)
VALUES('Collecting Water bottles from private school','2020-1-6','2020-2-20',6);
INSERT INTO food_drive(description, start_date, end_date, fk_org_id)
VALUES('Collecting produce from charity run','2020-1-6','2020-2-20',7);
INSERT INTO food_drive(description, start_date, end_date, fk_org_id)
VALUES('Collecting cans from high school','2020-4-7','2020-4-20',5);
INSERT INTO food_drive(description, start_date, end_date, fk_org_id)
VALUES('Collecting assorted food from a high scool football game','2020-1-29','2020-7-20',5);
INSERT INTO food_drive(description, start_date, end_date, fk_org_id)
VALUES('Collecting cans from elementary school','2021-1-6','2021-2-20',9);
INSERT INTO food_drive(description, start_date, end_date, fk_org_id)
VALUES('Collecting assorted foods from grocery store','2020-6-8','2020-6-20',12);
INSERT INTO food_drive(description, start_date, end_date, fk_org_id)
VALUES('Collecting any food or water from grocery stores','2020-3-1','2020-3-29',13);
INSERT INTO food_drive(description, start_date, end_date, fk_org_id)
VALUES('Collecting water bottles from middle school','2020-1-13','2020-1-20',14);
INSERT INTO food_drive(description, start_date, end_date, fk_org_id)
VALUES('Collecting cans from elementary school','2020-2-6','2020-2-14',15);

select * from distribution;
INSERT INTO distribution(description, dist_date, fk_address_id, fk_fb_id, fk_pantry_id)
VALUES('Distributing food at parking lot','2020-4-17',1,1,3);
INSERT INTO distribution(description, dist_date, fk_address_id, fk_fb_id, fk_pantry_id)
VALUES('Distributing food at elementary school','2020-1-5',2,2,6);
INSERT INTO distribution(description, dist_date, fk_address_id, fk_fb_id, fk_pantry_id)
VALUES('Distributing food at church','2020-2-27',3,2,1);
INSERT INTO distribution(description, dist_date, fk_address_id, fk_fb_id, fk_pantry_id)
VALUES('Distributing food at community rec center','2020-2-6',4,2,8);
INSERT INTO distribution(description, dist_date, fk_address_id, fk_fb_id, fk_pantry_id)
VALUES('Distributing food at sports arena','2020-10-3',5,2,8);
INSERT INTO distribution(description, dist_date, fk_address_id, fk_fb_id, fk_pantry_id)
VALUES('Distributing water and food boxes at food pantry','2020-1-20',4,1,1);
INSERT INTO distribution(description, dist_date, fk_address_id, fk_fb_id, fk_pantry_id)
VALUES('Distributing food at food pantry but not enough','2020-10-28',10,2,3);
INSERT INTO distribution(description, dist_date, fk_address_id, fk_fb_id, fk_pantry_id)
VALUES('Distributing food at food pantry a second time to meet needs','2020-10-29',10,2,9);
INSERT INTO distribution(description, dist_date, fk_address_id, fk_fb_id, fk_pantry_id)
VALUES('Distributing water only to pantry','2020-9-3',8,4,6);
INSERT INTO distribution(description, dist_date, fk_address_id, fk_fb_id, fk_pantry_id)
VALUES('Distributing food boxes in limited quantity to pantry','2019-3-25',2,5,4);

select * from food_pantry;
INSERT INTO food_pantry(pantry_name, email, phone, fk_address_id, people_being_helped)
VALUES('247 Food Pantry','247fpantry@gmail.com','(210) 247-1778',6,1275);
INSERT INTO food_pantry(pantry_name, email, phone, fk_address_id, people_being_helped)
VALUES('Summit Food Pantry','summitpantry@gmail.com','(210) 826-4733',7,1015);
INSERT INTO food_pantry(pantry_name, email, phone, fk_address_id, people_being_helped)
VALUES('St. Paul Chuch','stpaulchuch210@gmail.com','(210) 445-8735',8,563);
INSERT INTO food_pantry(pantry_name, email, phone, fk_address_id, people_being_helped)
VALUES('We Are Here to Help Food Pantry','wehere4upantry@gmail.com','(210) 773-3232',9,1650);
INSERT INTO food_pantry(pantry_name, email, phone, fk_address_id, people_being_helped)
VALUES('Community Center Food Pantry','ccfp245@gmail.com','(210) 946-9233',10,473);
INSERT INTO food_pantry(pantry_name, email, phone, fk_address_id, people_being_helped)
VALUES('Helping Hand Pantry','hhfoodpantry@gmail.com','(210) 102-4903',1,543);
INSERT INTO food_pantry(pantry_name, email, phone, fk_address_id, people_being_helped)
VALUES('Friendly Neighborhood Food Pantry','spidermanfoodpantry@gmail.com','(210) 426-8327',2,862);
INSERT INTO food_pantry(pantry_name, email, phone, fk_address_id, people_being_helped)
VALUES('St. Matthew Church','stmatthewchurch@gmail.com','(210) 246-8754',3,1836);
INSERT INTO food_pantry(pantry_name, email, phone, fk_address_id, people_being_helped)
VALUES('San Antonio Food Pantry','ssafp210@gmail.com','(210) 735-7829',4,724);
INSERT INTO food_pantry(pantry_name, email, phone, fk_address_id, people_being_helped)
VALUES('Downtown Food Pantry','dtownpantry@gmail.com','(210) 134-8831',5,2003);

select * from food_box;
INSERT INTO food_box(box_name, description)
VALUES('Spring box assorted','contains both perishables and non-perishables');
INSERT INTO food_box(box_name, description)
VALUES('Spring box perishable','contains only produce and meat');
INSERT INTO food_box(box_name, description)
VALUES('Spring box non-perishable','contains only water and canned foods');
INSERT INTO food_box(box_name, description)
VALUES('Spring box canned','contains only canned foods');
INSERT INTO food_box(box_name, description)
VALUES('Summer box assorted','contains both perishables and non-perishables that can withstand summer heat');
INSERT INTO food_box(box_name, description)
VALUES('Summer box perishable','contains produce and meat that will last slightly longer in warm weather');
INSERT INTO food_box(box_name, description)
VALUES('Summer box non-perishable','contains canned food in excess during the summer');
INSERT INTO food_box(box_name, description)
VALUES('Fall box assorted','contains both perishables and non-perishables');
INSERT INTO food_box(box_name, description)
VALUES('Fall box perishable','contains perishables great for colder weather');
INSERT INTO food_box(box_name, description)
VALUES('Fall box non-perishable','contains canned food and water that can be consumed in colder weather');

select * from distribution_box;
INSERT INTO distribution_box(fk_dist_id, fk_box_id, box_quantity)
VALUES(9,5,2);
INSERT INTO distribution_box(fk_dist_id, fk_box_id, box_quantity)
VALUES(10,9,5);
INSERT INTO distribution_box(fk_dist_id, fk_box_id, box_quantity)
VALUES(8,7,3);
INSERT INTO distribution_box(fk_dist_id, fk_box_id, box_quantity)
VALUES(8,9,9);
INSERT INTO distribution_box(fk_dist_id, fk_box_id, box_quantity)
VALUES(9,9,1);
INSERT INTO distribution_box(fk_dist_id, fk_box_id, box_quantity)
VALUES(2,3,12);
INSERT INTO distribution_box(fk_dist_id, fk_box_id, box_quantity)
VALUES(6,2,5);
INSERT INTO distribution_box(fk_dist_id, fk_box_id, box_quantity)
VALUES(4,3,2);
INSERT INTO distribution_box(fk_dist_id, fk_box_id, box_quantity)
VALUES(2,6,2);
INSERT INTO distribution_box(fk_dist_id, fk_box_id, box_quantity)
VALUES(2,7,6);

select * from box_item;
INSERT INTO box_item(fk_box_id, fk_item_id, item_quantity)
VALUES(2,3,2);
INSERT INTO box_item(fk_box_id, fk_item_id, item_quantity)
VALUES(2,5,1);
INSERT INTO box_item(fk_box_id, fk_item_id, item_quantity)
VALUES(2,4,1);
INSERT INTO box_item(fk_box_id, fk_item_id, item_quantity)
VALUES(2,6,3);
INSERT INTO box_item(fk_box_id, fk_item_id, item_quantity)
VALUES(1,1,4);
INSERT INTO box_item(fk_box_id, fk_item_id, item_quantity)
VALUES(1,1,1);
INSERT INTO box_item(fk_box_id, fk_item_id, item_quantity)
VALUES(1,6,2);
INSERT INTO box_item(fk_box_id, fk_item_id, item_quantity)
VALUES(1,5,2);
INSERT INTO box_item(fk_box_id, fk_item_id, item_quantity)
VALUES(3,1,1);
INSERT INTO box_item(fk_box_id, fk_item_id, item_quantity)
VALUES(3,2,6);



select * from sanAntonioFoodBankVols;
CREATE VIEW sanAntonioFoodBankVols AS 
SELECT first_name, last_name, v.email, v.phone_number
FROM food_bank as fb JOIN food_bank_volunteer as fbv on fb.fb_id = fbv.fk_fb_id
JOIN volunteer as v on fbv.fk_vol_id = v.vol_id
WHERE fb.fb_id = 6;

select * from foodBankItems;
CREATE VIEW foodBankItems AS 
SELECT fb_name, item_name, item_quantity, weight
FROM food_bank as fb JOIN donation as d on fb.fb_id = d.fk_fb_id
JOIN item_donation as id on id.fk_donation_id = d.donation_id
JOIN item as i on id.fk_item_id = i.item_id;



