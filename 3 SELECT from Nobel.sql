-- 1
SELECT yr, subject, winner FROM nobel
 WHERE yr = 1950;

-- 2
SELECT winner FROM nobel
 WHERE yr = 1962 
  AND subject = 'literature';

-- 3
SELECT yr, subject from nobel 
 WHERE winner = "Albert Einstein";
 
-- 4 
SELECT winner from nobel 
 WHERE subject="peace" 
  AND yr>=2000;
 
-- 5
SELECT * from nobel 
 WHERE subject="literature" 
  AND yr BETWEEN 1980 and 1989;
 
-- 6
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Thomas Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');
 
-- 7
SELECT winner from nobel 
 WHERE winner like"John %";
 
-- 8
SELECT yr, subject, winner from nobel 
 WHERE subject="physics" and yr=1980 
  OR subject="chemistry" and yr=1984;

-- 9
SELECT yr, subject, winner from nobel 
 WHERE yr=1980 
  AND subject NOT IN('Chemistry', 'Medicine');
 
-- 10
SELECT yr, subject, winner from nobel 
 WHERE subject='Medicine' and yr<1910
  OR subject='Literature' and yr>=2004;
 
-- 11
SELECT * from nobel
 WHERE winner= 'PETER GRÜNBERG';
 
-- 12
SELECT * FROM nobel
 WHERE winner= "EUGENE O'NEILL";
 
-- 13
SELECT winner, yr, subject from nobel
 WHERE winner LIKE "Sir%" 
  ORDER BY yr desc, winner;
  
-- 14
SELECT winner, subject FROM nobel
 WHERE yr=1984
  ORDER BY 
  CASE WHEN subject IN('Physics', 'Chemistry') THEN 1 ELSE 0 END,
  subject, winner;