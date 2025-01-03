-- 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

-- 2
SELECT name FROM world
  WHERE continent="Europe" and gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom');

-- 3
SELECT name, continent from world 
 WHERE continent IN(
  SELECT continent from world WHERE name IN('Argentina', 'Australia'))
   ORDER BY name;
 
-- 4 
SELECT name, population from world 
 WHERE population> (SELECT population from world 
					WHERE name='United Kingdom')
   AND population< (SELECT population from world 
                    WHERE name='Germany');
 
-- 5
SELECT name, concat(round (100*population/(SELECT population from world 
                                           WHERE name= 'Germany'), 0),'%') 
				                           as percentage from world 
 WHERE continent='Europe';
 
-- 6
SELECT name from world 
 WHERE gdp> ALL(SELECT gdp from world 
				WHERE continent= 'Europe' and gdp IS NOT NULL);
 
-- 7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
	 WHERE y.continent=x.continent);
 
-- 8
SELECT continent, name from world x
 WHERE name<= ALL( SELECT name from world y
				   WHERE x.continent= y.continent);

-- 9
SELECT name, continent, population from world x
 WHERE 25000000>= ALL (SELECT population from world y
                       WHERE x.continent= y.continent);		#
 
-- 10
SELECT name, continent from world x
 WHERE population > ALL
  (SELECT 3*population from world y 
   WHERE x.continent= y.continent 
   AND x.name!=y.name);		#