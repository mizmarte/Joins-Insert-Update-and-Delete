-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)

SELECT *
FROM city
WHERE district = 'Kansas';

INSERT INTO city
(
        name
        , countrycode
        , district
        , population
)
VALUES
(
        'Smallville'
        , 'USA'
        , 'Kansas'
        , 45001

);

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.

SELECT *
FROM countrylanguage
WHERE countrycode = 'USA';


INSERT INTO countrylanguage
(
        countrycode
        , language
        ,isofficial
        ,percentage
)
VALUES
(
        'USA'
         , 'Kryptonese'
         , false
         , 0.0001
);


-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.

UPDATE countrylanguage
SET language = 'Krypto-babble'
WHERE language = 'Kryptonese';



-- 4. Set the US captial to Smallville, Kansas in the country table.

SELECT *
FROM country;

SELECT *
FROM city 
WHERE district = 'Kansas'; 

UPDATE country
SET capital = 4080
WHERE code = 'USA';

-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

SELECT *
FROM city
WHERE id = 4080;


DELETE FROM city
WHERE id = 4080;

/*
It did not succeed because:  Delete on table "city" violates foreign key constraint "country_capital_fkey" on table "country"
  Detail: Key (id)=(4080) is still referenced from table "country".
*/


-- 6. Return the US captial to Washington.


SELECT *
FROM country 
WHERE code = 'USA';

UPDATE country
SET capital = 3813
WHERE code = 'USA';


-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

SELECT *
FROM city 
WHERE district = 'Kansas'; 


DELETE FROM city
WHERE id = 4080;

/*
Yes because the capital id was no longer dependent on the country table

*/

-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)

SELECT countrycode
        , language
        , isofficial
        , NOT isofficial
FROM countrylanguage
WHERE countrycode IN (
        SELECT code
        FROM country
        WHERE indepyear BETWEEN 1800 AND 1972
);

BEGIN TRANSACTION;

UPDATE countrylanguage
SET isofficial = NOT isofficial
WHERE countrycode IN (
        SELECT code
        FROM country
        WHERE indepyear BETWEEN 1800 AND 1972
); 

COMMIT TRANSACTION;

-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4079 rows affected)

BEGIN TRANSACTION;

UPDATE city
SET population = (population / 1000);

SELECT *
FROM city;

COMMIT TRANSACTION;


-- 10. Assuming a country's surfacearea is expressed in square miles, convert it to 
-- square meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)

BEGIN TRANSACTION;


UPDATE country
SET surfacearea = (surfacearea * 2589988.1103)
WHERE code IN (
        SELECT countrycode
        FROM countrylanguage
        WHERE language = 'French' AND percentage > 20
);

SELECT surfacearea
FROM country;

COMMIT TRANSACTION;