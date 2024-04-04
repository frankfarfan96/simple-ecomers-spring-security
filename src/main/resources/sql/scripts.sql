create database spring_security;

create table users(
    id int not null auto_increment,
	username varchar(45) not null,
	password varchar(45) not null,
	enabled int not null,
	primary key (id)
);

create table authorities (
    id int not null auto_increment,
	username varchar(45) not null,
	authority varchar(45) not null,
	primary key (id)
);

INSERT IGNORE INTO users VALUES(null, "happy", "12345", "1");
INSERT IGNORE INTO authorities VALUES(null, "happy", "write");


create table customer (
    id int not null auto_increment,
	email varchar(45) not null,
	pwd varchar(200) not null,
	role varchar(45) not null,
	primary key (id)
);

insert into customer (email, pwd, role)
values ("frank@gmail.com", "123321", "admin")

-- 20/03/2024 -> new script

DROP TABLE users;
DROP TABLE authorities;
DROP TABLE customer;

create table customer(
    'customer_id' int not null auto_increment,
	'name' varchar(100) not null,
	'email' varchar(100) not null,
	'mobile_number' varchar(20) not null,
	'pwd' varchar(500) not null,
	'role' varchar(100) not null,
	'create_dt' date DEFAULT null,
	primary key ('customer_id')
);

insert into customer ('name', 'email', 'mobile_number', 'pwd', 'role', 'create_dt')
values ("Happy", "frank@gmail.com", "3321654456", "P4$$w0oRD", "admin", CURDATE());

create table accounts(
    'customer_id' int not null,
	'account_number' int not null,
	'account_type' varchar(100) not null,
	'branch_address' varchar(200) not null,
	'create_dt' date DEFAULT null,
	PRIMARY KEY ('account_number'),
	KEY 'customer_id' ('customer_id'),
	CONSTRAINT 'customer_ibfk_1' FOREIGN KEY ('customer_id') REFERENCES 'customer' ('customer_id') ON DELETE CASCADE
);

insert into customer ('customer_id', 'account_number', 'account_type', 'branch_address', 'create_dt')
values (1, 3321654456, "Savings", "Sidney P. Shealby 39", CURDATE());



create table account_transactions(
    'transaction_id' varchar(200) not null,
	'account_number' int not null,
	'customer_id' int not null,
	'transaction_dt' date DEFAULT null,
	'transaction_summary' varchar(200) not null,
	'transaction_type' varchar(100) not null,
	'transaction_amt' int not null,
	'closing_balance' int not null,
	'create_dt' date DEFAULT null,
	PRIMARY KEY ('transaction_id'),
	KEY 'customer_id' ('customer_id'),
	KEY 'account_number' ('account_number'),
	CONSTRAINT 'accounts_ibfk_2' FOREIGN KEY ('account_number') REFERENCES 'accounts' ('account_number') ON DELETE CASCADE,
	CONSTRAINT 'acct_user_ibfk_1' FOREIGN KEY ('customer_id') REFERENCES 'customer' ('customer_id') ON DELETE CASCADE
);

insert into account_transactions ('transaction_id', 'account_number', 'customer_id', 'transaction_dt', 'transaction_summary'
, 'transaction_type', 'transaction_amt', 'closing_balance', 'create_dt')
values (UUID(), 3321654456, 1, CURDATE()-7, "Coffee Shop", "Withdrawal", 30, 34500, CURDATE()-7);

insert into account_transactions ('transaction_id', 'account_number', 'customer_id', 'transaction_dt', 'transaction_summary'
, 'transaction_type', 'transaction_amt', 'closing_balance', 'create_dt')
values (UUID(), 3321654456, 1, CURDATE()-6, "Uber", "Withdrawal", 100, 34400, CURDATE()-6);

insert into account_transactions ('transaction_id', 'account_number', 'customer_id', 'transaction_dt', 'transaction_summary'
, 'transaction_type', 'transaction_amt', 'closing_balance', 'create_dt')
values (UUID(), 3321654456, 1, CURDATE()-5, "Self Deposit", "Deposit", 500, 34900, CURDATE()-5);

insert into account_transactions ('transaction_id', 'account_number', 'customer_id', 'transaction_dt', 'transaction_summary'
, 'transaction_type', 'transaction_amt', 'closing_balance', 'create_dt')
values (UUID(), 3321654456, 1, CURDATE()-4, "Ebay", "Withdrawal", 600, 34300, CURDATE()-4);

insert into account_transactions ('transaction_id', 'account_number', 'customer_id', 'transaction_dt', 'transaction_summary'
, 'transaction_type', 'transaction_amt', 'closing_balance', 'create_dt')
values (UUID(), 3321654456, 1, CURDATE()-2, "OnlineTransfer", "Deposit", 700, 35000, CURDATE()-2);

insert into account_transactions ('transaction_id', 'account_number', 'customer_id', 'transaction_dt', 'transaction_summary'
, 'transaction_type', 'transaction_amt', 'closing_balance', 'create_dt')
values (UUID(), 3321654456, 1, CURDATE()-1, "Amazon.com", "Withdrawal", 100, 34900, CURDATE()-1;



create table loans(
	'loan_number' int not null AUTO_INCREMENT,
	'customer_id' int not null,
	'start_dt' date NOT null,
    'loan_type' varchar(100) not null,
	'total_loan' int not null,
	'amount_paid' int not null,
	'create_dt' date DEFAULT null,
	PRIMARY KEY ('loan_number'),
	KEY 'customer_id' ('customer_id'),
	CONSTRAINT 'loan_customer_ibfk_1' FOREIGN KEY ('customer_id') REFERENCES 'customer' ('customer_id') ON DELETE CASCADE
);

insert into loans ('customer_id', 'start_dt', 'loan_type', 'total_loan', 'amount_paid'
, 'create_dt')
values (-1, '2020-10-13', 'Home', 200000, 50000, 150000, '2020-10-13');











