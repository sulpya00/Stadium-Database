--1)
select NUMBEROFTICKETS AS 'TICKETS SOLD', HOMETEAM, AWAYTEAM 
	FROM ORDERDETAILS, ORDER#
	
--2)		
SELECT GAME#, HOME, AWAY, attendance
FROM GAMES

--3)
SELECT GAME#, ATTENDANCE, RANK() OVER (ORDER BY ATTENDANCE ASC) RANK
FROM GAMES

--4)
SELECT GAMES.CLUB#, GAMES.GAME#, GAMES.HOME, GAMES.AWAY, GAMES.GAME_DATE
FROM GAMES
JOIN CLUB ON CLUB.CLUB#=GAMES.CLUB#

--5)
select distinct EMPLOYEE#, stateadd
from EMPLOYEE 

--7) 
select NUMBEROFTICKETS as 'Number of Customers', STATEADD
from ORDERDETAILS

--8)
SELECT GAME#, ATTENDANCE 
FROM GAMES


--9)
select game#, (attendance/CAPACITY *100) as percentage#
from GAMES, STADIUM

--10
select NUMBEROFTICKETS, FIRST_NAME, LAST_NAME, CITY
from ORDERDETAILS
where CITY like 'm%'

--11
select NUMBEROFTICKETS, LAST_NAME
from ORDERDETAILS

--12
select HOME, AWAY, GAME_RESULT, (win/19)*100 as 'win%' , (draw/19)*100 as 'draw%', (lose/19)*100 as 'lose%'
from GAMES


--13
select HOME,AWAY
from GAMES, STADIUM s
where attendance < s.CAPACITY

--14
select HOME, AWAY, GAME_RESULT
case
when win>0 then points+=3
when draw>0 then points+=1 
when lose>0 then points+=0
end as points
from GAMES