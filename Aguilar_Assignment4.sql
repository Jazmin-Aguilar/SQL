/*
    Name: Jazmin Aguilar
    DTSC660: Data and Database Managment with SQL
    Module 6
    Assignment 4
*/

--------------------------------------------------------------------------------
/*				                 Question 1: Banking DDL           		  		          */
--------------------------------------------------------------------------------
CREATE table branch(
	branch_name varchar(40) CONSTRAINT branch_name PRIMARY KEY,
	branch_city varchar(40),
	assets money 
	CHECK(branch_city in ('Brooklyn', 'Bronx','Manhattan', 'Yonkers'))
);
	
CREATE table customer(
	cust_ID varchar(40) CONSTRAINT cust_ID PRIMARY KEY,
	customer_name varchar(40) NOT NULL,
	customer_street varchar(40),
	customer_city varchar(40) 
);

CREATE table loan(
	loan_number varchar(40) CONSTRAINT loan_number PRIMARY KEY,
	branch_name varchar(40) REFERENCES branch(branch_name) ON UPDATE CASCADE,
	amount money DEFAULT '0.00'
);

CREATE table borrower(
	cust_ID varchar(40) REFERENCES customer(cust_ID) ON DELETE CASCADE,
	loan_number varchar(40) REFERENCES loan(loan_number) ON DELETE CASCADE,
	PRIMARY KEY(cust_ID, loan_number)	
);


CREATE table account(
	account_number varchar(40) CONSTRAINT account_number PRIMARY KEY,
	branch_name varchar(40) REFERENCES branch(branch_name) ON UPDATE CASCADE,
	balance money NOT NULL
);

CREATE table depositor(
	cust_ID varchar(40) REFERENCES customer(cust_ID) ON DELETE CASCADE,
	account_number varchar(40) REFERENCES account(account_number) ON DELETE CASCADE,
	PRIMARY KEY(cust_ID, account_number)
);

--------------------------------------------------------------------------------
/*				                  Question 2           		  		          */
--------------------------------------------------------------------------------

SELECT depositor.cust_ID,account.branch_name,depositor.account_number,account.balance FROM depositor LEFT JOIN account USING(account_number);

--------------------------------------------------------------------------------
/*				                  Question 3           		  		          */
--------------------------------------------------------------------------------

SELECT depositor.cust_ID,depositor.account_number,borrower.loan_number FROM depositor JOIN borrower USING(cust_ID);

--------------------------------------------------------------------------------
/*				                  Question 4           		  		          */
--------------------------------------------------------------------------------

SELECT customer.customer_city,branch.branch_city,branch.branch_name,depositor.account_number,depositor.cust_ID FROM depositor LEFT JOIN account USING(account_number)
JOIN branch USING(branch_name)
INNER JOIN customer USING(cust_ID)
WHERE customer.customer_city = branch.branch_city;


--------------------------------------------------------------------------------
/*				                  Question 5           		  		          */
--------------------------------------------------------------------------------
SELECT cust_ID FROM depositor
INTERSECT
SELECT cust_ID FROM borrower;

--------------------------------------------------------------------------------
/*				                  Question 6           		  		          */
--------------------------------------------------------------------------------
SELECT student.id FROM student
LEFT OUTER JOIN takes USING(id)
WHERE takes.id IS NULL;

