--Joshua Martin
--JTM119
--Olympics Database Project
--Table Creation Script

--AFTER CREATING THE TABLES CREATE ALL OF THE CONSTRAINTS
drop table EVENT_PARTICIPATION;
drop table SCOREBOARD;
drop table EVENT;
drop table VENUE;
drop table MEDAL;
drop table TEAM_MEMBER;
drop table TEAM;
drop table COUNTRY;
drop table PARTICIPANT;
drop table SPORT;
drop table OLYMPICS;
drop table USER_ACCOUNT;
drop table USER_ROLE;

create table USER_ROLE(
    role_id integer,
    role_name varchar2(20),
    
    CONSTRAINT ROLE_PK PRIMARY KEY (role_id) initially deferred deferrable 
);

create table USER_ACCOUNT (
    user_id integer,
    username varchar2(20),
    passkey varchar2(20),
    role_id integer,
    last_login date,

    CONSTRAINT USER_ACCOUNT_PK PRIMARY KEY (user_id) initially deferred deferrable ,
    CONSTRAINT USER_ACCOUNT_FK FOREIGN KEY (role_id) references USER_ROLE(role_id) initially deferred deferrable 
);




create table OLYMPICS(
    olympic_id integer,
    olympic_num varchar2(30),
    host_city varchar2(30),
    opening_date date,
    closing_date date,
    official_website varchar2(50),

    CONSTRAINT OLYMPICS_PK PRIMARY KEY(olympic_id) initially deferred deferrable 
    
);


create table SPORT(
    sport_id integer,
    sport_name varchar2(30),
    description varchar2(80),
    dob date,
    team_size integer,
    
    CONSTRAINT SPORT_PK PRIMARY KEY (sport_id)
);

create table PARTICIPANT(
    participant_id integer,
    fname varchar2(30),
    lname varchar2(30),
    nationality varchar2(20),
    birth_place varchar2(40),
    dob date,

    CONSTRAINT PARTICIPANT_PK PRIMARY KEY (participant_id) initially deferred deferrable
    --CONSTRAINT PARTICIPANT_FK FOREIGN KEY (participant_id) REFERENCES USER_ACCOUNT(user_id) initially deferred deferrable 
);

create table COUNTRY(
    country_id integer,
    country varchar2(20),
    country_code varchar2(3),
    
    CONSTRAINT COUNTRY_PK PRIMARY KEY (country_id) initially deferred deferrable 
);

create table TEAM(
    team_id integer,
    olympics_id integer,
    team_name varchar2(20),
    country_id integer,
    sport_id integer,
    coach_id integer,
    
    CONSTRAINT TEAM_PK PRIMARY KEY (team_id) initially deferred deferrable ,
    CONSTRAINT TEAM_COUNTRY_FK FOREIGN KEY (country_id) REFERENCES COUNTRY(country_id) initially deferred deferrable ,
    CONSTRAINT TEAM_OLYMPIC_ID_FK FOREIGN KEY (olympics_id) REFERENCES OLYMPICS(olympic_id) initially deferred deferrable ,
    CONSTRAINT TEAM_SPORT_FK FOREIGN KEY (sport_id) REFERENCES SPORT(sport_id) initially deferred deferrable ,
    CONSTRAINT TEAM_COACH_FK FOREIGN KEY (coach_id) REFERENCES USER_ACCOUNT(user_id) initially deferred deferrable 
    
);


create table TEAM_MEMBER(
    team_id integer,
    participant_id integer,
    
    CONSTRAINT TEAM_MEMBER_PK PRIMARY KEY (team_id, participant_id) initially deferred deferrable ,
    CONSTRAINT TEAM_MEMBER_TEAMID FOREIGN KEY (team_id) REFERENCES TEAM(team_id) initially deferred deferrable ,
    CONSTRAINT TEAM_MEMBER_PARTICIPANT_ID FOREIGN KEY(participant_id) REFERENCES PARTICIPANT(participant_id) initially deferred deferrable 
);

create table MEDAL(
    medal_id integer,
    medal_title varchar2(6),
    points integer,
    
    CONSTRAINT MEDAL_PK PRIMARY KEY (medal_id) initially deferred deferrable 
);


create table VENUE(
    venue_id integer,
    olympics_id integer,
    venue_name varchar2(30),
    capacity integer,
    
    CONSTRAINT VENUE_PK PRIMARY KEY (venue_id) initially deferred deferrable ,
    CONSTRAINT VENUE_OLYMPIC_ID_FK FOREIGN KEY (olympics_id) REFERENCES OLYMPICS(olympic_id) initially deferred deferrable 
);



create table EVENT(
    event_id integer,
    sport_id integer,
    venue_id integer,
    gender integer,
    event_time date,
    
    CONSTRAINT EVENT_PK PRIMARY KEY(event_id) initially deferred deferrable ,
    CONSTRAINT EVENT_SPORT_ID_FK FOREIGN KEY (sport_id) REFERENCES SPORT(sport_id) initially deferred deferrable ,
    CONSTRAINT EVENT_VENUE_ID FOREIGN KEY (venue_id) REFERENCES VENUE(venue_id) initially deferred deferrable 
);

create table SCOREBOARD(
    olympics_id integer,
    event_id integer,
    team_id integer,
    participant_id integer,
    position integer,
    medal_id integer,

    CONSTRAINT SCOREBOARD_PK PRIMARY KEY (olympics_id, event_id, participant_id, medal_id) initially deferred deferrable ,
    CONSTRAINT SCOREBOARD_OLYMPICID_FK FOREIGN KEY(olympics_id) REFERENCES OLYMPICS(olympic_id) initially deferred deferrable ,
    CONSTRAINT SCOREBOARD_EVENT_ID_FK FOREIGN KEY (event_id) REFERENCES EVENT(event_id) initially deferred deferrable ,
    CONSTRAINT SCOREBOARD_TEAMID_FK FOREIGN KEY (team_id) REFERENCES TEAM(team_id) initially deferred deferrable ,
    CONSTRAINT SCOREBOARD_PARTICIPANT_ID_FK FOREIGN KEY(participant_id) REFERENCES PARTICIPANT(participant_id) initially deferred deferrable ,
    CONSTRAINT SCOREBOARD_MEDAL_ID_FK FOREIGN KEY(medal_id) REFERENCES MEDAL(medal_id) initially deferred deferrable 
);



create table EVENT_PARTICIPATION(
    event_id integer,
    team_id integer,
    status char,
    
    CONSTRAINT EVENT_PARTICIPATION_PK PRIMARY KEY (event_id, team_id) initially deferred deferrable 
);

commit;











