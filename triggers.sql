--Joshua Martin
--JTM119
--Triggers 
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON


--Assign Medals


--Athlete Dismissal
CREATE OR REPLACE Trigger ATHLETE_DISMISSAL
After delete on Participant
for each row
declare 
    dismissed_id integer;
BEGIN
    select participant_id into dismissed_id from participant where participant_id = :old.participant_id; --Get the participant ID to be used conveniently
    
    delete from scoreboard where  --Delete all of the medals from the scoreboard of anyone who was on his team
        scoreboard.participant_id in (select participant_id from team_member where team_id in (select team_id from team_member where participant_id = dismissed_id));
    
    update event_participation
    set status = 'n'
    where team_id in (select team_id from team_member where participant_id = dismissed_id) --Make all teams associated with the athlete inelligble
        and 1 > (select team_size from sport natural join team where team_id in (select team_id from team_member where participant_id = dismissed_id));
    
   delete from event_participation where  team_id in (select team_id from team_member where participant_id = dismissed_id) --Delete the team from that table if it's an atomic event
       and 1 = (select team_size from sport natural join team where team_id in (select team_id from team_member where participant_id = dismissed_id));
        
    delete from team where  team_id in (select team_id from team_member where participant_id = dismissed_id) --Delete the team from that table if it's an atomic event
     and 1 = (select team_size from sport natural join team where team_id in (select team_id from team_member where participant_id = dismissed_id));
        
     delete from team_member where (participant_id = dismissed_id);
    

end;
/
    

--Enforce Capacity -- Do I really need to use count?
--create or replace trigger ENFORCE_CAPACITY
--before insert on EVENT
--for each row
--declare 
--    ongoing_events integer;
--    max_events integer;
--Begin
--    select count(*) into ongoing_events from event group by venue_id;
--    select capacity into max_events from Venue where venue.venue_id = venue_id;
--    if ongoing_events = max_events then
--        dbms_output.put_line('Too many events at this venue');
--    end if;
--end;
--/


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


