USE world;
-- In city table 'ID' is my Primary Key and 'CountryCode' is the foreign key
SELECT * FROM city;
SELECT * FROM country;

DESCRIBE city;

-- In country table 'Code' is my Primary Key.
SELECT count(Code), count(DISTINCT Code) FROM country;

SELECT c.ID, c.Name, c.CountryCode FROM city AS c;
SELECT cnt.Code, cnt.Name, cnt.Continent FROM country AS cnt;

-- Joining 'CountryCode' from city table to 'Code' of Country Table
SELECT c.ID, c.Name, c.CountryCode, cnt.Name, cnt.Continent FROM city AS c
JOIN country as cnt WHERE
c.CountryCode = cnt.code;

-- Find the City Name, Population, country name along with the government form for each city.
SELECT c.Name AS City_Name, c.Population AS City_Population, 
cnt.Name AS Country_Name, cnt.GovernmentForm FROM city AS c
JOIN country AS cnt WHERE
c.CountryCode = cnt.code
ORDER BY City_Name;

SELECT * FROM countrylanguage;
SELECT * FROM country;
-- Get the Country Name, population and the language spoken with the percentage of each language
SELECT cnt.Name, cnt.Population, cl.Language, cl.Percentage FROM country AS cnt 
JOIN countrylanguage AS cl WHERE
cnt.Code = cl.CountryCode;
