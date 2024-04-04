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


---------------- ACCOUNT TRANSACTIONS


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

---------------- LOANS

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

insert into loans ('customer_id', 'start_dt', 'loan_type', 'total_loan', 'amount_paid'
, 'create_dt')
values (-1, '2020-06-06', 'Vehicle', 40000, 10000, 30000, '2020-06-06');

insert into loans ('customer_id', 'start_dt', 'loan_type', 'total_loan', 'amount_paid'
, 'create_dt')
values (-1, '2018-02-14', 'Home', 50000, 10000, 40000, '2018-02-14');

insert into loans ('customer_id', 'start_dt', 'loan_type', 'total_loan', 'amount_paid'
, 'create_dt')
values (-1, '2018-02-14', 'Personal', 10000, 3500, 6500, '2018-02-14');

---------------- CARDS

create table cards(
	'card_id' int not null AUTO_INCREMENT,
	'card_number' varchar(100) not null,
	'customer_id' int NOT null,
    'card_type' varchar(100) not null,
	'total_limit' int not null,
	'amount_used' int not null,
	'available_amount' int not null,
	'create_dt' date DEFAULT null,
	PRIMARY KEY ('card_id'),
	KEY 'customer_id' ('customer_id'),
	CONSTRAINT 'card_customer_ibfk_1' FOREIGN KEY ('customer_id') REFERENCES 'customer' ('customer_id') ON DELETE CASCADE
);

insert into loans ('card_number', 'customer_id', 'card_type', 'total_limit', 'amount_used'
, 'available_amount', 'create_dt')
values ('4565XXXX4656', 1, 'Credit', 10000, 500, 9500, CURDATE());

insert into loans ('card_number', 'customer_id', 'card_type', 'total_limit', 'amount_used'
, 'available_amount', 'create_dt')
values ('3455XXXX8673', 1, 'Credit', 7500, 600, 6900, CURDATE());

insert into loans ('card_number', 'customer_id', 'card_type', 'total_limit', 'amount_used'
, 'available_amount', 'create_dt')
values ('4565XXXX4656', 1, 'Credit', 10000, 500, 9500, CURDATE());


---------------- NOTICE DETAILS


create table notice_details(
	'notice_id' int not null AUTO_INCREMENT,
	'notice_summary' varchar(200) not null,
	'notice_details' varchar(500) not null,
	'notic_beg_dt' date not null,
	'notic_end_dt' date DEFAULT null,
	'create_dt' date DEFAULT null,
	'update_dt' date DEFAULT null,
	PRIMARY KEY ('notice_id')
);

insert into notice_details ('notice_summary', 'notice_details', 'notic_beg_dt', 'notic_end_dt', 'create_dt'
, 'update_dt')
values ('Home Loan Interest rates reduced', 'Home loan interest rates are reduced as per the goverment guidelines. The updated rates will be blablabla', CURDATE() - INTERVAL 30 DAY
, CURDATE() + INTERVAL 30 DAY, CURDATE(), null);

insert into notice_details ('notice_summary', 'notice_details', 'notic_beg_dt', 'notic_end_dt', 'create_dt'
, 'update_dt')
values ('Net Banking Offers', 'Customers who will opt for Internet banking while opening a saving account will get a $50 amazon voucher', CURDATE() - INTERVAL 30 DAY
, CURDATE() + INTERVAL 30 DAY, CURDATE(), null);

insert into notice_details ('notice_summary', 'notice_details', 'notic_beg_dt', 'notic_end_dt', 'create_dt'
, 'update_dt')
values ('Mobile App Downtime', 'The mobile application of the FrankBank will be down from 2AM-5AM on 12/05/2020 due to maintenance activities', CURDATE() - INTERVAL 30 DAY
, CURDATE() + INTERVAL 30 DAY, CURDATE(), null);

insert into notice_details ('notice_summary', 'notice_details', 'notic_beg_dt', 'notic_end_dt', 'create_dt'
, 'update_dt')
values ('E Auction notice', 'There will be a e-auction on 12/08/2020 on the Bank website for all the stubboin arrears. Interested parties can blablabla', CURDATE() - INTERVAL 30 DAY
, CURDATE() + INTERVAL 30 DAY, CURDATE(), null);

insert into notice_details ('notice_summary', 'notice_details', 'notic_beg_dt', 'notic_end_dt', 'create_dt'
, 'update_dt')
values ('Launch of Millennia Cards', 'Millennia Credit Cards are launched for the premium customers of FrankBank. With these cards, you will blablabla', CURDATE() - INTERVAL 30 DAY
, CURDATE() + INTERVAL 30 DAY, CURDATE(), null);

insert into notice_details ('notice_summary', 'notice_details', 'notic_beg_dt', 'notic_end_dt', 'create_dt'
, 'update_dt')
values ('COVID-19 Insurance', 'FrankBank launched an insurance policy which will cover COVID-19 expenses. Please reach out to the branch for blablabla', CURDATE() - INTERVAL 30 DAY
, CURDATE() + INTERVAL 30 DAY, CURDATE(), null);


---------------- CONTACT MESSAGES


create table contact_messages(
	'contact_id' varchar(50) not null,
	'contact_name' varchar(50) not null,
	'contact_email' varchar(100) not null,
	'subject' varchar(500) not null,
	'message' varchar(2000) not null,
	'create_dt' date default null,
	PRIMARY KEY ('contact_id')
);






