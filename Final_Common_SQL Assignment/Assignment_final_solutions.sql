#####----- Assignment 1 -----#####

-- 1.
SELECT 
    *
FROM
    hero_battles
WHERE
    num_enemies IN (1 , 2, 10, 12);

-- 2. 
SELECT 
    name, SUM(num_enemies), AVG(num_enemies)
FROM
    hero_battles
GROUP BY name
ORDER BY AVG(num_enemies) DESC;

-- 3. 
SELECT 
    CONCAT('This battle occured at ',
            HOUR(date),
            ' o\'clock') AS Battle_timing
FROM
    hero_battles;

-- 4.
SELECT 
    race, AVG(weight), AVG(height)
FROM
    heroes_information
GROUP BY race
HAVING AVG(weight) > 150 AND AVG(height) > 100;


#####----- Assignment 2 -----#####

-- 5.
SELECT 
    hi.name
FROM
    heroes_information hi
        INNER JOIN
    super_hero_powers shp ON hi.name = shp.hero_names
WHERE
    hi.Gender = 'female'
        AND `Accelerated Healing` = 'true';

-- 6.
SELECT 
    hb.*, hi.*
FROM
    hero_battles hb
        LEFT JOIN
    heroes_information hi ON hb.name = hi.name;

-- 7.
SELECT
	*,RANK() OVER(ORDER BY weight DESC) AS Ranking
FROM 
	heroes_information;

-- 8.
SELECT 
    LEFT(name, 1) AS first_letter, COUNT(*) AS hero_count
FROM
    heroes_information
GROUP BY first_letter
ORDER BY first_letter;


#####----- Assignment 3 -----#####

-- 9.

CREATE TEMPORARY TABLE bigs (name VARCHAR(30),hero_weight INT);

INSERT INTO 
	bigs(name,hero_weight) 
SELECT 
	name, AVG(weight) as hero_weight 
FROM heroes_information
GROUP BY 
	name;

-- a. 
SELECT 
    hi.*, b.hero_weight
FROM
    heroes_information hi
        INNER JOIN
    bigs b ON hi.name = b.name
WHERE
    hero_weight > 400;
    
-- b.
SELECT * FROM bigs;

-- 10.

CREATE VIEW hero_view AS
    SELECT 
        *
    FROM
        heroes_information
    WHERE
        Publisher = 'Marvel Comics'
            AND Height > (SELECT 
                AVG(Height)
            FROM
                heroes_information);
                
SELECT * FROM hero_view;

SELECT * FROM hero_battles;
SELECT * FROM heroes_information;
SELECT * FROM super_hero_powers;

-- 11.
-- Find the male super hero who is tall, has max weight, can jump and agile.
-- find who is on 2nd spot.


SELECT DISTINCT
    hi.name,
    MAX(hi.Height),
    MAX(hi.Weight),
    shr.agility,
    shr.jump
FROM
    heroes_information hi
        INNER JOIN
    super_hero_powers shr ON hi.name = shr.hero_names
WHERE
    hi.Gender = 'male'
GROUP BY hi.name , shr.Agility , shr.Jump
HAVING shr.Agility = 'true'
    AND shr.jump = 'true'
ORDER BY MAX(weight) DESC , MAX(Height) DESC
LIMIT 1 OFFSET 1;