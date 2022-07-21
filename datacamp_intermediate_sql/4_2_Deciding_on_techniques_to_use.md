## Get team names with a subquery

### 1 my sub
```sql
select m.id,
       m.date,
       (m.home_goal + m.away_goal) as total,
       (select team_long_name
        from team t
        where m.hometeam_id = t.team_api_id) as home_team,
         (select team_long_name
        from team t
        where m.awayteam_id = t.team_api_id) as away_team

from match m

```

### 2 my join

```sql
select m.id,
       m.date,
       th.team_long_name as home,
       ta.team_long_name as away
from match m
left join team th
on th.team_api_id = m.hometeam_id
left join team ta on ta.team_api_id = m.awayteam_id
```

### Subqueries with joins

```sql
SELECT
	m.date,
    -- Get the home and away team names
    home.hometeam,
    away.awayteam,
    m.home_goal,
    m.away_goal
FROM match AS m

-- Join the home subquery to the match table
left JOIN (
  SELECT match.id, team.team_long_name AS hometeam
  FROM match
  LEFT JOIN team
  ON match.hometeam_id = team.team_api_id) AS home
ON home.id = m.id

-- Join the away subquery to the match table
LEFT JOIN (
  SELECT match.id, team.team_long_name AS awayteam
  FROM match
  LEFT JOIN team
  -- Get the away team ID in the subquery
  ON match.awayteam_id = team.team_api_id) AS away
ON away.id = m.id;
```

