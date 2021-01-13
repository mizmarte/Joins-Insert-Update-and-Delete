-- Write queries to return the following:
-- The following queries utilize the "world" database.

-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
SELECT cy.name
     , c.name
     , cy.population
FROM country AS c
INNER JOIN city AS cy
        ON c.code = cy.countrycode
WHERE cy.population > 1000000
       AND c.continent = 'Europe';


-- (36 rows)

-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
-- (2 rows)
SELECT cy.name
     , c.name
     , cy.population
FROM country AS c
INNER JOIN city AS cy
        ON c.code = cy.countrycode
INNER JOIN countrylanguage AS cl
        ON c.code = cl.countrycode
WHERE cl.language = 'French'
        AND cl.isofficial = 'true'
        AND cy.population > 1000000;


-- 3. The name of the countries and continents where the language Javanese is spoken
-- (1 row)
SELECT c.name
     , c.continent
FROM country AS c
INNER JOIN countrylanguage AS cl
        ON c.code = cl.countrycode
WHERE cl.language = 'Javanese'



-- 4. The names of all of the countries in Africa that speak French as an official language
-- (5 row)

SELECT c.name
FROM country AS c
INNER JOIN countrylanguage AS cl
        ON c.code = cl.countrycode
WHERE c.continent = 'Africa'
        AND cl.language = 'French'
        AND cl.isofficial = 'true';


-- 5. The average city population of cities in Europe
-- (average city population in Europe: 287,684)

SELECT AVG(cy.population)
FROM country AS c
INNER JOIN city AS cy
        ON c.code = cy.countrycode
WHERE c.continent = 'Europe';

-- 6. The average city population of cities in Asia
-- (average city population in Asia: 395,019)

SELECT AVG(cy.population)
FROM country AS c
INNER JOIN city AS cy
        ON c.code = cy.countrycode
WHERE c.continent = 'Asia';


-- 7. The number of cities in countries where English is an official language
-- (number of cities where English is official language: 523)

SELECT COUNT(cy.name)
FROM country AS c
INNER JOIN city AS cy
        ON c.code = cy.countrycode
INNER JOIN countrylanguage AS cl
        ON c.code = cl.countrycode
WHERE cl.language = 'English'
        AND cl.isofficial = 'true';


-- 8. The average population of cities in countries where the official language is English
-- (average population of cities where English is official language: 285,809)

SELECT AVG(cy.population)
FROM country AS c
INNER JOIN city AS cy
        ON c.code = cy.countrycode
INNER JOIN countrylanguage AS cl
        ON c.code = cl.countrycode
WHERE cl.language = 'English'
        AND cl.isofficial = 'true';


-- 9. The names of all of the continents and the population of the continent’s largest city
-- (6 rows, largest population for North America: 8,591,309)

SELECT c.continent
        , MAX(cy.population)
FROM country AS c
INNER JOIN city AS cy
        ON c.code = cy.countrycode
GROUP BY(c.continent);



-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city’s country
-- (29 rows)


SELECT cy.name
        , cl.language
FROM country AS c
INNER JOIN city AS cy
        ON c.code = cy.countrycode
INNER JOIN countrylanguage AS cl
        ON c.code = cl.countrycode
WHERE c.continent ='South America'
        AND cl.isofficial = 'true'
        AND cy.population > 1000000;
        
        
        
        