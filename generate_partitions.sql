SELECT  'CREATE TABLE public.products_d' || extract('DOY' from d::date) || '_' || extract('DOY' from d::date +6) || '_' || extract('YEAR' from d::date) ||
         ' PARTITION OF publicdata_base FOR VALUES FROM (''' || d::date || ''') TO (''' || d::date + 7 || ''');'
         FROM generate_series('2024-01-01'::date, '2025-01-01'::date, '1 week' ) AS d;
