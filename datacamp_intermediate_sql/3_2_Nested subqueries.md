## Nested simple subqueries

```sql
SELECT
	-- Select the season and max goals scored in a match
	season,
    max(home_goal + away_goal) AS max_goals,
    -- Select the overall max goals scored in a match
   (SELECT max(home_goal + away_goal) FROM match) AS overall_max_goals,
   -- Select the max number of goals scored in any match in July
   (SELECT max(home_goal + away_goal) 
    FROM match
    WHERE id IN (
          SELECT id FROM match WHERE EXTRACT(MONTH FROM date) = 07)) AS july_max_goals
FROM match
GROUP BY season;
```

## Nest a subquery in FROM

Generate a list of matches where at least one team scored 5 or more goals.

```sql
-- Select matches where a team scored 5+ goals
SELECT
	country_id,
    season,
	id
FROM match
WHERE home_goal >= 5 OR away_goal >= 5;
```
Turn the query from the previous step into a subquery in the FROM statement.
COUNT the match ids generated in the previous step, and group the query by country_id and season.
```sql
-- Count match ids
SELECT
    country_id,
    season,
    count(id) AS matches
-- Set up and alias the subquery
FROM (
	SELECT
    	country_id,
    	season,
    	id
	FROM match
	WHERE home_goal >= 5 OR away_goal >= 5)
    AS subquery
-- Group by country_id and season
GROUP BY country_id, season;
```

Finally, declare the same query from step 2 as a subquery in FROM with the alias outer_s.
Left join it to the country table using the outer query's country_id column.
Calculate an AVG of high scoring matches per country in the main query.

```sql
SELECT
	c.name AS country,
    -- Calculate the average matches per season
	avg(outer_s.matches) AS avg_seasonal_high_scores
FROM country AS c
-- Left join outer_s to country
left join (
  SELECT country_id, season,
         COUNT(id) AS matches
  FROM (
    SELECT country_id, season, id
	FROM match
	WHERE home_goal >= 5 OR away_goal >= 5) AS inner_s
  -- Close parentheses and alias the subquery
  GROUP BY country_id, season) as outer_s
ON c.id = outer_s.country_id
GROUP BY country;
```
