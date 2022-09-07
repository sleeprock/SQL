
Существующую таблицу невозможно преобразовать в секционированную.

Создаем временную таблицу с той же структурой, что и data_base, с секционированием по acc_type

```sql
CREATE TABLE public.data_base_temp (
	retailername varchar(255) NULL,
	countrycode varchar(3) NULL,
	--...
	acc_type varchar(11) NULL,
	--...
	CONSTRAINT data_base_pkey PRIMARY KEY (id)
)
PARTITION BY RANGE (acc_type)
TABLESPACE data01_tbs
;
```

Select the date, home goals, and away goals in the main query.
Filter the main query for matches where the total goals scored exceed the value in the subquery.

```sql
SELECT 
	-- Select the date, home goals, and away goals scored
    date,
	home_goal,
	away_goal
FROM  matches_2013_2014
-- Filter for matches where total goals exceeds 3x the average
WHERE (home_goal + away_goal) >
       (SELECT 3 * AVG(home_goal + away_goal)
        FROM matches_2013_2014); 
```

## Filtering using a subquery with a list

Create a subquery in the WHERE clause that retrieves all unique hometeam_ID values from the match table.
Select the team_long_name and team_short_name from the team table. Exclude all values from the subquery in the main query.

```sql
SELECT 
	-- Select the team long and short names
	team_long_name,
	team_short_name
FROM team 
-- Exclude all values from the subquery
WHERE team_api_id NOT IN
     (select DISTINCT hometeam_id  FROM match);
```

## Filtering with more complex subquery conditions

Create a subquery in WHERE clause that retrieves all hometeam_ID values from match with a home_goal score greater than or equal to 8.
Select the team_long_name and team_short_name from the team table. Include all values from the subquery in the main query.

```sql
select team_long_name, team_short_name
from team 
where team_api_id in (
	select hometeam_id from match
	where home_goal >= 8
)
```
