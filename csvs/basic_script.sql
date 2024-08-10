-- create table subclass (
-- Id int NOT NULL,
-- Name VARCHAR(255),
-- ClassId int NOT NULL,
-- PRIMARY KEY (Id),
-- FOREIGN KEY (ClassId) REFERENCES class(Id)
-- );

-- create table race (
-- Id int NOT NULL,
-- Name VARCHAR(255),
-- PRIMARY KEY (Id)
-- );

-- create table subrace (
-- Id int NOT NULL,
-- Name VARCHAR(255),
-- RaceId int NOT NULL,
-- PRIMARY KEY (Id),
-- FOREIGN KEY (RaceId) REFERENCES race(Id)
-- );

-- create table feat (
-- Id int NOT NULL,
-- Name VARCHAR(255),
-- PRIMARY KEY (Id)
-- );

-- create table player_character (
-- Id int NOT NULL,
-- Name VARCHAR(255),
-- RaceId int NOT NULL,
-- SubraceId int,
-- BackgroundID int NOT NULL,
-- CampaignId int NOT NULL,
-- PlayerId int NOT NULL,
-- BloodlineId int,
-- Level int,
-- Nickname VARCHAR(255),
-- Status VARCHAR(255),
-- Inactive BOOL,
-- Dead BOOL,
-- GameDeath BOOL,
-- Note BLOB,
-- PRIMARY KEY (Id),
-- FOREIGN KEY (RaceId) REFERENCES race(Id),
-- FOREIGN KEY (SubraceId) REFERENCES subrace(Id),
-- FOREIGN KEY (BackgroundId) REFERENCES background(Id),
-- FOREIGN KEY (CampaignId) REFERENCES campaign(Id),
-- FOREIGN KEY (PlayerId) REFERENCES player(Id),
-- FOREIGN KEY (BloodlineId) REFERENCES bloodline(Id)
-- );

-- create table character_feat (
-- Id int NOT NULL,
-- FeatId int NOT NULL,
-- CharacterId int NOT NULL,
-- PRIMARY KEY (Id),
-- FOREIGN KEY (FeatId) REFERENCES feat(Id),
-- FOREIGN KEY (CharacterId) REFERENCES player_character(Id)
-- );

-- create table character_class (
-- Id int NOT NULL,
-- ClassId int NOT NULL,
-- SubclassId int NOT NULL,
-- CharacterId int NOT NULL,
-- Level int,
-- PRIMARY KEY (Id),
-- FOREIGN KEY (ClassId) REFERENCES class(Id),
-- FOREIGN KEY (SubclassId) REFERENCES subclass(Id),
-- FOREIGN KEY (CharacterId) REFERENCES player_character(Id)
-- );-- 


select 
c.Id as ClassId,
c.Name as Class,
sc.Id as SubclassId,
sc.Name as Subclass
FROM class c, subclass sc
where sc.ClassId = c.Id;

select r.Id, r.Name, sr.Id, sr.Name 
from race r
LEFT JOIN subrace sr
ON r.Id = sr.RaceId;

select * from feat;

INSERT INTO feat(Id,Name)
VALUES('107','Changeling Metamorphosis');

ALTER TABLE character_class
alter SubclassId set DEFAULT null;

alter table character_class MODIFY column SubclassId Int;

create view david_sucks as
select
pc.Nickname,
pc.Name,
class.Name as Class,
subclass.Name as Subclass,
r.Name as Race,
sr.Name as Subrace,
bg.Name as Background,
camp.Name as Campaign,
p.Name as Player,
b.Name as Bloodline,
pc.Level,
pc.Status,
pc.Inactive,
pc.Dead,
pc.GameDeath
from player_character pc
join character_class char_class on pc.Id = char_class.CharacterId
join class class on class.Id = char_class.ClassId
left join subclass subclass on subclass.Id = char_class.SubclassId
join race r on r.Id = pc.RaceId
left join subrace sr on sr.Id = pc.SubraceId
join background bg on bg.Id = pc.BackgroundId
join campaign camp on camp.Id = pc.CampaignId
join player p on p.Id = pc.PlayerId
left join bloodline b on b.Id = pc.BloodlineId;

select * from david_sucks;






