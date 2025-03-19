/*
Question URL = 'https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50'
Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.
*/

--SOLUTION 1
SELECT d1.id
FROM Weather d1 JOIN Weather d2
ON DATEDIFF(d1.recordDate,d2.recordDate) = 1
WHERE d1.temperature > d2.temperature;

--SOLUTION 2
SELECT d1.id
FROM Weather d1
JOIN Wearher d2 on DATE_SUB(w1.recordDate, interval 1 day) = d2.recordDate
WHERE d1.temperature > d2.temperature
