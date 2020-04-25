--Joshua Martin
--JTM119
--Queries.sql

--------------------------------------------
--------------Organizer---------------------
--------------------------------------------
--Create User
call myCreateUser('jtm117', 'pass123', 2);

--Drop User
call dropUser('jtm117');


--Create Event
call createEvent(1,1, 1,'14-OCT-2004');

--Add event outcome uses ASSIGN MEDAL trigger

call addEventOutcome(1, 1, 1, 1, 1);

--------------------------------------------
------------------Coach---------------------
--------------------------------------------

--Create Team

call createTeam('Athens', 2004, '1000M Canoe Sprint', 'China', 'Successors', 'KOR-50M_Pistol_Men');

--Register Team

call registerTeam(73, 1);
--add Participant

call addParticipant('Joshua', 'Martin', 'China', 'Beijing', '16-NOV-1999');
--add team member

call addTeamMember(73, 88);
--drop team member
call dropTeamMember(88);

--login
create or replace procedure login(userName in string, password in string, role out number)
as
Begin
    select role_id into role from USER_ACCOUNT where username = userName and passkey = password;
End;
/

--display sport (this one has several parts)
    select dob from sport where sport_name  = '1000M Canoe Sprint';
    select event_Id from event natural join sport where sport_name ='1000M Canoe Sprint';
    select gender from event natural join sport where sport_name ='1000M Canoe Sprint';
    
    select fname, lname, country, medal_title
    from (select medal_id, event_ID, olympic_id, participant_id, team_id from scoreboard)
          natural join (select event_id, sport_id from event)
          natural join (select sport_id, sport_name from sport )
          natural join (select fname, lname, participant_id from participant)
          natural join (select medal_id, medal_title from medal )
          natural join (select team_id, country_id, country from country natural join team )
          natural join (select olympic_id, opening_date from olympics)
          where sport_name = '1000M Canoe Sprint'
          order by medal_id asc, opening_date asc;


--display Event
    select distinct host_city, fName, Lname, position, medal_title, sport_name
    from scoreboard natural join olympics natural join event natural join participant natural join medal natural join (team natural join sport) 
    where host_city = 'Athens' and event_id = 4
    order by position asc;


--country Ranking
select * from (
                select coalesce(country_code, cc2, cc3) as country_code, coalesce(gold, 0) as gold, coalesce(silver, 0) as silver, coalesce(bronze,0) as bronze, (3*coalesce(gold, 0)+ 2* coalesce(silver, 0) +coalesce(bronze,0)) as score
                from((
                (select country_id, country_code, count(medal_id) as gold
                from country natural join scoreboard natural join team natural join participant
                where medal_id = 1 and olympic_id = 4
                group by country_id, country_code) 
                full outer join
                (select country_id as c2Id, country_code as cc2, count(medal_id) as silver
                from country natural join scoreboard natural join team natural join participant
                where medal_id = 2 and olympic_id = 4
                group by country_id, country_code)  on c2Id = country_id
                full outer join     
                (select country_id as c3_id, country_code as cc3, count(medal_id) as bronze
                from country natural join scoreboard natural join team natural join participant
                where medal_id = 3 and olympic_id = 4
                group by country_id, country_code) on c3_Id = country_id
                ))
                ) natural join
                (   select country_code, min(event_time) as appeared
                from scoreboard natural join team natural join event natural join country
                where olympic_id = 4
                group by country_code)
                where country_code is not null
                order by score desc;

--Top k athletes
select fName, lName, gold, silver, bronze, rownum as rank from
                        (select coalesce(participant_id, pid2, pid3) as participant_id, coalesce(fname, fn1, fn2) as fName, coalesce(lname, ln1, ln2) as lName, coalesce(gold, 0) as gold, coalesce(silver,0) as silver, coalesce(bronze,0) as bronze, (3* coalesce(gold, 0) + 2*coalesce(silver,0) + 1 * coalesce(bronze,0)) as score from(
                        (select participant_id, fname, lname, count(medal_id) as gold
                        from  scoreboard natural join participant 
                        where medal_id = 1 and olympic_id = 4
                        group by participant_id, fname, lname) 
                        full outer join
						 (select participant_id as pid2, fname as fn1, lname as ln1, count(medal_id) as silver
                        from scoreboard natural join participant 
						 where medal_id = 2 and olympic_id = 4
						 group by participant_id, fname, lname)  on pid2 = participant_id
						 full outer join
						 (select participant_id as pid3, fname as fn2, lname as ln2, count(medal_id) as bronze
						 from scoreboard natural join participant 
						 where medal_id = 3 and olympic_id = 4
						 group by participant_id, fname, lname) on pid3 = participant_id
						 )
						order by score desc)
						where rownum <= 5;

--Connected Athletes
--My implementation required the use of java to create the query as is necessary but the building blocks are as follows
--Using n = 1
create or replace view connections as
select distinct fname, lname, participant_id
from EVENT_PARTICIPATION  natural join team natural join team_member natural join participant 
where event_id in (select event_id 
from EVENT_PARTICIPATION natural join team natural join team_member natural join participant
where participant_id = 1) and olympic_id = 3;

select * from connections;

--Logout
create or replace procedure logout(userNameLogin in string)
as
Begin
    update user_account set last_login = systimestamp where username = userNameLogin;
End;
/


