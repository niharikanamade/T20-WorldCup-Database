use t20_database;
 -- Highest runs in tournament
SELECT p.player_name,t.team_name, SUM(bs.runs) AS total_runs
FROM batting_scorecard AS bs
JOIN player AS p
    ON bs.playerID = p.playerID
JOIN innings AS i
    ON bs.inningsID = i.inningsID
JOIN team AS t
    ON i.batting_teamID = t.teamID
GROUP BY p.playerID, p.player_name, t.team_name
ORDER BY total_runs DESC
LIMIT 10;

 -- highest wicket takers
 
 SELECT p.player_name, t.team_name, SUM(bd.wickets) AS total_wickets
FROM bowling_details bd
JOIN player p
ON bd.playerID = p.playerID
JOIN playing_xi px
ON bd.playerID = px.playerID
JOIN team t
ON px.teamID = t.teamID
GROUP BY p.playerID, p.player_name, t.team_name
ORDER BY total_wickets DESC
LIMIT 10;

 -- player of the matches list
 SELECT tm.matchID, p.player_name, t.team_name
FROM match_achievement ma
JOIN achievement_type at
ON ma.achievement_typeID = at.achievement_typeID
JOIN player p
ON ma.playerID = p.playerID
JOIN team t
ON ma.teamID = t.teamID
JOIN t20_match tm
ON ma.matchID = tm.matchID
WHERE at.name = 'Player of the Match'
ORDER BY tm.matchID;

 -- match results
 SELECT m.matchID, t1.team_name AS Team1, t2.team_name AS Team2, w.team_name AS Winner, m.result
FROM t20_match m JOIN team t1
ON m.team1_id = t1.teamID
JOIN team t2 ON m.team2_id = t2.teamID
JOIN team w ON m.winner_team_ID = w.teamID
ORDER BY m.matchID;

 -- top batting performance
SELECT p.player_name, tm.matchID, bs.runs, bs.Balls, bs.strike_rate
FROM batting_scorecard bs
JOIN player p ON bs.playerID = p.playerID
JOIN innings i ON bs.inningsID = i.inningsID
JOIN t20_match tm ON i.Match_ID = tm.matchID
ORDER BY bs.runs DESC
LIMIT 10;

 -- top balling performance
 SELECT p.player_name, tm.matchID, bd.wickets, bd.runs_conceded, bd.economy
FROM bowling_details bd
JOIN player p ON bd.playerID = p.playerID
JOIN innings i ON bd.inningsID = i.inningsID
JOIN t20_match tm ON i.Match_ID = tm.matchID
ORDER BY bd.wickets DESC, bd.runs_conceded ASC
LIMIT 10;

 -- total runs by each team
SELECT t.team_name, SUM(i.total_runs) AS total_runs
FROM innings i
JOIN team t ON i.batting_teamID = t.teamID
GROUP BY t.team_name
ORDER BY total_runs DESC;

