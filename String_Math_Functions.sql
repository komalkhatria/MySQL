use sakila;

-- dual is a dummy table

-- STRING FUNCTIONS

-- lower()		=> convert upper case string to lower case
select first_name, lower(first_name) from actor;

-- upper()		=> convert lower case string to upper case
select upper("hello") from dual;	
	

-- length()		=> gives length of a string in terms of bytes
select length('한') from dual;		-- the korean character here takes 3 bytes for each character while in english, only 1 byte is used

-- char_length()		=> gives length in terms of count of characters
select char_length('한') from dual;


-- concat()			=> add two words or strings
select concat(first_name, " ", last_name, "hello") as full_name from actor;

-- concat_ws()			=> add two words or strings with a symbol as concatenating symbol
select concat_ws(" ", first_name, last_name, "hllo") as full_name from actor;


-- substr()			=> find a sub string from the a string from the given position
select first_name, substr(first_name, 3) from actor;
select first_name, substr(first_name, 2, 4) from actor;


-- trim			=> used to cut the given symbol from the string
select length(trim("     hello  ")) from dual;
select length(trim(leading "h" from "  hello")) from dual;
select length(trim(trailing "o" from "helloooo      ")) from dual;
select length(trim(both "x" from "    xx hey xxxxxx")) from dual;

-- ltrim()
select length(ltrim("     hello  ")) from dual;

-- rtrim()
select length(rtrim("     hello  ")) from dual;



-- WANT TO GET DATA BASED ON CERTAIN FORMAT, SIZE OR LENGTH
-- lpad/rpad keep adding characters in starting/ending 
-- majorly used for numerical data

-- lpad()
select first_name, lpad(first_name, 4, "_") from actor;

-- rpad()
select first_name, rpad(first_name, 4, "_") from actor;



-- instr()     	=> find the occurrence of an alphabet
select first_name, instr(first_name, "e") from actor;

-- locate()			=> search the occurrence of an aphabet from a certain position
select first_name, locate("e", first_name, 3) from actor;

-- replace()			=> replace a substring with another string
select first_name, replace(first_name, "E", "#") from actor;

-- strcmp()			=> compares two strings, whether equal or not
select strcmp("nick", "nick") from dual;		-- 0
select strcmp("nick", "nicks") from dual;		-- -1
select strcmp("nicks", "nick") from dual;		-- 1
select strcmp("nicks", null) from dual;			-- null



-- MATH FUNCTIONS

-- mod()
select mod(10,3) from dual;		-- 1
select 10%3 from dual;		-- 1

-- pow()
select pow(2,4) from dual;		-- 16

-- sqrt()
select sqrt(16) from dual;		-- 4

-- rand()
select rand() from dual;		-- returns random floating value


-- round()
select round(10.247);		-- 10
select round(10.547);		-- 11

select round(10.247, 2);		-- 10.25
select round(10.242, 2);		-- 10.24

select round(83.97, -1);		-- 80
select round(87.97, -1);		-- 90
select round(263.80, -2);		-- 300
select round(213.80, -2);		-- 200


select truncate(10.247, 2);		-- 10.24
select truncate(246.247, -2);		-- 200
select truncate(876.247, -2);		-- 800


select floor(24.16);		-- 24
select ceil(24.16);		-- 25





