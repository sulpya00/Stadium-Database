--Part1)
--2)
select t.name TableName, i.rows Records
from sysobjects t, sysindexes i
where t.xtype = 'U' and i.id = t.id and i.indid in (0,1)
order by TableName;
/*

*/

--Part 2)
--a)
select concat(home,'vs', away) as 'Game Name',home, away, STADIUM.STADIUM_NAME
from games
inner join STADIUM on STADIUM.CLUB#=GAMES.CLUB#
/*

*/

--g)
select distinct monthss, EMPLOYEE_FNAME as 'Employee'
from EMPLOYEE
order by monthss desc
/*

*/
--f)
select GAME_DATE,HOME,AWAY,STADIUM.CAPACITY, ORDERDETAILS.NUMBEROFTICKETS 
from GAMES
inner join STADIUM on GAMES.CLUB#=STADIUM.CLUB# 
inner join ORDERDETAILS on GAMES.GAME#=ORDERDETAILS.Game#
/*

*/

--i)
select NUMBEROFTICKETS, FIRST_NAME, LAST_NAME, CITY
from ORDERDETAILS
where CITY like '[mws]%'
/*

*/

--j)
select HOME, AWAY, GAME_RESULT, (win/19)*100 as 'win%' , (draw/19)*100 as 'draw%', (lose/19)*100 as 'lose%'
from GAMES
/*

*/

--k)
select HOME,AWAY
from GAMES, STADIUM s
where attendance < (75*s.CAPACITY/100)
/*

*/

--l)
select HOME, AWAY, GAME_RESULT,
case
	when win>0 then win*3
	when draw>0 then draw*1 
	when lose>0 then lose*0
end as points
from GAMES
/*

*/

--Part3)
BEGIN
	declare @name varchar(10);
	declare	@tdate date;
	declare	@dbname varchar(10);
	set @name='Aveek';
	set @tdate=SYSDATETIME();
	set @dbname='Arsenal';
	print @name;
	print @tdate;
	print @dbname;
end
/*

*/

--PART4)
--1)
Create or Alter PROCEDURE spo(
@GAME INT)

AS

BEGIN

SELECT home, away, Game_Date, NUMBEROFTICKETS
FROM ORDERDETAILS  JOIN Games  
	ON orderdetails.Game# = Games.Game#
WHERE Game# = @GAME

END;

GO
EXECUTE spo 1;
DROP PROCEDURE spo ;
/*

*/

--2)
Create or Alter PROCEDURE ga(
@stdname VARCHAR)
AS
BEGIN
SELECT STADIUM_NAME, game# as 'Total Games', NUMBEROFTICKETS
FROM STADIUM, ORDERDETAILS

where STADIUM_NAME=@stdname
and game# =1

	
END;

GO
EXECUTE ga 'Emirates Stadium';
DROP PROCEDURE ga;
/*

*/
--3)
Create or Alter PROCEDURE ga(
@tickerNO INT)
AS
BEGIN
SELECT LAST_NAME,FIRST_NAME,NUMBEROFTICKETS
FROM ORDERDETAILS 

where TICKET#=@tickerNO

	
END;

GO
EXECUTE ga 1;
DROP PROCEDURE ga;
/*

*/

--4)
Create or Alter PROCEDURE ga(
@tickerNO INT)
AS
BEGIN
SELECT ticket# as 'Customer ID',LAST_NAME,g.GAME#,g.GAME_DATE,g.HOME,NUMBEROFTICKETS
FROM ORDERDETAILS, GAMES g

where TICKET#=@tickerNO

	
END;

GO
EXECUTE ga 1;
DROP PROCEDURE ga;

/*

*/

