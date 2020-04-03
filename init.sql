--Joshua Martin
--JTM119
--Insert Statements
--init.sql

--Create the USER_ROLES (Role Id, Role name)
insert into USER_ROLE values (1, 'Organizer');
insert into USER_ROLE values (2, 'Coach');
insert into USER_ROLE values (3, 'Guest');


------------------------------------------------------------------------------------------------------------------------------------------
--Create USER ACCOUNT (User_id, Username, passkey, role_id, date last logged in

---------------------------------------------------------------------
---------------------Mens 50m Pistol 60 -----------------------------
---------------------------------------------------------------------
insert into USER_ACCOUNT values (1, 'KOR-50M_Pistol_Men', 'COACH', 2, '08-Aug-2008'); --KOR COACH 50M MENS PISTOL
insert into USER_ACCOUNT values (2, 'CHN-50M_Pistol_Men', 'COACH', 2, '08-Aug-2008'); --CHN COACH 50M MENS PISTOL
insert into USER_ACCOUNT values (3, 'RUS-50M_Pistol_Men', 'COACH', 2, '08-Aug-2008'); --RUS COACH 50M MENS PISTOL
insert into USER_ACCOUNT values (4, 'PRK-50M_Pistol_Men', 'COACH', 2 , '08-Aug-2008'); --PRK COACH 50 M Mens Pistol
insert into USER_ACCOUNT values (5, 'VIE-50M_Pistol_Men', 'COACH', 2, '08-Aug-2008'); --VIE  COACH 50 M Mens Pistol


---------------------------------------------------------------------
---------------------Mens Canoing 1000m -----------------------------
---------------------------------------------------------------------
insert into USER_ACCOUNT values (6, 'CAN-Canoe', 'COACH', 2, '08-Aug-2008'); --Canada canoeing coach
insert into USER_ACCOUNT values (7, 'GER-Canoe', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (8, 'ESP-Canoe', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (9, 'HUN-Canoe', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (10, 'BRA-Canoe', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (11, 'RUS-Canoe', 'COACH', 2, '08-Aug-2008');


---------------------------------------------------------------------
---------------------Womens Badmitten -----------------------------
---------------------------------------------------------------------
insert into USER_ACCOUNT values (12, 'JAP-BadmittenW', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (13, 'CHN-BadmittenW', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (14, 'DEN-BadmittenW', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (15, 'KOR-BadmittenW', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (16, 'RUS-BadmittenW', 'COACH', 2, '08-Aug-2008');

---------------------------------------------------------------------
---------------------Mens Badmitten -----------------------------
---------------------------------------------------------------------
insert into USER_ACCOUNT values (17, 'JAP-BadmittenM', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (18, 'CHN-BadmittenM', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (19, 'DEN-BadmittenM', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (20, 'KOR-BadmittenM', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (21, 'MAS-BadmittenM', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (22, 'INA-BadmittenM', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (23, 'GBR-BadmittenM', 'COACH', 2, '08-Aug-2008');

---------------------------------------------------------------------
---------------------Mixed Badmitten -----------------------------
---------------------------------------------------------------------
insert into USER_ACCOUNT values (24, 'JAP-BadmittenMixed', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (25, 'CHN-BadmittenMixed', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (26, 'DEN-BadmittenMixed', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (27, 'KOR-BadmittenMixed', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (28, 'MAS-BadmittenMixed', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (29, 'INA-BadmittenMixed', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (30, 'GBR-BadmittenMixed', 'COACH', 2, '08-Aug-2008');

---------------------------------------------------------------------
---------------------Singles Badmitten -----------------------------
---------------------------------------------------------------------
insert into USER_ACCOUNT values (31, 'JAP-BadmittenSingles', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (32, 'CHN-BadmittenSingles', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (33, 'NED-BadmittenSingles', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (34, 'IND-BadmittenSingles', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (35, 'ESP-BadmittenSingles', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (36, 'INA-BadmittenSingles', 'COACH', 2, '08-Aug-2008');
insert into USER_ACCOUNT values (37, 'GBR-BadmittenSingles', 'COACH', 2, '08-Aug-2008');
------------------------------------------------------------------------------------------------------------------------------------------

--Create the OLYMPIC GAMES NECESSARY (olympic id, number, begin date, end date, website)
insert into OLYMPICS values (1, 'XXIX', 'Beijing', '08-AUG-2008', '24-AUG-2008', 'https://www.olympic.org/beijing-2008');
insert into OLYMPICS values (2, 'XXX', 'London', '27-JUL-2012', '12-AUG-2012', 'https://www.olympic.org/london-2012');
insert into OLYMPICS values (3, 'XXX1', 'Rio', '05-AUG-2016', '21-AUG-2016', 'https://www.olympic.org/rio-2016');
insert into OLYMPICS values (4, 'XXVIII', 'Athens', '12-AUG-2004', '29-AUG-2004', 'https://www.olympic.org/athens-2004');
------------------------------------------------------------------------------------------------------------------------------------------

--SPORTS (sport id, event name, description, dob, team size)
insert into SPORT values (1, '50MPISTOLMEN', 'Shooting 50M Pistols- Mens', '12-OCT-1968', 1);
insert into SPORT values (2, '1000M Canoe Sprint', '1000 M canoing, singles, men', '01-Aug-1936', 1);
insert into SPORT values (3, 'Doubles Womens Badminton', 'Hitting a birdie over a net', '25-JUL-1992', 2);
insert into SPORT values (4, 'Doubles Mens Badminton', 'Hitting a birdie over a net',  '25-JUL-1992', 2);
insert into SPORT values (5, 'Mixed Doubles Badminton', 'Hitting a birdie over a net with men and women', '25-JUL-1992', 2);
insert into SPORT values (6, 'Womens Singles Badminton', 'Hitting a birdie over a net, but it is women by themselves', '25-JUL-1992', 1);
------------------------------------------------------------------------------------------------------------------------------------------
--COUNTRY (Id, Counry, Country Code)
insert into COUNTRY values (1, 'South Korea', 'KOR');
insert into COUNTRY values (2, 'China' , 'CHN');
insert into COUNTRY values (3, 'Russia', 'RUS');
insert into COUNTRY values (4, 'Vietnam', 'VIE');
insert into COUNTRY values (5, 'North Korea', 'PRK');
insert into COUNTRY values (6, 'Germany', 'GER');
insert into COUNTRY values (7, 'Brazil', 'BRA');
insert into COUNTRY values (8, 'Spain', 'ESP');
insert into COUNTRY values (9, 'Canada', 'CAN');
insert into COUNTRY values (10, 'Hungary', 'HUN');
insert into COUNTRY values (11, 'Japan', 'JAP');
insert into COUNTRY values (12, 'Denmark', 'DEN');
insert into COUNTRY values (13, 'Malaysia', 'MAS');
insert into COUNTRY values (14, 'Great Britain', 'GBR');
insert into COUNTRY values (15, 'Indonesia', 'INA');
insert into COUNTRY values (16, 'India', 'IND');
insert into COUNTRY values (17, 'Netherlands', 'NED');

------------------------------------------------------------------------------------------------------------------------------------------
--MEDALS (id, place, points)
insert into medal values (1, 'Gold', 3); 
insert into medal values (2, 'Silver', 2);
insert into medal values (3, 'Bronze', 1);

------------------------------------------------------------------------------------------------------------------------------------------
--VENUES (venue id, olympic id, venue name, capacity)
---------------------------------------------------------------------
---------------------Mens 50m Pistol 60 -----------------------------
---------------------------------------------------------------------
insert into VENUE values (1, 1, 'Beijing Shooting Range Hall', 6);--Shhoting locations
insert into VENUE values (2, 2, 'Royal Artillery Barracks', 6);
insert into VENUE values (3, 3, 'National Shooting Center', 6);
insert into VENUE values (4, 4, 'Rio Shooting Gallery', 4);
---------------------------------------------------------------------
---------------------Mens Canoing 1000m -----------------------------
---------------------------------------------------------------------
insert into VENUE values (5, 1, 'Shunyi Park', 1);
insert into VENUE values (6, 2, 'LeeValWhiteWaterCen', 1);
insert into VENUE values (7, 3, 'OlympWhiteWaterstdm', 2);
insert into VENUE values (8, 4, 'KayakSlalomCenter', 2);
---------------------------------------------------------------------
---------------------Womens/Mens/Mixed Badminton -----------------------------
---------------------------------------------------------------------
insert into VENUE values (9, 1 , 'Beijing Uni Tech', 5);
insert into VENUE values (10, 2, 'SEE Arena', 5);
insert into VENUE values (11, 3, 'RiocentroConvention', 5);
insert into VENUE values (12, 4, 'GoudiOlympicHall', 5);

------------------------------------------------------------------------------------------------------------------------------------------
--EVENT (event_id, sport id, venue id, gender, date)
--Gender 1 is male, 0 is female, 2 is for both
---------------------------------------------------------------------
---------------------Mens 50m Pistol 60 -----------------------------
---------------------------------------------------------------------
insert into EVENT values (1, 1, 1, 1, '10-AUG-2008');
insert into EVENT values (2, 1, 2, 1, '29-JUL-2012');
insert into EVENT values (3, 1, 3, 1, '13-AUG-2016');
insert into EVENT values (4, 1, 4, 1, '20-AUG-2004');
---------------------------------------------------------------------
---------------------Mens Canoing 1000m -----------------------------
---------------------------------------------------------------------
insert into EVENT values (5, 2, 5, 1, '12-AUG-2008');
insert into EVENT values (6, 2, 6, 1, '02-AUG-2012');
insert into EVENT values (7, 2, 7, 1, '15-AUG-2016');
insert into EVENT values (8, 2, 8, 1, '27-AUG-2004');
---------------------------------------------------------------------
---------------------Womens Badmitten -----------------------------
---------------------------------------------------------------------
insert into EVENT values (9, 3, 9, 0, '12-AUG-2008');
insert into EVENT values (10, 3, 10, 0, '02-AUG-2012');
insert into EVENT values (11, 3, 11, 0, '15-AUG-2016');
insert into EVENT values (12, 3, 12, 0, '27-AUG-2004');
---------------------------------------------------------------------
---------------------Mens Badmitten -----------------------------
---------------------------------------------------------------------
insert into EVENT values (13, 4, 9, 1, '12-AUG-2008');
insert into EVENT values (14, 4, 10, 1, '02-AUG-2012');
insert into EVENT values (15, 4, 11, 1, '15-AUG-2016');
insert into EVENT values (16, 4, 12, 1, '27-AUG-2004');

---------------------------------------------------------------------
---------------------Mixed Badmitten -----------------------------
---------------------------------------------------------------------
insert into EVENT values (17, 5, 9, 2, '12-AUG-2008');
insert into EVENT values (18, 5, 10, 2, '02-AUG-2012');
insert into EVENT values (19, 5, 11, 2, '15-AUG-2016');
insert into EVENT values (20, 5, 12, 2, '27-AUG-2004');

---------------------------------------------------------------------
---------------------Women's Singles Badmitten -----------------------------
---------------------------------------------------------------------
insert into EVENT values (21, 6, 9, 0, '12-AUG-2008');
insert into EVENT values (22, 6, 10, 0, '02-AUG-2012');
insert into EVENT values (23, 6, 11, 0, '15-AUG-2016');
insert into EVENT values (24, 6, 12, 20, '27-AUG-2004');


------------------------------------------------------------------------------------------------------------------------------------------
--PARTICIPANT (participant id, fname, lname, nationality, place of birth, dob)
---------------------------------------------------------------------
---------------------Mens 50m Pistol 60 -----------------------------
---------------------------------------------------------------------
insert into PARTICIPANT values (1, 'Jongoh', 'Jin', 'Korean', 'Chuncheon-si', '24-SEP-1979');
insert into PARTICIPANT values (2, 'ZongLiang', 'Tan', 'Chinese', 'Weifang', '29-NOV-1971');
insert into PARTICIPANT values (3, 'Vladimir', 'Isakov', 'Russian', 'Moscow Oblast', '28-Feb-1970');
insert into PARTICIPANT values (4, 'Young Rae', 'Choi', 'Korean',  'Danyang-gun', '13-May-1982');
insert into PARTICIPANT values (5, 'Zeiwei', 'Wang', 'Chinese', 'Jinzhong, Shanxi', '18-JUL-1988');
insert into PARTICIPANT values (6, 'XUÂN VINH', 'HOÀNG', 'Vietnamese', 'Hanoi', '06-OCT-1974');
insert into PARTICIPANT values (7, 'Song Guk', 'Kim', 'North Korean', 'North Korea', '11-APR-1984');
insert into PARTICIPANT values (8, 'Mikhail', 'Nestruev','Russian', 'Moscow', '28-OCT-1968');
insert into PARTICIPANT values (9, 'Jong Sue', 'Kim', 'North Korean', 'North Korea', '01-JAN-1977');
---------------------------------------------------------------------
---------------------Mens Canoing 1000m -----------------------------
---------------------------------------------------------------------
insert into PARTICIPANT values (10, 'David', 'Cal', 'Spanish', 'Galicia', '10-OCT-1982');
insert into PARTICIPANT values (11, 'Andreas', 'Dittmer', 'German', 'Neustrelitz', '16-APR-1972');
insert into PARTICIPANT values (12, 'Attila', 'Vajda', 'Hungarian', 'Szeged', '17-MAR-1983');
insert into PARTICIPANT values (13, 'Thomas', 'Hall', 'Canadian', 'Quebec', '21-FEB-1982');
insert into PARTICIPANT values (14, 'Sebsatian', 'Brendel', 'German', 'Schwedt', '12-MAR-1988');
insert into PARTICIPANT values (15, 'Mark', 'Oldershaw', 'Canadian', 'Burlington', '07-FEB -1983');
insert into PARTICIPANT values (16, 'Ilia', 'Shtokalov', 'Russian',  'Leningrad', '01-SEP-1986');
insert into PARTICIPANT values (17, 'Isaquias', 'Santos', 'Brazilian', 'Ubaitaba', '03-JAN-1994');

---------------------------------------------------------------------
---------------------Womens Badmitten -----------------------------
---------------------------------------------------------------------
insert into PARTICIPANT values (18, 'Yang', 'Wei', 'China', 'Hubei', '13-JAN-1979');
insert into PARTICIPANT values (19, 'Zhang', 'Jiewin', 'China', 'Guangzhou', '04-JAN-1981');
insert into PARTICIPANT values (20, 'Gau', 'Ling', 'China',	'Wuhan', '14-MAR-1979');
insert into PARTICIPANT values (21, 'Huang', 'Sui', 'China','Hunan', '08-JAN-1982');
insert into PARTICIPANT values (22, 'Lee', 'Kwung-won', 'Korea', 'Andong', '21-JAN-1980');
insert into PARTICIPANT values (23, 'Ra', 'Kyung-min', 'Korea','South Korea', '25-NOV-1976');

insert into PARTICIPANT values (24, 'Du', 'Jing', 'China', 'Anshan', '23-JUN-1984');
insert into PARTICIPANT values (25, 'Yu', 'Yang', 'China', 'Haicheng', '07-APR-1986');
insert into PARTICIPANT values (26, 'Lee', 'Hyo-jung', 'Korea',	'Busan', '12-Jan-1981');
insert into PARTICIPANT values (27, 'Lee', 'Kyung-won', 'Korea', 'Andong', '21-JAN-1980');
insert into PARTICIPANT values (28, 'Wei', 'Yili', 'China',	'Yichang', '24-JUN-1982');
insert into PARTICIPANT values (29, 'Zhang', 'Yawen', 'China', 'Chongqing', '09-MAR-1985');

insert into PARTICIPANT values (30, 'Tian', 'Qing', 'China', 'Anhua', '19-AUG-1986');
insert into PARTICIPANT values (31, 'Zhao', 'Yunlei','China', 'Yichang', '25-AUG-1986');
insert into PARTICIPANT values (32, 'Mizuki', 'Fujii', 'Japan', 'Ashikita', '05-AUG-1988');
insert into PARTICIPANT values (33, 'Reika', 'Kakiiwa',	'Japan','Kami-Amakusa', '19-JUL-1989');
insert into PARTICIPANT values (34,	'Valeria', 'Sorokina', 'Russia','Reshetikha', '29-MAR-1984'); 
insert into PARTICIPANT values (35, 'Nina', 'Vislova', 'Russia', 'Moscow', '04-OCT-1986');

insert into PARTICIPANT values (36, 'Misaki', 'Matsutomo', 'Japanese','Tokushima', '08-FEB-1992'); --2016
insert into PARTICIPANT values (37, 'Ayaka', 'Takahashi', 'Japanese', 'Kashihara', '19-APR-1990');
insert into PARTICIPANT values (38, 'Christinna', 'Pedersen', 'Denmark', 'Aalborg', '12-MAY-1986');
insert into PARTICIPANT values (39, 'Kamilla', 'Juhl', 'Denmark', 'Skagen', '23-NOV-1983');
insert into PARTICIPANT values (40, 'Jung', 'Kyung-eun', 'Korea', 'Masan', '20-MAR-1990');
insert into PARTICIPANT values (41, 'Shin', 'Seung-chan', 'Korea', 'Gochang-gun', '06-DEC-1994');
---------------------------------------------------------------------
---------------------Mens Badmitten -----------------------------
---------------------------------------------------------------------

insert into PARTICIPANT values(42, 'Ha', 'Tae-kwon', 'Korea', 'Jeonju', '30-APR-1975'); --2004
insert into PARTICIPANT values(43, 'Kim', 'Dong-moon','Korea', 'Gokseong', '22-SEP-1975');
insert into PARTICIPANT values(44, 'Lee', 'Dong-soo', 'Korea','Seoul', '07-JUN-1974');
insert into PARTICIPANT values(45, 'Yoo', 'Yong-sung', 'Korea','Dangjin', '25-OCT-1974');
insert into PARTICIPANT values(46, 'Eng', 'Hian', 'Indonesia', 'Surakarta', '17-MAY-1977');
insert into PARTICIPANT values(47, 'Flandy', 'Limpele','Indonesia', 'Manado', '09-FEB-1974');

insert into PARTICIPANT values(48, 'Markis', 'Kido', 'Indonesia', 'Jakarta', '11-AUG-1984');
insert into PARTICIPANT values(49, 'Hendra', 'Setiawan' ,'Indonesia', 'Pemalang', '25-AUG-1984');
insert into PARTICIPANT values(50, 'Cai', 'Yun', 'China','Suzhou',  '19-JAN-1980');
insert into PARTICIPANT values(51, 'Fu', 'Haifeng', 'China','Jieyang', '02-JAN-1984');
insert into PARTICIPANT values(52, 'Lee', 'Jae-jin', 'Korea', 'Miryang', '26-JAN-1983');
insert into PARTICIPANT values(53, 'Hwang', 'Ji-man','Korea', 'Miryang', '08-JUL-1984');

--50
--51
insert into PARTICIPANT values(54, 'Mathias', 'Boe', 'Denmark', 'Frederikssund', '11-JUL-1980');
insert into PARTICIPANT values(55, 'Carsten', 'Mogensen', 'Denmark', 'Roskilde', '24-JUL-1983');
insert into PARTICIPANT values(56, 'Jung', 'Jae-sung', 'Korea', 'Jeonju', '25-AUG-1982');
insert into PARTICIPANT values(57, 'Lee', 'Yong-dae', 'Korea', 'Hwasun', '11-SEP-1988');

--51
insert into PARTICIPANT values(58, 'Zhang', 'Nan', 'China', 'Beijing', '01-MAR-1990');
insert into PARTICIPANT values(59, 'Goh', 'Shem', 'Malaysia', 'Kuala Lumpur', '20-MAY-1989');
insert into PARTICIPANT values(60, 'Tan', 'Kiong', 'Malaysia', 'Muar', '21-MAY-1989');
insert into PARTICIPANT values(61, 'Chris', 'Langridge','Great Britain', 'Epsom', '02-MAY-1985');
insert into PARTICIPANT values(62, 'Marcus', 'Ellis', 'Great Britain', 'Huddersfield', '14-SEP-1989');


---------------------------------------------------------------------
---------------------Mixed Badmitten -----------------------------
---------------------------------------------------------------------

--20                                                                                        2004
insert into PARTICIPANT values(63, 'Zhang', 'Jun', 'China', 'Suzhou', '26-NOV-1977');
insert into PARTICIPANT values(64, 'Gail', 'Emms', 'Great Britain', 'Hitchin', '23-JUL-1977');
insert into PARTICIPANT values(65, 'Nathan', 'Robertson', 'Great Britain', 'Nottingham', '30-MAY-1977');
insert into PARTICIPANT values(66, 'Jens', 'Eriksen', 'Denmark','Glostrup', '30-DEC-1969');
insert into PARTICIPANT values(67,  'Mette', 'Schjoldager', 'Denmark','Viby', '21-APR-1977');

--26
--57
insert into PARTICIPANT values(68, 'Nova', 'Widianto', 'Indonesia', 'Indonesia', '10-OCT-1977');
insert into PARTICIPANT values(69, 'Lilyana', 'Natsir','Indonesia', 'Manado', '09-SEP-1985');
insert into PARTICIPANT values(70, 'He', 'Hanbin', 'China', 'Nanchang', '10-JAN-1986');
--25


--58
--31
insert into PARTICIPANT values(71, 'Xu', 'Chen', 'China', 'Jiangsu', '29-NOV-1984');
insert into PARTICIPANT values(72, 'Ma', 'Jin', 'China', 'Nantong', '07-MAY-1988');
insert into PARTICIPANT values(73, 'Joachim', 'Nielsen', 'Denmark', 'Gentofte', '23-NOV-1978');
--38

insert into PARTICIPANT values(74, 'Tontowi', 'Ahmad', 'Indoenesia', 'Banyumas', '18-JUL-1987');
--69
insert into PARTICIPANT values(75, 'Chan', 'Soon', 'Malaysia', 'George Town', '27-APR-1988');
insert into PARTICIPANT values(76, 'Goh', 'Ying', 'Malaysia', 'Malacca', '30-MAY-1989');
--58
--31


---------------------------------------------------------------------
---------------------Women's Singles Badmitten -----------------------------
---------------------------------------------------------------------
insert into PARTICIPANT values (77, 'Zhang', 'Ning', 'China', 'Jinzhou', '19-MAY-1975');
insert into PARTICIPANT values (78, 'Mia', 'Audina', 'Netherlands', 'Jakarta', '22-AUG-1979');
insert into PARTICIPANT values (79, 'Zhou', 'Mi', 'China', 'Nanning', '18-FEB-1979');

--77
insert into PARTICIPANT values (80, 'Xie', 'Xingfang', 'China', 'Guangzhou', '08-JAN-1981');
insert into PARTICIPANT values (81, 'Maria', 'Yulianti', 'Indonesia', 'Tuban', '25-JUN-1985');

insert into PARTICIPANT values (82, 'Li', 'Xuerui', 'China', 'Chongqing', '24-JAN-1991');
insert into PARTICIPANT values (83, 'Wang', 'Yihan', 'China', 'Shanghai', '18-JAN-1988');
insert into PARTICIPANT values (84, 'Saina', 'Nehwal', 'India', 'Hisar', '17-MAR-1990');

insert into PARTICIPANT values (85,	'Carolina', 'Marín', 'Spain', 'Huelva', '15-JUN-1993');
insert into PARTICIPANT values (86, 'Pusarla', 'Sindhu', 'India', 'Hyderabad', '05-JUL-1995');
insert into PARTICIPANT values (87, 'Nozomi', 'Okuhara', 'Japan', 'Ōmachi', '13-MAR-1995');


------------------------------------------------------------------------------------------------------------------------------------------
--TEAM (team id, olympic id, team name, country id, sport id, coachid)
---------------------------------------------------------------------
---------------------Mens 50m Pistol 60 -----------------------------
---------------------------------------------------------------------
insert into TEAM values (1, 1, '50M PISTOL MEN-KOR', 1, 1, 1); --Beijing Olympics Shooting
insert into TEAM values (2, 1, '50M PISTOL MEN-CHN', 2, 1, 2);
insert into TEAM values (3, 1, '50M PISTOL MEN-RUS', 3, 1, 3);

insert into TEAM values (4, 2, '50M PISTOL MEN-KOR', 1, 1, 1);--Beginning Second Olympics shooting
insert into TEAM values (5, 2, '50M PISTOL MEN-KOR', 1, 1, 1);
insert into TEAM values (6, 2, '50M PISTOL MEN-CHN', 2, 1, 2);

insert into TEAM values (7, 3, '50M PISTOL MEN-KOR', 1, 1, 1); --Beginning Third Olympics Shooting
insert into TEAM values (8, 3, '50M PISTOL MEN-VIE', 4, 1, 5);
insert into TEAM values (9, 3, '50M PISTOL MEN-PRK', 5, 1, 4);

insert into TEAM values (10, 4, '50M PISTOL MEN-RUS', 3, 1, 3); --Beginning of Athens Olympics Shooting
insert into TEAM values (11, 4, '50M PISTOL MEN-KOR', 1, 1, 1); 
insert into TEAM values (12, 4, '50M PISTOL MEN-PRK', 5, 1, 4);


---------------------------------------------------------------------
---------------------Mens Canoing 1000m -----------------------------
---------------------------------------------------------------------
insert into TEAM values (13, 4, 'ESP1000 M Canoe', 8, 2, 8);  --Athens Canoing Single 100M            --ESP, Ger, Hun
insert into TEAM values (14, 4, 'GER1000 M Canoe', 6, 2, 7); 
insert into TEAM values (15, 4, 'HUN1000 M Canoe', 10, 2, 9); 

insert into TEAM values (16, 1, 'HUN1000 M Canoe', 10, 2, 9); --Beijing Canoing
insert into TEAM values (17, 1, 'ESP1000 M Canoe', 8, 2, 8); 
insert into TEAM values (18, 1, 'CAN1000 M Canoe', 9, 2, 6);  --HUN, ESP, CAN

insert into TEAM values (19, 2, 'GER1000 M Canoe', 6, 2, 7); --London Canoing 
insert into TEAM values (20, 2, 'ESP1000 M Canoe', 8, 2, 8); 
insert into TEAM values (21, 2, 'CAN1000 M Canoe', 9, 2, 6); --GER, ESP, CAN

insert into TEAM values (22, 3, 'GER1000 M Canoe', 6, 2, 7); --Rio Canoing
insert into TEAM values (23, 3, 'BRA1000 M Canoe', 7, 2, 10);
insert into TEAM values (24, 3, 'RUS1000 M Canoe', 3, 2, 11);--GER BRA RUS


---------------------------------------------------------------------
---------------------Womens Badmitten -----------------------------
---------------------------------------------------------------------
insert into TEAM values (25, 4, 'WomensBadmitten2-CHN', 2, 3, 13); --2004
insert into TEAM values (26, 4, 'WomensBadmitten2-CHN', 2, 3, 13); 
insert into TEAM values (27, 4, 'WomensBadmitten2-KOR', 1, 3, 15);

insert into TEAM values (28, 1, 'WomensBadmitten2-CHN', 2, 3, 13); --2008
insert into TEAM values (29, 1, 'WomensBadmitten2-KOR', 1, 3, 15);
insert into TEAM values (30, 1, 'WomensBadmitten2-CHN', 2, 3, 13);

insert into TEAM values (31, 2, 'WomensBadmitten2-CHN', 2, 3, 13); --2012
insert into TEAM values (32, 2, 'WomensBadmitten2-JAP', 11, 3, 12);
insert into TEAM values (33, 2, 'WomensBadmitten2-RUS', 3, 3, 16);

insert into TEAM values (34, 3, 'WomensBadmitten2-JAP', 11, 3, 12); --2016
insert into TEAM values (35, 3, 'WomensBadmitten2-DEN', 12, 3, 14);
insert into TEAM values (36, 3, 'WomensBadmitten2-KOR', 1, 3, 15);


---------------------------------------------------------------------
-------------------------Mens Badmitten -----------------------------
---------------------------------------------------------------------
insert into TEAM values (37, 4, 'MensBadmitten2-KOR', 1, 4, 20); --2004
insert into TEAM values (38, 4, 'MensBadmitten2-KOR', 1, 4, 20); 
insert into TEAM values (39, 4, 'MensBadmitten2-INA', 15, 4, 22);

insert into TEAM values (40, 1, 'MensBadmitten2-INA', 15, 4, 22); --2008
insert into TEAM values (41, 1, 'MensBadmitten2-CHN', 2, 4, 18);
insert into TEAM values (42, 1, 'MensBadmitten2-KOR', 1, 4, 20);

insert into TEAM values (43, 2, 'MensBadmitten2-CHN', 2, 4, 18); --2012
insert into TEAM values (44, 2, 'MensBadmitten2-DEN', 12, 4, 19);
insert into TEAM values (45, 2, 'MensBadmitten2-KOR', 1, 4, 20);

insert into TEAM values (46, 3, 'MensBadmitten2-CHN', 2, 4, 18); --2016
insert into TEAM values (47, 3, 'MensBadmitten2-MAS', 13, 4, 21);
insert into TEAM values (48, 3, 'MensBadmitten2-GBR', 14, 4, 23);


---------------------------------------------------------------------
-------------------------Mixed Badmitten -----------------------------
---------------------------------------------------------------------
insert into TEAM values (49, 4, 'MixedBadmitten2-CHN', 2, 5, 25); --2004
insert into TEAM values (50, 4, 'MixedBadmitten2-GBR', 14, 5, 30); 
insert into TEAM values (51, 4, 'MixedBadmitten2-DEN', 12, 5, 26);

insert into TEAM values (52, 1, 'MixedBadmitten2-KOR', 1, 5, 27); --2008
insert into TEAM values (53, 1, 'MixedBadmitten2-INA', 15, 5, 29);
insert into TEAM values (54, 1, 'MixedBadmitten2-CHN', 2, 5, 25);

insert into TEAM values (55, 2, 'MixedBadmitten2-CHN', 2, 5, 25); --2012
insert into TEAM values (56, 2, 'MixedBadmitten2-CHN', 2, 5, 25);
insert into TEAM values (57, 2, 'MixedBadmitten2-DEN', 12, 5, 26);

insert into TEAM values (58, 3, 'MixedBadmitten2-INA', 15, 5, 29); --2016
insert into TEAM values (59, 3, 'MixedBadmitten2-MAS', 13, 5, 28);
insert into TEAM values (60, 3, 'MixedBadmitten2-CHN', 2, 5, 25);

---------------------------------------------------------------------
-------------------------Women's Single Badminton -----------------------------
---------------------------------------------------------------------
insert into TEAM values (61, 4, 'SingleBadmitten2-CHN', 2, 6, 32); --2004
insert into TEAM values (62, 4, 'SingleBadmitten2-NED', 17, 6, 37); 
insert into TEAM values (63, 4, 'SingleBadmitten2-CHN', 2, 6, 32);

insert into TEAM values (64, 1, 'SingleBadmitten2-CHN', 2, 6, 32); --2008
insert into TEAM values (65, 1, 'SingleBadmitten2-CHN', 2, 6, 32);
insert into TEAM values (66, 1, 'SingleBadmitten2-INA', 15, 6, 36);

insert into TEAM values (67, 2, 'SingleBadmitten2-CHN', 2, 6, 32); --2012
insert into TEAM values (68, 2, 'SingleBadmitten2-CHN', 2, 6, 32);
insert into TEAM values (69, 2, 'SingleBadmitten2-IND', 16, 6, 34);

insert into TEAM values (70, 3, 'SingleBadmitten2-JPN', 11, 6, 31); --2016
insert into TEAM values (71, 3, 'SingleBadmitten2-IND', 16, 6, 34);
insert into TEAM values (72, 3, 'SingleBadmitten2-ESP', 8, 6, 35);
------------------------------------------------------------------------------------------------------------------------------------------

--TEAM_MEMBER (team id, participant id)

---------------------------------------------------------------------
---------------------Mens 50m Pistol 60 -----------------------------
---------------------------------------------------------------------
insert into TEAM_MEMBER values (1,1); --shooting
insert into TEAM_MEMBER values (2,2);
insert into TEAM_MEMBER values (3,3);

insert into TEAM_MEMBER values (4,1);
insert into TEAM_MEMBER values (5,4);
insert into TEAM_MEMBER values (6,5);

insert into TEAM_MEMBER values (7, 1);
insert into TEAM_MEMBER values (8, 6);
insert into TEAM_MEMBER values (9, 7);

insert into TEAM_MEMBER values (10, 8);
insert into TEAM_MEMBER values (11, 1);
insert into TEAM_MEMBER values (12, 9);
 ---------------------------------------------------------------------
---------------------Mens Canoing 1000m -----------------------------
---------------------------------------------------------------------
insert into TEAM_MEMBER values (13, 10);--Canoing
insert into TEAM_MEMBER values (14, 11);
insert into TEAM_MEMBER values (15, 12);

insert into TEAM_MEMBER values (16, 12);
insert into TEAM_MEMBER values (17, 10);
insert into TEAM_MEMBER values (18, 13);

insert into TEAM_MEMBER values (19, 14);
insert into TEAM_MEMBER values (20, 10);
insert into TEAM_MEMBER values (21, 15);

insert into TEAM_MEMBER values (22, 14);
insert into TEAM_MEMBER values (23, 17);
insert into TEAM_MEMBER values (24, 16);

---------------------------------------------------------------------
---------------------Womens Badmitten -----------------------------
---------------------------------------------------------------------
insert into TEAM_MEMBER values (25, 18);
insert into TEAM_MEMBER values (25, 19);
insert into TEAM_MEMBER values (26, 20);
insert into TEAM_MEMBER values (26, 21);
insert into TEAM_MEMBER values (27, 22);
insert into TEAM_MEMBER values (27, 23);

insert into TEAM_MEMBER values (28, 24);
insert into TEAM_MEMBER values (28, 25);
insert into TEAM_MEMBER values (29, 26);
insert into TEAM_MEMBER values (29, 27);
insert into TEAM_MEMBER values (30, 28);
insert into TEAM_MEMBER values (30, 29);

insert into TEAM_MEMBER values (31, 30);
insert into TEAM_MEMBER values (31, 31);
insert into TEAM_MEMBER values (32, 32);
insert into TEAM_MEMBER values (32, 33);
insert into TEAM_MEMBER values (33, 34);
insert into TEAM_MEMBER values (33, 35);

insert into TEAM_MEMBER values (34, 36);
insert into TEAM_MEMBER values (34, 37);
insert into TEAM_MEMBER values (35, 38);
insert into TEAM_MEMBER values (35, 39);
insert into TEAM_MEMBER values (36, 40);
insert into TEAM_MEMBER values (36, 41);

---------------------------------------------------------------------
-------------------------Mens Badmitten -----------------------------
---------------------------------------------------------------------
insert into TEAM_MEMBER values (37, 42);
insert into TEAM_MEMBER values (37, 43);
insert into TEAM_MEMBER values (38, 44);
insert into TEAM_MEMBER values (38, 45);
insert into TEAM_MEMBER values (39, 46);
insert into TEAM_MEMBER values (39, 47);

insert into TEAM_MEMBER values (40, 48);
insert into TEAM_MEMBER values (40, 49);
insert into TEAM_MEMBER values (41, 50);
insert into TEAM_MEMBER values (41, 51);
insert into TEAM_MEMBER values (42, 52);
insert into TEAM_MEMBER values (42, 53);

insert into TEAM_MEMBER values (43, 50);
insert into TEAM_MEMBER values (43, 51);
insert into TEAM_MEMBER values (44, 54);
insert into TEAM_MEMBER values (44, 55);
insert into TEAM_MEMBER values (45, 56);
insert into TEAM_MEMBER values (45, 57);

insert into TEAM_MEMBER values (46, 58);
insert into TEAM_MEMBER values (46, 59);
insert into TEAM_MEMBER values (47, 51);
insert into TEAM_MEMBER values (47, 60);
insert into TEAM_MEMBER values (48, 61);
insert into TEAM_MEMBER values (48, 62);

---------------------------------------------------------------------
-------------------------Mixed Badmitten -----------------------------
---------------------------------------------------------------------
insert into TEAM_MEMBER values (49, 20);
insert into TEAM_MEMBER values (49, 63);
insert into TEAM_MEMBER values (50, 64);
insert into TEAM_MEMBER values (50, 65);
insert into TEAM_MEMBER values (51, 66);
insert into TEAM_MEMBER values (51, 67);

insert into TEAM_MEMBER values (52, 26);
insert into TEAM_MEMBER values (52, 57);
insert into TEAM_MEMBER values (53, 68);
insert into TEAM_MEMBER values (53, 69);
insert into TEAM_MEMBER values (54, 70);
insert into TEAM_MEMBER values (54, 25);

insert into TEAM_MEMBER values (55, 58);
insert into TEAM_MEMBER values (55, 31);
insert into TEAM_MEMBER values (56, 71);
insert into TEAM_MEMBER values (56, 72);
insert into TEAM_MEMBER values (57, 73);
insert into TEAM_MEMBER values (57, 38);

insert into TEAM_MEMBER values (58, 74);
insert into TEAM_MEMBER values (58, 69);
insert into TEAM_MEMBER values (59, 75);
insert into TEAM_MEMBER values (59, 76);
insert into TEAM_MEMBER values (60, 58);
insert into TEAM_MEMBER values (60, 31);

---------------------------------------------------------------------
---------------------Women's Badminton Single -----------------------------
---------------------------------------------------------------------
insert into TEAM_MEMBER values (61, 77);--Canoing
insert into TEAM_MEMBER values (62, 78);
insert into TEAM_MEMBER values (63, 79);

insert into TEAM_MEMBER values (64, 77);
insert into TEAM_MEMBER values (65, 80);
insert into TEAM_MEMBER values (66, 81);

insert into TEAM_MEMBER values (67, 82);
insert into TEAM_MEMBER values (68, 83);
insert into TEAM_MEMBER values (69, 84);

insert into TEAM_MEMBER values (70, 85);
insert into TEAM_MEMBER values (71, 86);
insert into TEAM_MEMBER values (72, 87);
insert into TEAM_MEMBER values (72, 86);

commit;
------------------------------------------------------------------------------------------------------------------------------------------


--SCOREBOARD (olympic id, event id, team id, participant id, position, medal id)
---------------------------------------------------------------------
---------------------Mens 50m Pistol 60 -----------------------------
---------------------------------------------------------------------

insert into SCOREBOARD values (1, 1, 1, 1, 1, 1);--Mens Shooting 2008
insert into SCOREBOARD values (1, 1, 2, 2, 2, 2);
insert into SCOREBOARD values (1, 1, 3, 3, 3, 3);

insert into SCOREBOARD values (2, 2, 4, 1, 1, 1);--Mens Shooting 2012
insert into SCOREBOARD values (2, 2, 5, 4, 2, 2);
insert into SCOREBOARD values (2, 2, 6, 5, 3, 3);

insert into SCOREBOARD values (3, 3, 7, 1, 1, 1);--Mens Shooting 2016
insert into SCOREBOARD values (3, 3, 8, 6, 2, 2);
insert into SCOREBOARD values (3, 3, 9, 7, 3, 3);

insert into SCOREBOARD values (4, 4, 10, 8, 1, 1);--Mens Shooting 2004
insert into SCOREBOARD values (4, 4, 11, 1, 2, 2);
insert into SCOREBOARD values (4, 4, 12, 9, 3, 3);
---------------------------------------------------------------------
---------------------Mens Canoing 1000m -----------------------------
---------------------------------------------------------------------
insert into SCOREBOARD values (4, 5, 13, 10, 1, 1);--Mens Canoing 2004
insert into SCOREBOARD values (4, 5, 14, 11, 2, 2);
insert into SCOREBOARD values (4, 5, 15, 12, 3, 3);

insert into SCOREBOARD values (1, 6, 16, 12, 1, 1);--Mens Canoing 2008
insert into SCOREBOARD values (1, 6, 17, 10, 2, 2);
insert into SCOREBOARD values (1, 6, 18, 13, 3, 3);

insert into SCOREBOARD values (2, 7, 19, 14, 1, 1);--Mens Canoing 2012
insert into SCOREBOARD values (2, 7, 20, 10, 2, 2);
insert into SCOREBOARD values (2, 7, 21, 15, 3, 3);

insert into SCOREBOARD values (3, 8, 22, 14, 1, 1);--Mens Canoing 2016
insert into SCOREBOARD values (3, 8, 23, 17, 2, 2);
insert into SCOREBOARD values (3, 8, 24, 26, 3, 3);

---------------------------------------------------------------------
---------------------Womens Badmitten -----------------------------
---------------------------------------------------------------------
insert into SCOREBOARD values(4, 9, 25, 18, 1, 1);
insert into SCOREBOARD values(4, 9, 25, 19, 1, 1);
insert into SCOREBOARD values(4, 9, 26, 20, 2, 2);
insert into SCOREBOARD values(4, 9, 26, 21, 2, 2);
insert into SCOREBOARD values(4, 9, 27, 22, 3, 3);
insert into SCOREBOARD values(4, 9, 27, 23, 3, 3);

insert into SCOREBOARD values(1, 10, 28, 24, 1, 1);
insert into SCOREBOARD values(1, 10, 28, 25, 1, 1);
insert into SCOREBOARD values(1, 10, 29, 26, 2, 2);
insert into SCOREBOARD values(1, 10, 29, 27, 2, 2);
insert into SCOREBOARD values(1, 10, 30, 28, 3, 3);
insert into SCOREBOARD values(1, 10, 30, 29, 3, 3);

insert into SCOREBOARD values(2, 11, 31, 30, 1, 1);
insert into SCOREBOARD values(2, 11, 31, 31, 1, 1);
insert into SCOREBOARD values(2, 11, 32, 32, 2, 2);
insert into SCOREBOARD values(2, 11, 32, 33, 2, 2);
insert into SCOREBOARD values(2, 11, 33, 34, 3, 3);
insert into SCOREBOARD values(2, 11, 33, 35, 3, 3);

insert into SCOREBOARD values(3, 12, 34, 36, 1, 1);
insert into SCOREBOARD values(3, 12, 34, 37, 1, 1);
insert into SCOREBOARD values(3, 12, 35, 38, 2, 2);
insert into SCOREBOARD values(3, 12, 35, 39, 2, 2);
insert into SCOREBOARD values(3, 12, 36, 40, 3, 3);
insert into SCOREBOARD values(3, 12, 36, 41, 3, 3);

---------------------------------------------------------------------
-------------------------Mens Badmitten -----------------------------
---------------------------------------------------------------------

insert into SCOREBOARD values(4, 13, 37, 42, 1, 1);
insert into SCOREBOARD values(4, 13, 37, 43, 1, 1);
insert into SCOREBOARD values(4, 13, 38, 44, 2, 2);
insert into SCOREBOARD values(4, 13, 38, 45, 2, 2);
insert into SCOREBOARD values(4, 13, 39, 46, 3, 3);
insert into SCOREBOARD values(4, 13, 39, 47, 3, 3);

insert into SCOREBOARD values(1, 14, 40, 48, 1, 1);
insert into SCOREBOARD values(1, 14, 40, 49, 1, 1);
insert into SCOREBOARD values(1, 14, 41, 50, 2, 2);
insert into SCOREBOARD values(1, 14, 41, 51, 2, 2);
insert into SCOREBOARD values(1, 14, 42, 52, 3, 3);
insert into SCOREBOARD values(1, 14, 42, 53, 3, 3);

insert into SCOREBOARD values(2, 15, 43, 50, 1, 1);
insert into SCOREBOARD values(2, 15, 43, 51, 1, 1);
insert into SCOREBOARD values(2, 15, 44, 54, 2, 2);
insert into SCOREBOARD values(2, 15, 44, 55, 2, 2);
insert into SCOREBOARD values(2, 15, 45, 56, 3, 3);
insert into SCOREBOARD values(2, 15, 45, 57, 3, 3);

insert into SCOREBOARD values(3, 16, 46, 51, 1, 1);
insert into SCOREBOARD values(3, 16, 46, 58, 1, 1);
insert into SCOREBOARD values(3, 16, 47, 59, 2, 2); 
insert into SCOREBOARD values(3, 16, 47, 60, 2, 2);
insert into SCOREBOARD values(3, 16, 48, 61, 3, 3);
insert into SCOREBOARD values(3, 16, 48, 62, 3, 3);

---------------------------------------------------------------------
-------------------------Mixed Badmitten ----------------------------
---------------------------------------------------------------------

insert into SCOREBOARD values(4, 17, 49, 20, 1, 1);
insert into SCOREBOARD values(4, 17, 49, 63, 1, 1);
insert into SCOREBOARD values(4, 17, 50, 64, 2, 2);
insert into SCOREBOARD values(4, 17, 50, 65, 2, 2);
insert into SCOREBOARD values(4, 17, 51, 66, 3, 3);
insert into SCOREBOARD values(4, 17, 51, 67, 3, 3);

insert into SCOREBOARD values(1, 18, 52, 26, 1, 1);
insert into SCOREBOARD values(1, 18, 52, 57, 1, 1);
insert into SCOREBOARD values(1, 18, 53, 68, 2, 2);
insert into SCOREBOARD values(1, 18, 53, 69, 2, 2);
insert into SCOREBOARD values(1, 18, 54, 70, 3, 3);
insert into SCOREBOARD values(1, 18, 54, 25, 3, 3);

insert into SCOREBOARD values(2, 19, 55, 58, 1, 1);
insert into SCOREBOARD values(2, 19, 55, 31, 1, 1);
insert into SCOREBOARD values(2, 19, 56, 71, 2, 2);
insert into SCOREBOARD values(2, 19, 56, 72, 2, 2);
insert into SCOREBOARD values(2, 19, 57, 73, 3, 3);
insert into SCOREBOARD values(2, 19, 57, 38, 3, 3);

insert into SCOREBOARD values(3, 20, 58, 74, 1, 1);
insert into SCOREBOARD values(3, 20, 58, 69, 1, 1);
insert into SCOREBOARD values(3, 20, 59, 75, 2, 2); 
insert into SCOREBOARD values(3, 20, 59, 76, 2, 2);
insert into SCOREBOARD values(3, 20, 60, 58, 3, 3);
insert into SCOREBOARD values(3, 20, 60, 31, 3, 3);


---------------------------------------------------------------------
---------------------Women's Single Badminton-----------------------------
---------------------------------------------------------------------
insert into SCOREBOARD values (4, 21, 61, 77, 1, 1);--2004
insert into SCOREBOARD values (4, 21, 62, 78, 2, 2);
insert into SCOREBOARD values (4, 21, 63, 79, 3, 3);

insert into SCOREBOARD values (1, 22, 64, 77, 1, 1);--2008
insert into SCOREBOARD values (1, 22, 65, 80, 2, 2);
insert into SCOREBOARD values (1, 22, 66, 81, 3, 3);

insert into SCOREBOARD values (2, 23, 67, 82, 1, 1);--2012
insert into SCOREBOARD values (2, 23, 68, 83, 2, 2);
insert into SCOREBOARD values (2, 23, 69, 84, 3, 3);

insert into SCOREBOARD values (3, 24, 70, 85, 1, 1);--2016
insert into SCOREBOARD values (3, 24, 71, 86, 2, 2);
insert into SCOREBOARD values (3, 24, 72, 87, 3, 3);
---------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------
--EVENT_PARTICIPATION (event id, team id, status)


---------------------------------------------------------------------
---------------------Mens 50m Pistol 60 -----------------------------
---------------------------------------------------------------------
insert into EVENT_PARTICIPATION values (1, 1, 'e');--Mens Shooting 2008
insert into EVENT_PARTICIPATION values (1, 2, 'e');
insert into EVENT_PARTICIPATION values (1, 3, 'e');

insert into EVENT_PARTICIPATION values (2, 4, 'e'); --Mens Shooting 2012
insert into EVENT_PARTICIPATION values (2, 5, 'e');
insert into EVENT_PARTICIPATION values (2, 6, 'e');

insert into EVENT_PARTICIPATION values (3, 7, 'e');--Mens Shooting 2016
insert into EVENT_PARTICIPATION values (3, 8, 'e');
insert into EVENT_PARTICIPATION values (3, 9, 'e');

insert into EVENT_PARTICIPATION values (4, 10, 'e');--Mens Shooting 2004
insert into EVENT_PARTICIPATION values (4, 11, 'e');
insert into EVENT_PARTICIPATION values (4, 12, 'e');
---------------------------------------------------------------------
---------------------Mens Canoing 1000m -----------------------------
---------------------------------------------------------------------
insert into EVENT_PARTICIPATION values (5, 13, 'e');--Mens Canoing 2004
insert into EVENT_PARTICIPATION values (5, 14, 'e');
insert into EVENT_PARTICIPATION values (5, 15, 'e');

insert into EVENT_PARTICIPATION values (6, 16, 'e');--Mens Canoing 2008
insert into EVENT_PARTICIPATION values (6, 17, 'e');
insert into EVENT_PARTICIPATION values (6, 18, 'e');

insert into EVENT_PARTICIPATION values (7, 19, 'e');--Mens Canoing 2012
insert into EVENT_PARTICIPATION values (7, 20, 'e');
insert into EVENT_PARTICIPATION values (7, 21, 'e');

insert into EVENT_PARTICIPATION values (8, 22, 'e');--Mens Canoing 2016
insert into EVENT_PARTICIPATION values (8, 23, 'e');
insert into EVENT_PARTICIPATION values (8, 24, 'e');

---------------------------------------------------------------------
---------------------Womens Badmitten -----------------------------
---------------------------------------------------------------------
insert into EVENT_PARTICIPATION values (9, 25, 'e');--Womens Badmitten 2004
insert into EVENT_PARTICIPATION values (9, 26, 'e');
insert into EVENT_PARTICIPATION values (9, 27, 'e');

insert into EVENT_PARTICIPATION values (10, 28, 'e');--Womens Badmitten 2008
insert into EVENT_PARTICIPATION values (10, 29, 'e');
insert into EVENT_PARTICIPATION values (10, 30, 'e');

insert into EVENT_PARTICIPATION values (11, 31, 'e');--Womens Badmitten 2012
insert into EVENT_PARTICIPATION values (11, 32, 'e');
insert into EVENT_PARTICIPATION values (11, 33, 'e');

insert into EVENT_PARTICIPATION values (12, 34, 'e');--Womens Badmitten 2016
insert into EVENT_PARTICIPATION values (12, 35, 'e');
insert into EVENT_PARTICIPATION values (12, 36, 'e');

---------------------------------------------------------------------
---------------------Mens Badmitten -----------------------------
---------------------------------------------------------------------
insert into EVENT_PARTICIPATION values (13, 37, 'e');--Mens Badmitten 2004
insert into EVENT_PARTICIPATION values (13, 38, 'e');
insert into EVENT_PARTICIPATION values (13, 39, 'e');

insert into EVENT_PARTICIPATION values (14, 40, 'e');--Mens Badmitten 2008
insert into EVENT_PARTICIPATION values (14, 41, 'e');
insert into EVENT_PARTICIPATION values (14, 42, 'e');

insert into EVENT_PARTICIPATION values (15, 43, 'e');--Mens Badmitten 2012
insert into EVENT_PARTICIPATION values (15, 44, 'e');
insert into EVENT_PARTICIPATION values (15, 45, 'e');

insert into EVENT_PARTICIPATION values (16, 46, 'e');--Mens Badmitten 2016
insert into EVENT_PARTICIPATION values (16, 47, 'e');
insert into EVENT_PARTICIPATION values (16, 48, 'e');

---------------------------------------------------------------------
---------------------Mixed Badmitten -----------------------------
---------------------------------------------------------------------
insert into EVENT_PARTICIPATION values (17, 49, 'e');--Mens Badmitten 2004
insert into EVENT_PARTICIPATION values (17, 50, 'e');
insert into EVENT_PARTICIPATION values (17, 51, 'e');

insert into EVENT_PARTICIPATION values (18, 52, 'e');--Mens Badmitten 2008
insert into EVENT_PARTICIPATION values (18, 53, 'e');
insert into EVENT_PARTICIPATION values (18, 54, 'e');

insert into EVENT_PARTICIPATION values (19, 55, 'e');--Mens Badmitten 2012
insert into EVENT_PARTICIPATION values (19, 56, 'e');
insert into EVENT_PARTICIPATION values (19, 57, 'e');

insert into EVENT_PARTICIPATION values (20, 58, 'e');--Mens Badmitten 2016
insert into EVENT_PARTICIPATION values (20, 59, 'e');
insert into EVENT_PARTICIPATION values (20, 60, 'e');

---------------------------------------------------------------------
---------------------Womens Single Badmitten -----------------------------
---------------------------------------------------------------------
insert into EVENT_PARTICIPATION values (21, 61, 'e');--Womens Badmitten 2004
insert into EVENT_PARTICIPATION values (21, 62, 'e');
insert into EVENT_PARTICIPATION values (21, 63, 'e');

insert into EVENT_PARTICIPATION values (22, 64, 'e');--Womens Badmitten 2008
insert into EVENT_PARTICIPATION values (22, 65, 'e');
insert into EVENT_PARTICIPATION values (22, 66, 'e');

insert into EVENT_PARTICIPATION values (23, 67, 'e');--Womens Badmitten 2012
insert into EVENT_PARTICIPATION values (23, 68, 'e');
insert into EVENT_PARTICIPATION values (23, 69, 'e');

insert into EVENT_PARTICIPATION values (24, 70, 'e');--Womens Badmitten 2016
insert into EVENT_PARTICIPATION values (24, 71, 'e');
insert into EVENT_PARTICIPATION values (24, 72, 'e');

commit;

