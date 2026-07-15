use T20_database;

create table team (
teamID int primary key auto_increment,
team_name varchar(50) not null unique,
country varchar(50),
home_ground varchar(100)
);

create table player (
playerID int primary key auto_increment,
teamID int not null,
player_name varchar(30),
batting_style varchar(50),
bowling_style varchar(50),
role enum( 'Batsman','Bowler','All-Rounder','Wicketkeeper'),
is_active boolean default true,
foreign key (teamID) references team(teamID));

create table t20_match (
matchID int primary key auto_increment,
team1_id int not null,
team2_id int not null,
match_date date not null,
venue varchar(50),
match_type varchar(5) default 'T20',
toss_winner_id int,
toss_decision enum('Bat','Field'),
winner_team_ID int,
result varchar(100),
FOREIGN KEY(team1_ID) REFERENCES team(teamID),
FOREIGN KEY(team2_ID) REFERENCES team(teamID),
foreign key (toss_winner_id) references team(teamID),
foreign key (winner_team_id) references team(teamID)
);

create table match_team_role (
match_team_role_ID int primary key auto_increment,
Match_ID int not null,
team_ID int not null,
captain_playerID int not null,
wicketkeeper_playerID int not null,
foreign key (match_ID) references t20_match(matchID),
foreign key (team_ID) references team(teamID),
foreign key (captain_playerID) references player(playerID),
foreign key (wicketkeeper_playerID) references player(playerID)
);

create table innings (
inningsID int primary key,
Match_ID int not null,
innings_number int check (innings_number in (1,2)),
batting_teamID int not null,
bowling_teamID int not null,
total_runs int default 0,
wickets_lost int default 0,
overs_faced int,

foreign key (match_ID) references t20_match(matchID),
foreign key (batting_teamID) references team(teamID),
foreign key (bowling_teamID) references team(teamID)
);

create table batting_scorecard (
battingID int primary key,
inningsID int not null,
PlayerID int null,
runs int default 0,
Balls int default 0,
fours int default 0,
sixes int default 0,
strike_rate decimal (5,2),
is_out boolean default false,

foreign key (inningsID) references innings(inningsID),
foreign key (playerID) references player(playerID)
);

create table bowling_details (
bowlingID int primary key,
inningsID int not null,
playerID int not null,
overs decimal(4,1),
maiden int default 0,
runs_conceded int default 0,
wickets int default 0,
economy decimal(5,2),

foreign key (inningsID) references innings(inningsID),
foreign key (playerID) references player(playerID)
);

create table dismissal (
dismissalID int primary key,
battingID int not null,
dismissal_type varchar(40),
bowlerID int not null,
fielderID int,

foreign key (battingID) references batting_scorecard(battingID),
foreign key (bowlerID) references player(playerID),
foreign key (fielderID) references player(playerID)
);

create table ball_by_ball (
ballID int primary key,
inningsID int not null,
over_number int check (over_number between 0 and 20),
ball_number int check (ball_number between 1 and 6),
strikerID int not null,
nonstrikerID int not null,
bowlerID int not null,
runs_off_bat int default 0,
extras int default 0,
extra_type varchar(10),
is_wicket boolean default false,

foreign key (inningsID) references innings(inningsID),
foreign key (strikerID) references player(playerID),
foreign key (nonstrikerID) references player(playerID),
foreign key (bowlerID) references player(playerID)
);

create table substitution (
substitutionID int primary key,
matchID int not null,
teamID int not null,
playerout_ID int not null,
playerin_ID int not null ,
substituion_type varchar(50),

foreign key (matchID) references t20_match(matchID),
foreign key (teamId) references team(teamID),
foreign key (playerout_ID) references player(playerID),
foreign key (playerin_ID) references player(playerID)
);

create table umpire (
umpireID int primary key,
full_name varchar(100),
country varchar(50)
);

create table match_umpire (
matchID int not null,
umpireID int not null,

primary key (matchID, umpireID),
foreign key (matchID) references t20_match(matchID),
foreign key (umpireID) references umpire(umpireID)
);

create table match_conditions (
matchID int primary key,
weather varchar(100),
temperature decimal(4,1),
humidity int,
pitch_type varchar(50),

foreign key (matchID) references t20_match(matchID)
);

create table achievement_type (
achievement_typeID int primary key,
name varchar (50) unique not null,
description varchar(200),
applies_to varchar(20)
check (applies_to in ('player','team'))
);

create table match_achievement (
match_achievementID int primary key,
matchID int not null,
achievement_typeID int not null,
playerID int not null,
teamID int not null,


foreign key (matchID) references t20_match(matchID),
foreign key (achievement_typeID) references achievement_type(achievement_typeID),
foreign key (playerID) references player(playerID),
foreign key (teamId) references team(teamID)
);

CREATE TABLE playing_xi (
    playingXI_ID int primary key auto_increment,
    matchID int not null,
    teamID int not null,
    playerID int not null,
    batting_position int check (batting_position between 1 and 11),

    foreign key (matchID) references t20_match(matchID),
    foreign key(teamID) references team(teamID),
    foreign key (playerID) references player(playerID),

    UNIQUE (matchID, teamID, playerID),
    UNIQUE (matchID, teamID, batting_position)
);
