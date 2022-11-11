create table client (
	client_code integer NOT NULL AUTO_INCREMENT, 
	document integer,
	direction varchar(50), 
	city varchar(20), 
	country varchar(20), 
	PRIMARY KEY (client_code)
);

create table resort (
	name varchar(20) NOT NULL, 
	location varchar(50),
	description varchar(50), 
	PRIMARY KEY (name));
	
create table property (
	property_code integer NOT NULL, 
	direction varchar(50), 
	resort_name varchar(20), 
	price integer, 
	PRIMARY KEY (property_code), 
	FOREIGN KEY (resort_name)
	REFERENCES resort(name)
);
create table accomodation (
	property_code integer NOT NULL, 
	accomodation varchar(30) NOT NULL,
	PRIMARY KEY (property_code,accomodation),
	FOREIGN KEY (property_code) REFERENCES
	property(property_code)
);
create table renting (
	property_code integer NOT NULL, 
	client_code integer NOT NULL,
	start_date date NOT NULL, 
	days integer, 
	PRIMARY KEY(property_code,client_code,start_date), 
	FOREIGN KEY (property_code) REFERENCES property(property_code),
	FOREIGN KEY (client_code) REFERENCES client(client_code)
);