## COUNT using CASE WHEN

Create a CASE statement that identifies the id of matches played in the 2012/2013 season. Specify that you want ELSE values to be NULL.
Wrap the CASE statement in a COUNT function and group the query by the country alias.

```sql
SELECT 
	c.name AS country,
    -- Count games from the 2012/2013 season
	count(case when m.season = '2012/2013' 
        	then m.id ELSE NULL END) AS matches_2012_2013
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
group by c.name;
```

Create 3 CASE WHEN statements counting the matches played in each country across the 3 seasons.
END your CASE statement without an ELSE clause.

```sql
SELECT 
	c.name AS country,
    -- Count matches in each of the 3 seasons
	count(case when m.season = '2012/2013' THEN m.id END) AS matches_2012_2013,
	count(case when m.season = '2013/2014' THEN m.id END) AS matches_2013_2014,
	count(case when m.season = '2014/2015' THEN m.id END) AS matches_2014_2015
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
group by c.name;

```

## COUNT and CASE WHEN with multiple conditions

Create 3 CASE statements to "count" matches in the '2012/2013', '2013/2014', and '2014/2015' seasons, respectively.
Have each CASE statement return a 1 for every match you want to include, and a 0 for every match to exclude.
Wrap the CASE statement in a SUM to return the total matches played in each season.
Group the query by the country name alias.

```sql
SELECT 
	c.name AS country,
    -- Sum the total records in each season where the home team won
	sum(case when m.season = '2012/2013' AND m.home_goal > m.away_goal 
        THEN 1 ELSE 0 END) AS matches_2012_2013,
 	sum(case when m.season = '2013/2014' AND m.home_goal > m.away_goal
        THEN 1 ELSE 0 END) AS matches_2013_2014,
	sum(case when m.season = '2014/2015' AND m.home_goal > m.away_goal
        THEN 1 ELSE 0 END) AS matches_2014_2015
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY c.name;
```

## Calculating percent with CASE and AVG

Create 3 CASE statements to COUNT the total number of home team wins, away team wins, and ties, which will allow you to examine the total number of records.

```sql
SELECT 
    c.name AS country,
    -- Count the home wins, away wins, and ties in each country
	count(case when m.home_goal > m.away_goal THEN m.id 
        END) AS home_wins,
	count(case when m.home_goal < m.away_goal THEN m.id 
        END) AS away_wins,
	count(case when m.home_goal = m.away_goal THEN m.id 
        END) AS ties
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;
```

Calculate the percentage of matches tied using a CASE statement inside AVG.
Fill in the logical operators for each statement. Alias your columns as ties_2013_2014 and ties_2014_2015, respectively.

```sql
SELECT 
	c.name AS country,
    -- Calculate the percentage of tied games in each season
	avg(case when m.season='2013/2014' AND m.home_goal = m.away_goal THEN 1
			WHEN m.season='2013/2014' AND m.home_goal != m.away_goal THEN 0
			END) AS ties_2013_2014,
	avg(case when m.season='2014/2015' and m.home_goal = m.away_goal THEN 1
			WHEN m.season='2014/2015' and m.home_goal != m.away_goal THEN 0
			END) AS ties_2014_2015
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;
```

The previous "ties" columns returned values with 14 decimal points, which is not easy to interpret. Use the ROUND function to round to 2 decimal points.

```sql
SELECT 
	c.name AS country,
    -- Round the percentage of tied games to 2 decimal points
	Round(avg(CASE WHEN m.season='2013/2014' AND m.home_goal = m.away_goal THEN 1
			 WHEN m.season='2013/2014' AND m.home_goal != m.away_goal THEN 0
			 END),2) AS pct_ties_2013_2014,
	Round(avg(CASE WHEN m.season='2014/2015' AND m.home_goal = m.away_goal THEN 1
			 WHEN m.season='2014/2015' AND m.home_goal != m.away_goal THEN 0
			 END),2) AS pct_ties_2014_2015
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;
```

