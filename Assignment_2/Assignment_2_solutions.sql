### 1.  Activity 1st Filtering data using "Where Clause" in SQL

-- 1.
SELECT * FROM hero_battles;

-- 2.
SELECT * FROM hero_battles
ORDER BY num_enemies ASC;

-- 3.
SELECT * FROM hero_battles
ORDER BY num_enemies DESC;

-- 4.
SELECT * FROM hero_battles
WHERE name = 'Batman'
ORDER BY num_enemies DESC;

-- 5.
SELECT * FROM hero_battles
WHERE name != 'Batman'
ORDER BY num_enemies DESC;

-- 6.
SELECT * FROM hero_battles
WHERE num_enemies = 1 OR num_enemies = 2;

-- 7.
SELECT * FROM hero_battles
WHERE num_enemies IN (1 , 2, 10, 12);

-- 8.
SELECT * FROM hero_battles
WHERE name LIKE '%man';



### 2.  Activity 2nd Aggregation and Summary Functions in SQL

-- 1.
SELECT * FROM hero_battles;

-- 2.
SELECT COUNT(*) FROM hero_battles;

-- 3. 
SELECT MAX(name), MIN(name) FROM hero_battles;

-- 4.
SELECT SUM(num_enemies), AVG(num_enemies)
FROM hero_battles;

-- 5.
SELECT name, SUM(num_enemies), AVG(num_enemies) FROM hero_battles
GROUP BY name;

-- 6.
SELECT name, SUM(num_enemies), AVG(num_enemies) FROM hero_battles
GROUP BY name
ORDER BY AVG(num_enemies) ASC;


### 3.  Activity 3rd Miscellaneous Analysis in SQL

-- 1. 
SELECT CAST('24.423423' AS DECIMAL (10 , 6 ));

-- 2.
SELECT date,DATE(date),TIME(date),MONTH(date),HOUR(date),
MINUTE(date),SECOND(date) FROM hero_battles;

-- 3.
SELECT name, REPLACE(name, 'Batman', 'Batwoman') AS new_name FROM hero_battles
WHERE name = 'Batman';

-- 4.
SELECT CONCAT('This battle occured at ',HOUR(date),' o\'clock') AS battle_timing
FROM hero_battles;