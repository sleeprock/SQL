## ALL the subqueries EVERYWHERE

Extract the average number of home and away team goals in two SELECT subqueries.
Calculate the average home and away goals for the specific stage in the main query.
Filter both subqueries and the main query so that only data from the 2012/2013 season is included.
Group the query by the m.stage column.

```sql
SELECT
      m.stage,
      round(avg(m.home_goal + m.away_goal), 2) as avg_goals,
      round(
          (SELECT avg(home_goal + away_goal)
          from match
          where season = '2012/2013')
          , 2) as overall
from match as m
where season = '2012/2013'
GROUP BY m.stage
order by m.stage
```

## Add a subquery in FROM

Calculate the average home goals and average away goals from the match table for each stage in the FROM clause subquery.
Add a subquery to the WHERE clause that calculates the overall average home goals.
Filter the main query for stages where the average home goals is higher than the overall average.
Select the stage and avg_goals columns from the s subquery into the main query.

```sql
SELECT 
	-- Select the stage and average goals from the subquery
	s.stage,
	ROUND(s.avg_goals,2) AS avg_goals
FROM 
	-- Select the stage and average goals in 2012/2013
	(SELECT
		 stage,
         avg(home_goal + away_goal) AS avg_goals
	 FROM match
	 WHERE season = '2012/2013'
	 GROUP BY stage) AS s
WHERE 
	-- Filter the main query using the subquery
	s.avg_goals > (SELECT avg(home_goal + away_goal) 
                    FROM match WHERE season = '2012/2013');
```

## Add a subquery in SELECT

```sql
SELECT 
	-- Select the stage and average goals from s
	s.stage,
    ROUND(avg_goals,2) AS avg_goal,
    -- Select the overall average for 2012/2013
    (SELECT avg(home_goal + away_goal) from match WHERE season = '2012/2013') AS overall_avg
FROM 
	-- Select the stage and average goals in 2012/2013 from match
	(SELECT
		 stage,
         avg(home_goal + away_goal) AS avg_goals
	 FROM match
	 WHERE season = '2012/2013'
	 GROUP BY stage) AS s
WHERE 
	-- Filter the main query using the subquery
	s.avg_goals > (SELECT avg(home_goal + away_goal) 
                    FROM match WHERE season = '2012/2013');
```
