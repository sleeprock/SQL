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
