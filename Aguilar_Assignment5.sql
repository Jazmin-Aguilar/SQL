/*
    Name: Jazmin Aguilar
    DTSC660: Data and Database Managment with SQL
    Module 6
    Assignment 5
*/

--------------------------------------------------------------------------------
/*				                 Question 1:           		  		          */
--------------------------------------------------------------------------------

 SELECT customer.cust_id,customer.customer_name FROM customer
 JOIN borrower USING(cust_ID)
 WHERE cust_ID NOT IN (SELECT cust_ID FROM depositor);
  
--------------------------------------------------------------------------------
/*				                  Question 2           		  		          */
--------------------------------------------------------------------------------

SELECT customer.cust_ID,customer.customer_name FROM customer
WHERE customer_street = (SELECT customer_street FROM customer WHERE cust_ID = '12345')
AND customer_city = (SELECT customer_city FROM customer WHERE cust_ID = '12345');

--------------------------------------------------------------------------------
/*				                  Question 3           		  		          */
--------------------------------------------------------------------------------
  
SELECT DISTINCT branch_name FROM account
WHERE account_number IN (SELECT account_number FROM depositor WHERE
cust_ID IN (SELECT DISTINCT cust_ID FROM customer WHERE customer_city = 'Harrison'));

--------------------------------------------------------------------------------
/*				                  Question 4           		  		          */
--------------------------------------------------------------------------------

SELECT customer_name FROM customer
WHERE cust_ID IN (SELECT cust_ID FROM depositor 
WHERE account_number IN (SELECT account_number FROM account
WHERE branch_name IN (SELECT branch_name FROM branch WHERE branch_city = 'Brooklyn')));

--------------------------------------------------------------------------------
/*				                  Question 5           		  		          */
--------------------------------------------------------------------------------
 
SELECT account.account_number,customer.cust_ID, branch.branch_city, customer.customer_city FROM customer
JOIN depositor USING(cust_ID)
JOIN account USING(account_number)
JOIN branch USING(branch_name)
WHERE branch_city IN (SELECT branch_city FROM branch WHERE branch_city = customer_city);

--------------------------------------------------------------------------------
/*				                  Question 6           		  		          */
--------------------------------------------------------------------------------
SELECT customer.customer_name, loan.branch_name FROM customer
JOIN borrower USING(cust_ID)
JOIN loan USING(loan_number)
WHERE branch_name IN (SELECT branch_name FROM loan WHERE branch_name = 'Yonkahs Bankahs');


--------------------------------------------------------------------------------
/*				                  Question 7           		  		          */
--------------------------------------------------------------------------------

SELECT customer.customer_name,borrower.loan_number FROM customer
JOIN borrower USING(cust_ID)
JOIN loan USING(loan_number)
WHERE amount IN (SELECT amount FROM loan WHERE amount  > '5000.00');

