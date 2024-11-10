-- 1
SELECT name, continent, population FROM world;

-- 2
SELECT name FROM world
 WHERE population >=200000000;

-- 3
select name, gdp/population FROM world 
 WHERE population>=200000000;
 
-- 4 
select name, population/1000000 FROM world 
 WHERE continent="South America";
 
-- 5
select name, population FROM world
 WHERE name IN('France', 'Germany', 'Italy');
 
-- 6
select name FROM world 
 WHERE name like "%United%";
 
-- 7
select name, population, area FROM world
 WHERE area>3000000 OR population>250000000;
 
-- 8
select name, population, area FROM world
 WHERE area>3000000 XOR population>250000000;

-- 9
select name, round(population/1000000,2), round(gdp/1000000000, 2) FROM world 
 WHERE continent="South America";
 
-- 10
select name, round(gdp/population, -3) FROM world
 WHERE gdp>=1000000000000;
 
-- 11
SELECT name, capital FROM world
 WHERE length(name)= length(capital);
 
-- 12
SELECT name, capital FROM world
 WHERE LEFT(name,1)= left(capital,1) 
 AND name<>capital;
 
-- 13
SELECT name FROM world
 WHERE name LIKE '%a%' 
 AND name LIKE '%e%' 
 AND name LIKE '%i%' 
 AND name LIKE '%o%' 
 AND name LIKE '%u%' 
 AND name  NOT LIKE '% %';