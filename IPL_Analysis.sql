use apna;
show tables;

CREATE TABLE matches (
    id INT,
    season INT,
    city VARCHAR(50),
    date DATE,
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    toss_winner VARCHAR(100),
    toss_decision VARCHAR(20),
    result VARCHAR(30),
    dl_applied INT,
    winner VARCHAR(100),
    win_by_runs INT,
    win_by_wickets INT,
    player_of_match VARCHAR(100),
    venue VARCHAR(150),
    umpire1 VARCHAR(100),
    umpire2 VARCHAR(100),
    umpire3 VARCHAR(100)
);
DESC matches;

SELECT * FROM matches;

-- 1 Display all records from the matches table.
SELECT 
    *
FROM
    matches;

-- 2) Display only id, season, team1, and team2. 
SELECT 
    id, season, team1, team2
FROM
    matches;

-- 3) Find all matches played in the 2017 season.
select * from matches where season = 2017;

-- 4) Find all matches played in Mumbai.
SELECT 
    *
FROM
    matches
WHERE
    city = 'mumbai';

-- 5) Find all unique cities where matches were played.
SELECT DISTINCT
    city
FROM
    matches;


-- 6) Find all unique teams that appeared as team1.
SELECT DISTINCT
    team1
FROM
    matches;

-- 7) Find all unique player_of_match players.

SELECT DISTINCT
    player_of_match
FROM
    matches;
    
-- 8 ) Find matches where toss_decision was 'bat'.
SELECT 
    *
FROM
    matches
WHERE
    toss_decision = 'bat';
-- 9 ) Find matches where toss_decision was 'field'.

SELECT 
    *
FROM
    matches
WHERE
    toss_decision = 'field';
    
    
-- 10 )Find matches where result was 'normal'.

SELECT 
    *
FROM
    matches
WHERE
    result = 'normal';

-- 11) find matches where win_by_runs is greater than 50.
SELECT 
    *
FROM
    matches
WHERE
    win_by_runs > 50;
    
-- 12) Find matches where win_by_wickets is greater than 5
SELECT 
    *
FROM
    matches
WHERE
    win_by_wickets> 5;
-- 13 ) Find matches won by Mumbai Indians.

SELECT 
    *
FROM
    matches
WHERE
    winner = "Mumbai Indians";
-- 14) Find matches played at Wankhede Stadium.
SELECT 
    *
FROM
    matches
WHERE
    venue = "Wankhede Stadium";
-- 15 ) Find matches where dl_applied = 1.
SELECT 
    *
FROM
    matches
WHERE
    dl_applied = 1;
    
-- 16 ) Count the total number of matches.
SELECT 
    COUNT(*)
FROM
    matches;
-- 17 ) Count the number of matches played in each season.
SELECT 
    season, COUNT(season) AS matches_count_by_season
FROM
    matches
GROUP BY season;

-- 18) Find the number of matches played in each city.
SELECT 
    city, COUNT(city) AS matches_played_in_each_city
FROM
    matches
GROUP BY city
ORDER BY matches_played_in_each_city DESC;

-- 19)Find the number of matches won by each team.
SELECT 
    winner, COUNT(winner) AS matches_win_by_each_team
FROM
    matches
GROUP BY winner
ORDER BY matches_win_by_each_team DESC;

-- 20 Find the team with the highest number of wins.
    
    
    
-- 21 )Find the team with the lowest number of wins.
SELECT winner, COUNT(*) AS total_wins
FROM matches
GROUP BY winner
ORDER BY total_wins ASC
LIMIT 1
offset 1;

-- 22)Find the average win_by_runs.
SELECT 
    AVG(win_by_runs) AS avrage_of_winning_runs
FROM
    matches;
-- 23) Find the maximum win_by_runs.
SELECT 
    win_by_runs, winner
FROM
    matches
ORDER BY win_by_runs DESC
LIMIT 1;

-- 24) Find the maximum win_by_wickets.
SELECT 
    win_by_wickets, winner
FROM
    matches
ORDER BY win_by_wickets DESC
LIMIT 1;

-- 25) Find the minimum win_by_wickets.
SELECT 
    win_by_wickets, winner
FROM
    matches
ORDER BY win_by_wickets ASC
LIMIT 1
offset 1;

-- 26 )Find the number of matches won by each player_of_match.

SELECT 
    player_of_match,
    COUNT(player_of_match) AS matches_won_by_each_player_of_match
FROM
    matches
GROUP BY player_of_match
ORDER BY matches_won_by_each_player_of_match DESC
LIMIT 1;

-- 27) Find the top 10 Player of the Match award winners.

SELECT 
    player_of_match,
    COUNT(player_of_match) AS Number_of_maches
FROM
    matches
GROUP BY player_of_match
ORDER BY Number_of_maches DESC
LIMIT 10;
-- 28 )Find the number of matches played at each venue.
SELECT 
    venue,
    COUNT(venue) AS Number_of_maches1
FROM
    matches
GROUP BY venue
ORDER BY Number_of_maches1 DESC;

-- 29) Find venues where more than 20 matches were played.
SELECT 
    venue,
    COUNT(venue) AS Number_of_maches
FROM
    matches
GROUP BY venue
having Number_of_maches > 20
ORDER BY Number_of_maches DESC ; 

-- 30 Find the number of matches for each toss_decision.
SELECT 
    toss_decision, COUNT(toss_decision)
FROM
    matches
GROUP BY toss_decision;

-- 31) Find the team that won the most matches after winning the toss.


SELECT toss_winner, COUNT(*) AS wins_after_toss
FROM matches
WHERE toss_winner = winner
GROUP BY toss_winner
ORDER BY wins_after_toss DESC
LIMIT 1;

-- 32 Find the number of times each team won the toss.
SELECT 
    toss_winner, COUNT(toss_winner) as number_of_toss_win
FROM
    matches
GROUP BY toss_winner
order by number_of_toss_win desc;

-- 33) Find the percentage of matches where the toss winner also won the match.
SELECT 
    ROUND(
        SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) 
        * 100.0 / COUNT(*),
        2
    ) AS toss_winner_win_percentage
FROM matches;

-- 34) Find the highest-scoring-margin match (win_by_runs) and display its teams and winner
SELECT 
  team1,team2, winner, win_by_runs
FROM
    matches
order by win_by_runs desc
limit 1;

-- 35 Find the season with the highest number of matches.
select season,count(*) as number_of_maches_in_single_season 
from matches 
group by season 
order by number_of_maches_in_single_season desc;

-- 36 Find the Player of the Match who received the award most frequently.
SELECT 
    player_of_match, COUNT(player_of_match) AS award_count
FROM
    matches
GROUP BY player_of_match
ORDER BY award_count DESC
LIMIT 1;

-- 37 )Find the most common toss winner across all IPL matches.
SELECT 
    toss_winner, COUNT(toss_winner) AS number_of_toss_win
FROM
    matches
GROUP BY toss_winner
ORDER BY number_of_toss_win DESC
limit 1;

-- 38) Find players of the match whose names start with S.
select * from matches
where player_of_match like 's%';

-- 39)Find players of the match whose names end with Singh.
select * from matches
where player_of_match like '%singh';

-- 40) Find venues containing the word Stadium.
select * from matches
where venue like '%Stadium';

-- 41)Find teams containing the word Royal.
SELECT DISTINCT team
FROM (
    SELECT team1 AS team
    FROM matches

    UNION

    SELECT team2 AS team
    FROM matches
) AS teams
WHERE team LIKE '%Royal%';


-- 43)Find cities whose names contain the letter a.
select city from matches
group by city
having city  like '%a%';

-- 44) Find matches where player_of_match is NULL.

select * from matches
where player_of_match is not null;

-- 45)Count how many matches have no umpire3.
SELECT COUNT(*) AS no_umpire3
FROM matches
WHERE umpire3 IS NULL;

-- 46)Find matches played after 2018-01-01.
select * from matches
where date > 2018-01-01;

-- 47) Find the latest match date.
select date from matches
order by date desc
limit 1;

-- 48)Find the number of matches played in each month.
SELECT 
    MONTH(date) AS month,
    COUNT(*) AS total_matches
FROM matches
GROUP BY MONTH(date)
ORDER BY month;

-- 49) Find matches where win_by_wickets is greater than the average winning wickets.
SELECT *
FROM matches
WHERE win_by_wickets > (
    SELECT AVG(win_by_wickets)
    FROM matches
);

-- 50) Create a column showing `'Batting First'` 
-- when `toss_decision = 'bat'`, otherwise `'Fielding First'`.  
SELECT 
    toss_decision,
    CASE
        WHEN toss_decision = 'bat' THEN 'Batting First'
        ELSE 'Fielding First'
    END AS batting_or_fielding
FROM matches;
--  51) Create a column classifying matches as 
-- 'High Margin' when win_by_runs > 50, otherwise 'Low Margin'.
SELECT 
*,
    case 
    when win_by_runs > 50 then 'High Margin'
    else 'Low Margin'
    end as classifying_matches
FROM
    matches;
-- 52) Categorize winning runs into Low, Medium, and High.
SELECT 
*,
    case 
    when win_by_runs < 50 then 'low'
    when win_by_runs > 50 then 'medium'
    else 'Low '
    end as Categorize_winning_runs
FROM
    matches;
    
-- 53 Create a column showing 'DLS Match' or 'Normal Match'. 
select 
* ,
case 
when dl_applied = 0 then 'Normal Match '
else 'DLS Match'
end as 'DLS'
FROM
    matches;
-- 54) Show 'Won by Runs' when win_by_runs > 0, otherwise 'Won by Wickets'.
select 
* ,
case 
when win_by_runs > 0 then 'Won by Runs'
else 'Won by Wickets'
end as 'Won by Runs or win by wickets'
FROM
    matches;
-- 55)Find the number of matches won by runs vs wickets.
SELECT 
    CASE
        WHEN win_by_runs > 0 THEN 'Won by Runs'
        ELSE 'Won by Wickets'
    END AS Won_by_Runs_or_win_by_wickets,
    COUNT(*) AS total_matches
FROM matches
GROUP BY Won_by_Runs_or_win_by_wickets;