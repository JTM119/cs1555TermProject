--Joshua Martin
--JTM119
--Olympics Database Project
--Table Creation Script - Final Version

--AFTER CREATING THE TABLES CREATE ALL OF THE CONSTRAINTS
drop table EVENT_PARTICIPATION;
drop table SCOREBOARD;
drop table EVENT;
drop table VENUE;
drop table MEDAL;
drop table TEAM_MEMBER;
drop table TEAM;
drop table PARTICIPANT;
drop table COUNTRY;
drop table SPORT;
drop table OLYMPICS;
drop table USER_ACCOUNT;
drop table USER_ROLE;
drop sequence user_id_seq;
drop sequence olympicid_seq;
drop sequence countryid_seq;
drop sequence participantid_seq;
drop sequence eventid_seq;
drop sequence venueid_seq;
drop sequence teamid_seq;
drop sequence sportid_seq;

create table USER_ROLE(
    role_id integer not null,   
    role_name varchar2(20)not null,
    
    CONSTRAINT ROLE_PK PRIMARY KEY (role_id) initially immediate deferrable, 
    CHECK (role_id < 4), 
    CHECK (role_id > 0),
    CHECK (role_name in ('Organizer', 'Coach', 'Guest'))
);

create table USER_ACCOUNT (
    user_id integer not null,
    username varchar2(20) not null unique,
    passkey varchar2(20) not null,
    role_id integer not null,
    last_login date not null,

    CONSTRAINT USER_ACCOUNT_PK PRIMARY KEY (user_id) initially immediate deferrable ,
    CONSTRAINT USER_ACCOUNT_FK FOREIGN KEY (role_id) references USER_ROLE(role_id) initially immediate deferrable 
);

create sequence user_id_seq
start with 1
increment by 1
minvalue 0
maxvalue 10000000
nocycle;

create table OLYMPICS(
    olympic_id integer not null,
    olympic_num varchar2(30) not null unique,
    host_city varchar2(30) not null,
    opening_date date not null,
    closing_date date not null,
    official_website varchar2(50),

    CONSTRAINT OLYMPICS_PK PRIMARY KEY(olympic_id) initially immediate deferrable 
    
);

create sequence olympicID_seq
start with 1
increment by 1
minvalue 0
maxvalue 10000000
nocycle;

create table SPORT(
    sport_id integer not null,
    sport_name varchar2(30) not null,
    description varchar2(80) not null,
    dob date not null,
    team_size integer not null,
    CHECK (team_size > 0),
    CONSTRAINT SPORT_PK PRIMARY KEY (sport_id) initially immediate deferrable
);

create sequence SportID_seq
start with 1
increment by 1
minvalue 0
maxvalue 10000000
nocycle;




create table COUNTRY(
    country_id integer not null,
    country varchar2(20) not null unique,
    country_code varchar2(3) not null unique,
    
    CONSTRAINT COUNTRY_PK PRIMARY KEY (country_id) initially immediate deferrable 
);

create sequence countryid_seq
start with 1
increment by 1
minvalue 0
maxvalue 10000000
nocycle;

create table PARTICIPANT(
    participant_id integer not null,
    fname varchar2(30) not null,
    lname varchar2(30) not null,
    nationality varchar2(20) not null,
    birth_place varchar2(40) not null,
    dob date not null,

    CONSTRAINT PARTICIPANT_PK PRIMARY KEY (participant_id) initially immediate deferrable,
    CONSTRAINT PARTICIPANT_FK FOREIGN KEY (nationality) REFERENCES COUNTRY(country) initially deferred deferrable 
);
create sequence ParticipantID_seq
start with 1
increment by 1
minvalue 0
maxvalue 10000000
nocycle;

create table TEAM(
    team_id integer not null,
    olympic_id integer not null,
    team_name varchar2(20) not null,
    country_id integer not null,
    sport_id integer not null,
    coach_id integer not null,
    
    CONSTRAINT TEAM_PK PRIMARY KEY (team_id) initially immediate deferrable ,
    CONSTRAINT TEAM_COUNTRY_FK FOREIGN KEY (country_id) REFERENCES COUNTRY(country_id) initially immediate deferrable ,
    CONSTRAINT TEAM_OLYMPIC_ID_FK FOREIGN KEY (olympic_id) REFERENCES OLYMPICS(olympic_id) initially immediate deferrable ,
    CONSTRAINT TEAM_SPORT_FK FOREIGN KEY (sport_id) REFERENCES SPORT(sport_id) initially immediate deferrable ,
    CONSTRAINT TEAM_COACH_FK FOREIGN KEY (coach_id) REFERENCES USER_ACCOUNT(user_id) initially immediate deferrable 
    
);

create sequence teamid_seq
start with 1
increment by 1
minvalue 0
maxvalue 10000000
nocycle;


create table TEAM_MEMBER(
    team_id integer,
    participant_id integer,
    
    CONSTRAINT TEAM_MEMBER_PK PRIMARY KEY (team_id, participant_id) initially immediate deferrable ,
    CONSTRAINT TEAM_MEMBER_TEAMID FOREIGN KEY (team_id) REFERENCES TEAM(team_id) initially immediate deferrable ,
    CONSTRAINT TEAM_MEMBER_PARTICIPANT_ID FOREIGN KEY(participant_id) REFERENCES PARTICIPANT(participant_id) initially immediate deferrable 
);


create table MEDAL(
    medal_id integer,
    medal_title varchar2(6) not null,
    points integer not null,
    
    CONSTRAINT MEDAL_PK PRIMARY KEY (medal_id) initially immediate deferrable 
);


create table VENUE(
    venue_id integer not null,
    olympic_id integer not null,
    venue_name varchar2(30) not null,
    capacity integer not null,
    CHECK (capacity > 0),
    CONSTRAINT VENUE_PK PRIMARY KEY (venue_id) initially immediate deferrable ,
    CONSTRAINT VENUE_OLYMPIC_ID_FK FOREIGN KEY (olympic_id) REFERENCES OLYMPICS(olympic_id) initially immediate deferrable 
);

create sequence venueid_seq
start with 1
increment by 1
minvalue 0
maxvalue 10000000
nocycle;

create table EVENT(
    event_id integer not null,
    sport_id integer not null,
    venue_id integer not null,
    gender char not null,
    event_time date not null,
    --What check constraint should be here?
    CHECK (gender in ('m','M','f','F','b','B')),
    CONSTRAINT EVENT_PK PRIMARY KEY(event_id) initially immediate deferrable ,
    CONSTRAINT EVENT_SPORT_ID_FK FOREIGN KEY (sport_id) REFERENCES SPORT(sport_id) initially immediate deferrable ,
    CONSTRAINT EVENT_VENUE_ID FOREIGN KEY (venue_id) REFERENCES VENUE(venue_id) initially immediate deferrable 
);

create sequence eventid_seq
start with 1
increment by 1
minvalue 0
maxvalue 10000000
nocycle;

create table SCOREBOARD(
    olympic_id integer not null,
    event_id integer not null,
    team_id integer not null,
    participant_id integer not null,
    position integer not null,
    medal_id integer not null initially deferred,

    CONSTRAINT SCOREBOARD_PK PRIMARY KEY (event_id, participant_id, team_id, position) initially immediate deferrable ,
    CONSTRAINT SCOREBOARD_OLYMPICID_FK FOREIGN KEY(olympic_id) REFERENCES OLYMPICS(olympic_id) initially immediate deferrable ,
    CONSTRAINT SCOREBOARD_EVENT_ID_FK FOREIGN KEY (event_id) REFERENCES EVENT(event_id) initially immediate deferrable ,
    CONSTRAINT SCOREBOARD_TEAMID_FK FOREIGN KEY (team_id) REFERENCES TEAM(team_id) initially immediate deferrable ,
    CONSTRAINT SCOREBOARD_PARTICIPANT_ID_FK FOREIGN KEY(participant_id) REFERENCES PARTICIPANT(participant_id) initially immediate deferrable ,
    CONSTRAINT SCOREBOARD_MEDAL_ID_FK FOREIGN KEY(medal_id) REFERENCES MEDAL(medal_id) initially immediate deferrable 
);



create table EVENT_PARTICIPATION(
    event_id integer not null,
    team_id integer not null,
    status char not null,
    CHECK (status in ('e', 'n')),
    CONSTRAINT EVENT_PARTICIPATION_PK PRIMARY KEY (event_id, team_id) initially immediate deferrable, 
    CONSTRAINT EP_EVENT_ID_FK FOREIGN KEY (event_id) REFERENCES EVENT(event_id) initially immediate deferrable ,
    CONSTRAINT EP_TEAMID_FK FOREIGN KEY (team_id) REFERENCES TEAM(team_id) initially immediate deferrable
);

commit;











