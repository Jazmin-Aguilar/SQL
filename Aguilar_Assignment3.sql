/*
Assignment 3 Template
Make sure you read all instructions before completing this template. 
Student Name: Jazmin Aguilar
*/
---Question 1
CREATE TABLE bitcoin_data 
(
	trans_date DATE,
	priceUSD numeric(10,3),
	code_size int,
	sentbyaddress int,
	transactions int,
	mining_profitability numeric(10,3),
	sentinusd bigint,
	transactionfees numeric(10,4),
	median_transaction_fee numeric(10,4),
	confirmationtime numeric(10,3),
	marketcap bigint,
	transactionvalue int,
	mediantransactionvalue numeric(10,3),
	tweets int,
	google_trends numeric(10,3),
	fee_to_reward numeric(10,3),
	activeaddresses int,
	top100cap numeric(10,3) 
);

---Question 2

COPY bitcoin_data
FROM 'C:\Users\Public\bitcoin_data.csv'
WITH (FORMAT CSV, HEADER);

---Question 3 

SELECT * FROM bitcoin_data;

---Question 4

SELECT trans_date, CAST(code_size AS NUMERIC (10,2))/transactions as difficulty FROM bitcoin_data;

--Question 5

SELECT trans_date,median_transaction_fee*CAST(transactions AS NUMERIC(10,2)) AS daily_cost FROM bitcoin_data;

---Question 6

SELECT trans_date, sentinusd/transactions AS average_transaction FROM bitcoin_data;

SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY transactions) AS transaction_median FROM bitcoin_data;

---Question 7

SELECT AVG(priceusd) AS avg_price FROM bitcoin_data;

---Question 8

SELECT SUM(transactions) AS total_transactions FROM bitcoin_data;

---Question 9

SELECT MAX(marketcap) AS max_cap FROM bitcoin_data;

---Question 10

SELECT AVG(tweets) AS avg_daily_tweets FROM bitcoin_data;



