/*
Question URL = 'https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50'

Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
 

Find the names of the customer that are not referred by the customer with id = 2.

Return the result table in any order.

The result format is in the following example.
*/

SELECT name FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;
