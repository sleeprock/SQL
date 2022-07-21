## Slide to the left

In this exercise, you will expand on the examples discussed in the video, calculating the running total of goals scored by the FC Utrecht when they were the home team during the 2011/2012 season. Do they score more goals at the end of the season as the home or away team?

```sql
SELECT 
	date,
	home_goal,
	away_goal,
    -- Create a running total and running average of home goals
    sum(home_goal) over(ORDER BY date 
         ROWS BETWEEN unbounded preceding AND current row) AS running_total,
    avg(home_goal) over(ORDER BY date 
         ROWS BETWEEN unbounded preceding AND current row) AS running_avg
FROM match
WHERE 
	hometeam_id = 9908 
	AND season = '2011/2012';
```

## Slide to the right
In this exercise, you will slightly modify the query from the previous exercise by sorting the data set in reverse order and calculating a backward running total from the CURRENT ROW to the end of the data set (earliest record).

```sql
SELECT 
	-- Select the date, home goal, and away goals
	date,
    home_goal,
    away_goal,
    -- Create a running total and running average of home goals
    sum(home_goal) over(ORDER BY date DESC
         ROWS BETWEEN CURRENT ROW AND unbounded following) AS running_total,
    avg(home_goal) over(ORDER BY date DESC
         ROWS BETWEEN CURRENT ROW AND unbounded following) AS running_avg
FROM match
WHERE 
	awayteam_id = 9908 
    AND season = '2011/2012';
```
