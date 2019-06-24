use assignment;
SET SQL_SAFE_UPDATES = 0;

-- All csv files are imported using import table wizard of MySQL Workbench. 
-- For each csv file, I have only imported the columns I required: Date, Close Price.

-- ------------------------------ Step 1 : : Finding Moving Averages for each of the tables---------------------------------------

-- 1.1 Adjusting bajaj_auto table to create a new table 'bajaj1' for calculating moving averages

-- 1.1.1 Altering the column name of Date to Date_text
alter table bajaj_auto
change `date` `date_text` text; 

-- 1.1.2 Creating a new column 'Date' which handles date in the correct format and data type
alter table bajaj_auto
add `Date` date;

update bajaj_auto
set `Date` = str_to_date(`date_text`,'%d-%M-%Y');

-- 1.1.3 Creating a new table 'bajaj1' which has columns: Date, Close Price, 20 Day MA & 50 Day MA
create table bajaj1 as 
select `Date`, `Close Price`, 
case when row_number() over w >=20 then
	round(avg(`Close Price`) over (order by `Date` asc rows between 19 preceding and current row),2)
	else null
end as `20 Day MA`,
case when row_number() over w >=50 then
	round(avg(`Close Price`) over (order by `Date` asc rows between 49 preceding and current row),2)
	else null
end as `50 Day MA`
from bajaj_auto
window w as (order by `Date` asc);

-- 1.1.4 Checking the new table 'bajaj1'
select *
from bajaj1;

-- 1.2 Adjusting eicher_motors table to create a new table 'eicher1' for calculating moving averages

-- 1.2.1 Altering the column name of Date to Date_text
alter table eicher_motors
change `date` `date_text` text; 

-- 1.2.2 Creating a new column 'Date' which handles date in the correct format and data type
alter table eicher_motors
add `Date` date;

update eicher_motors
set `Date` = str_to_date(`date_text`,'%d-%M-%Y');

-- 1.2.3 Creating a new table 'eicher1' which has columns: Date, Close Price, 20 Day MA & 50 Day MA
create table eicher1 as 
select `Date`, `Close Price`, 
case when row_number() over w >=20 then
	round(avg(`Close Price`) over (order by `Date` asc rows between 19 preceding and current row),2)
	else null
end as `20 Day MA`,
case when row_number() over w >=50 then
	round(avg(`Close Price`) over (order by `Date` asc rows between 49 preceding and current row),2)
	else null
end as `50 Day MA`
from eicher_motors
window w as (order by `Date` asc);

-- 1.2.4 Checking the new table 'eicher1'
select *
from eicher1;

-- 1.3 Adjusting hero_motocorp table to create a new table 'hero1' for calculating moving averages

-- 1.3.1 Altering the column name of Date to Date_text
alter table hero_motocorp
change `date` `date_text` text; 

-- 1.3.2 Creating a new column 'Date' which handles date in the correct format and data type
alter table hero_motocorp
add `Date` date;

update hero_motocorp
set `Date` = str_to_date(`date_text`,'%d-%M-%Y');

-- 1.3.3 Creating a new table 'hero1' which has columns: Date, Close Price, 20 Day MA & 50 Day MA
create table hero1 as 
select `Date`, `Close Price`, 
case when row_number() over w >=20 then
	round(avg(`Close Price`) over (order by `Date` asc rows between 19 preceding and current row),2)
	else null
end as `20 Day MA`,
case when row_number() over w >=50 then
	round(avg(`Close Price`) over (order by `Date` asc rows between 49 preceding and current row),2)
	else null
end as `50 Day MA`
from hero_motocorp
window w as (order by `Date` asc);

-- 1.3.4 Checking the new table 'hero1'
select *
from hero1;

-- 1.4 Adjusting infosys table to create a new table 'infosys1' for calculating moving averages

-- 1.4.1 Altering the column name of Date to Date_text
alter table infosys
change `date` `date_text` text;

-- 1.4.2 Creating a new column 'Date' which handles date in the correct format and data type
alter table infosys
add `Date` date;

update infosys
set `Date` = str_to_date(`date_text`,'%d-%M-%Y');

-- 1.4.3 Creating a new table 'infosys1' which has columns: Date, Close Price, 20 Day MA & 50 Day MA
create table infosys1 as 
select `Date`, `Close Price`, 
case when row_number() over w >=20 then
	round(avg(`Close Price`) over (order by `Date` asc rows between 19 preceding and current row),2)
	else null
end as `20 Day MA`,
case when row_number() over w >=50 then
	round(avg(`Close Price`) over (order by `Date` asc rows between 49 preceding and current row),2)
	else null
end as `50 Day MA`
from infosys
window w as (order by `Date` asc);

-- 1.4.4 Checking the new table 'infosys1'
select *
from infosys1;

-- 1.5 Adjusting tcs table to create a new table 'tcs1' for calculating moving averages

-- 1.5.1 Altering the column name of Date to Date_text
alter table tcs
change `date` `date_text` text; 

-- 1.5.2 Creating a new column 'Date' which handles date in the correct format and data type
alter table tcs
add `Date` date;

update tcs
set `Date` = str_to_date(`date_text`,'%d-%M-%Y');

-- 1.5.3 Creating a new table 'tcs1' which has columns: Date, Close Price, 20 Day MA & 50 Day MA
create table tcs1 as 
select `Date`, `Close Price`, 
case when row_number() over w >=20 then
	round(avg(`Close Price`) over (order by `Date` asc rows between 19 preceding and current row),2)
	else null
end as `20 Day MA`,
case when row_number() over w >=50 then
	round(avg(`Close Price`) over (order by `Date` asc rows between 49 preceding and current row),2)
	else null
end as `50 Day MA`
from tcs
window w as (order by `Date` asc);

-- 1.5.4 Checking the new table 'tcs1'
select *
from tcs1;

-- 1.6 Adjusting tvs_motors table to create a new table 'tvs1' for calculating moving averages

-- 1.6.1 Altering the column name of Date to Date_text
alter table tvs_motors
change `date` `date_text` text; 

-- 1.6.2 Creating a new column 'Date' which handles date in the correct format and data type
alter table tvs_motors
add `Date` date;

update tvs_motors
set `Date` = str_to_date(`date_text`,'%d-%M-%Y');

-- 1.6.3 Creating a new table 'tvs1' which has columns: Date, Close Price, 20 Day MA & 50 Day MA
create table tvs1 as 
select `Date`, `Close Price`, 
case when row_number() over w >=20 then
	round(avg(`Close Price`) over (order by `Date` asc rows between 19 preceding and current row),2)
	else null
end as `20 Day MA`,
case when row_number() over w >=50 then
	round(avg(`Close Price`) over (order by `Date` asc rows between 49 preceding and current row),2)
	else null
end as `50 Day MA`
from tvs_motors
window w as (order by `Date` asc);

-- 1.6.4 Checking the new table 'tvs1'
select *
from tvs1;

-- ------------------------------------------- Step 1 : : END -------------------------------------------------


-- -------------------------------------Step 2 : : Creating a Master Table-------------------------------------

-- 2.1 Creating a master table using the concept of inner join on tables bajaj1, eicher1, hero1, infosys1, tcs1, tvs1

create table master_table as 
select b.`Date`, b.`Close Price` as Bajaj, 
	tc.`Close Price` as TCS, 
    tv.`Close Price` as TVS, 
    i.`Close Price` as Infosys, 
    e.`Close Price` as Eicher, 
    h.`Close Price` as Hero
from bajaj1 b inner join eicher1 e on b.date = e.date 
	inner join hero1 h on b.date = h.date
    inner join infosys1 i on b.date = i.date 
    inner join tcs1 tc on b.date = tc.date
    inner join tvs1 tv on b.date = tv.date;
    
-- 2.1.2 Checking the master table

select *
from master_table;

-- ------------------------------------------- Step 2 : : END -------------------------------------------------


-- ----------------------------------- Step 3 : : Generating a signal ------------------------------------------

-- 3.1 Generating BUY/SELL/HOLD signal in a new table 'bajaj2' using existing table 'bajaj1'. The below logic is used:
-- 	   BUY: (Current row 20 DAY MA > Current row 50 DAY MA ) and (Previous row 20 DAY MA < Previous row 50 DAY MA)
-- 	   SELL: (Current row 20 DAY MA < Current row 50 DAY MA ) and (Previous row 20 DAY MA > Previous row 50 DAY MA)
--     HOLD: ((Current row 20 DAY MA > Current row 50 DAY MA) and (Previous row 20 DAY MA > Previous row 50 DAY MA) or
-- 			  (Current row 20 DAY MA < Current row 50 DAY MA) and (Previous row 20 DAY MA < Previous row 50 DAY MA))
-- 	   NULL: First 20 rows of 20 DAY MA and 50 rows of 50 DAY MA

create table bajaj2 as
select `Date`, `Close Price`,
case when (`20 Day MA`>`50 Day MA`) and (lag(`20 Day MA`) over w < lag(`50 Day MA`) over w) then 'BUY'
	 when (`20 Day MA`<`50 Day MA`) and (lag(`20 Day MA`) over w > lag(`50 Day MA`) over w) then 'SELL'
	 when ((`20 Day MA`>`50 Day MA`) and (lag(`20 Day MA`) over w > lag(`50 Day MA`) over w) or (`20 Day MA`<`50 Day MA`) and (lag(`20 Day MA`) over w < lag(`50 Day MA`) over w)) then 'HOLD'
	 else Null
end as `Signal`
from bajaj1
window w as (order by `Date`);

-- 3.1.1 Checking table bajaj2 for signal values

select *
from bajaj2;

-- 3.2 Generating BUY/SELL/HOLD signal in a new table 'eicher2' using existing table 'eicher1'.

create table eicher2 as
select `Date`, `Close Price`,
case when (`20 Day MA`>`50 Day MA`) and (lag(`20 Day MA`) over w < lag(`50 Day MA`) over w) then 'BUY'
	 when (`20 Day MA`<`50 Day MA`) and (lag(`20 Day MA`) over w > lag(`50 Day MA`) over w) then 'SELL'
	 when ((`20 Day MA`>`50 Day MA`) and (lag(`20 Day MA`) over w > lag(`50 Day MA`) over w) or (`20 Day MA`<`50 Day MA`) and (lag(`20 Day MA`) over w < lag(`50 Day MA`) over w)) then 'HOLD'
	 else Null
end as `Signal`
from eicher1
window w as (order by `Date`);

-- 3.2.1 Checking table eicher2 for signal values

select *
from eicher2;

-- 3.3 Generating BUY/SELL/HOLD signal in a new table 'hero2' using existing table 'hero1'.

create table hero2 as
select `Date`, `Close Price`,
case when (`20 Day MA`>`50 Day MA`) and (lag(`20 Day MA`) over w < lag(`50 Day MA`) over w) then 'BUY'
	 when (`20 Day MA`<`50 Day MA`) and (lag(`20 Day MA`) over w > lag(`50 Day MA`) over w) then 'SELL'
	 when ((`20 Day MA`>`50 Day MA`) and (lag(`20 Day MA`) over w > lag(`50 Day MA`) over w) or (`20 Day MA`<`50 Day MA`) and (lag(`20 Day MA`) over w < lag(`50 Day MA`) over w)) then 'HOLD'
	 else Null
end as `Signal`
from hero1
window w as (order by `Date`);

-- 3.3.1 Checking table hero2 for signal values

select *
from hero2;

-- 3.4 Generating BUY/SELL/HOLD signal in a new table 'infosys2' using existing table 'infosys1'.

create table infosys2 as
select `Date`, `Close Price`,
case when (`20 Day MA`>`50 Day MA`) and (lag(`20 Day MA`) over w < lag(`50 Day MA`) over w) then 'BUY'
	 when (`20 Day MA`<`50 Day MA`) and (lag(`20 Day MA`) over w > lag(`50 Day MA`) over w) then 'SELL'
	 when ((`20 Day MA`>`50 Day MA`) and (lag(`20 Day MA`) over w > lag(`50 Day MA`) over w) or (`20 Day MA`<`50 Day MA`) and (lag(`20 Day MA`) over w < lag(`50 Day MA`) over w)) then 'HOLD'
	 else Null
end as `Signal`
from infosys1
window w as (order by `Date`);

-- 3.4.1 Checking table infosys2 for signal values

select *
from infosys2;

-- 3.5 Generating BUY/SELL/HOLD signal in a new table 'tcs2' using existing table 'tcs1'.

create table tcs2 as
select `Date`, `Close Price`,
case when (`20 Day MA`>`50 Day MA`) and (lag(`20 Day MA`) over w < lag(`50 Day MA`) over w) then 'BUY'
	 when (`20 Day MA`<`50 Day MA`) and (lag(`20 Day MA`) over w > lag(`50 Day MA`) over w) then 'SELL'
	 when ((`20 Day MA`>`50 Day MA`) and (lag(`20 Day MA`) over w > lag(`50 Day MA`) over w) or (`20 Day MA`<`50 Day MA`) and (lag(`20 Day MA`) over w < lag(`50 Day MA`) over w)) then 'HOLD'
	 else Null
end as `Signal`
from tcs1
window w as (order by `Date`);

-- 3.5.1 Checking table infosys2 for signal values

select *
from tcs2;

-- 3.6 Generating BUY/SELL/HOLD signal in a new table 'tvs2' using existing table 'tvs1'.

create table tvs2 as
select `Date`, `Close Price`,
case when (`20 Day MA`>`50 Day MA`) and (lag(`20 Day MA`) over w < lag(`50 Day MA`) over w) then 'BUY'
	 when (`20 Day MA`<`50 Day MA`) and (lag(`20 Day MA`) over w > lag(`50 Day MA`) over w) then 'SELL'
	 when ((`20 Day MA`>`50 Day MA`) and (lag(`20 Day MA`) over w > lag(`50 Day MA`) over w) or (`20 Day MA`<`50 Day MA`) and (lag(`20 Day MA`) over w < lag(`50 Day MA`) over w)) then 'HOLD'
	 else Null
end as `Signal`
from tvs1
window w as (order by `Date`);

-- 3.6.1 Checking table tvs2 for signal values

select *
from tvs2;

-- ------------------------------------------- Step 3 : : END -------------------------------------------------


-- ----------------------------------- Step 4 : : User Define Function ----------------------------------------

-- 4.1 Creating a user defined fucntion which takes date as input and returns BUY/SELL/HOLD signal. 
--     For dates which do not qualify for determining a signal, 'Null' will be returned. 
-- 	   For dates which does not exist in the table, 'Null' will be returned.

Drop function if exists get_signal;

delimiter $$
create function get_signal(d date)
	returns text 
    deterministic
begin
	declare output text;
	select `Signal` into output 
    from bajaj2 
    where `Date`= d;
Return output;
end $$

Delimiter ;

-- 4.1.1 Evaluating the UDF created in the above step. Enter a valid date format (YYYY-MM-DD).

select get_signal('2018-01-02') as `Signal`;

-- 4.1.2 Cross checking the above result with a general select clasue

select `Signal`
from bajaj2
where `Date` = '2018-01-02';

-- ------------------------------------------- Step 4 : : END -------------------------------------------------







