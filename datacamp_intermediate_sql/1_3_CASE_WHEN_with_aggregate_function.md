##COUNT using CASE WHEN

Create a CASE statement that identifies the id of matches played in the 2012/2013 season. Specify that you want ELSE values to be NULL.
Wrap the CASE statement in a COUNT function and group the query by the country alias.

```sql
SELECT 
	c.name AS country,
    -- Count games from the 2012/2013 season
	___(___ ___ m.season = '2012/2013' 
        	___ m.id ELSE ___ ___) AS matches_2012_2013
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
___ ___;
```
