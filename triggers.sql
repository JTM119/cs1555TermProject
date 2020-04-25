--Joshua Martin
--JTM119
--Triggers 
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON


--Assign Medals -- This gives me a mutating trigger but I'm not sure if it actually does anything
CREATE OR REPLACE TRIGGER ASSIGN_MEDAL 
before insert on scoreboard
for each row
BEGIN
    :new.medal_id := :new.position;
END;
/


--Athlete Dismissal
CREATE OR REPLACE Trigger ATHLETE_DISMISSAL
before delete on Participant
for each row
declare 
    dismissed_id integer;
BEGIN
    --select participant_id into dismissed_id from participant where participant_id = :old.participant_id; --Get the participant ID to be used conveniently
    
    delete from scoreboard where  --Delete all of the medals from the scoreboard of anyone who was on his team
        scoreboard.participant_id in (select participant_id from team_member where team_id in (select team_id from team_member where participant_id = :old.participant_id));
    
    update event_participation
    set status = 'n'
    where team_id in (select team_id from team_member where participant_id = :old.participant_id) --Make all teams associated with the athlete inelligble
        and 1 > (select team_size from sport natural join team where team_id in (select team_id from team_member where participant_id =:old.participant_id));
    
   delete from event_participation where  team_id in (select team_id from team_member where participant_id = :old.participant_id) --Delete the team from that table if it's an atomic event
       and 1 = (select team_size from sport natural join team where team_id in (select team_id from team_member where participant_id = :old.participant_id));
        
    delete from team where  team_id in (select team_id from team_member where participant_id = dismissed_id) --Delete the team from that table if it's an atomic event
     and 1 = (select team_size from sport natural join team where team_id in (select team_id from team_member where participant_id = :old.participant_id));
        
     delete from team_member where (participant_id = :old.participant_id);
    

end;
/
    

--Enforce Capacity -- 
create or replace trigger ENFORCE_CAPACITY
before insert on EVENT
for each row
declare 
    ongoing_events integer;
    max_events integer;
    too_many Exception;
Begin
    select coalesce(count(*),0) into ongoing_events from event where venue_id = :new.venue_id;
    select capacity into max_events from Venue where venue.venue_id = :new.venue_id;
    if ongoing_events = max_events then
        Raise too_many;
        
    end if;
    Exception
    when too_many then dbms_output.put_line('Too many events at this venue');
    
end;
/


--Other triggers go here





--Supposed to check to see if the team size is allowed, but It keeps mutating when I try and count the number of people on the team
--Not sure how to get the full team size
create or replace trigger verify_team_size
after insert on TEAM_MEMBER
for each row
declare
    max_size integer;
    current_size integer;
Begin
    --select count(*) into current_size from TEAM_MEMBER where team_id = :new.team_id;
    select team_size into max_size 
    from sport natural join team
    where team_id = :new.team_id; 
    dbms_output.put_line('insert successfully');
end;
/





create or replace view connections as
select distinct fname, lname, participant_id
from EVENT_PARTICIPATION  natural join team natural join team_member natural join participant 
where event_id in (select event_id 
                    from EVENT_PARTICIPATION natural join team natural join team_member natural join participant
                    where participant_id = 1) and olympic_id = 1;
                    
select * from connections;


--Procedures to make the Queries easy to run

--------------------------------------------
--------------Organizer---------------------
--------------------------------------------
--Create User
create or replace procedure myCreateUser(username in string, passkey in string, role in number)
as 
Begin
    insert into User_Account values (User_id_seq.nextval, username, passkey, role, systimestamp); 
End;
/


--Drop User
create or replace procedure dropUser(uname in string)
as 
Begin
    delete from User_Account where username = uname; 
End;
/

--Create Event
create or replace procedure createEvent (sportId in number, venueId in number, gender in string, dateStart in string)
as
Begin
    insert into Event values (eventid_seq.nextval, sportId , venueId, gender, dateStart);
End;
/

--Add event outcome uses ASSIGN MEDAL trigger
create or replace procedure addEventOutcome(olympicID in number, teamId in number,eventId in number, participantId in number, positionNum in number)
as
Begin
    insert into scoreboard (olympic_id, event_id, team_id, participant_id, position) values(olympicID, teamId, eventId, participantId, positionNum);
End;
/


--------------------------------------------
------------------Coach---------------------
--------------------------------------------

--Create Team
create or replace procedure createTeam (city in string, year in number, sport in string, countryName in string, teamName in string, userName in string)
as

Begin    
    insert into team values (teamid_seq.nextval, (select distinct olympic_Id from olympics where host_city = city and rownum = 1),
                                teamName, (select distinct  country_Id from country where country = countryName and rownum = 1) ,
                                (select distinct  sport_Id from sport  where sport_name = sport and rownum = 1), (select distinct user_id from  user_Account where username = userName and rownum = 1));
End;
/

--Register Team
create or replace procedure registerTeam(teamId in number, eventId in number)
as
Begin
    insert into event_participation values(eventId, teamId, 'e');
End;
/

--add Participant
create or replace procedure addParticipant(fname in string, lname in string, nationality in string, birthplace in string,  dob in date)
as
Begin
    insert into participant values (participantid_seq.nextval, fname, lname, nationality, birthplace, dob);
End;
/

--add team member
create or replace procedure addTeamMember(teamId in number, participantId in number)
as
Begin
    insert into team_Member values (teamId, participantId);
end;
/

--drop team member
create or replace procedure dropTeamMember(participantId in number)
as
Begin
    delete from participant where participant_id = participantId;
end;
/

--login
create or replace procedure login(userName in string, password in string, role out number)
as
Begin
    select role_id into role from USER_ACCOUNT where username = userName and passkey = password;
End;
/

--Logout
create or replace procedure logout(userNameLogin in string)
as
Begin
    update user_account set last_login = systimestamp where username = userNameLogin;
End;
/
