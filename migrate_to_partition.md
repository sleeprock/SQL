
Существующую таблицу невозможно преобразовать в секционированную.

Переименовываем таблицу data_base в data_base_old

Создаем таблицу data_base с той же структурой, с секционированием по acc_type

```sql
CREATE TABLE public.data_base (
	retailername varchar(255) NULL,
	countrycode varchar(3) NULL,
	--...
	acc_type varchar(11) NULL,
	--...
	CONSTRAINT data_base_pkey PRIMARY KEY (id)
)
PARTITION BY LIST (acc_type)
TABLESPACE data01_tbs
;



```
Создаем секции для клиентов

```sql
CREATE TABLE db_abbott PARTITION OF data_base FOR VALUES IN ('ABBOTT');
--...

```

переносим данные в новую таблицу, создаем индексы такие же как были 

```sql
INSERT into public.data_base
select * from public.data_base_old

--ИЛИ ТАК
create table public.data_base (
    like data_base_old
    including defaults
    including constraints
    including indexes
);
```

создаем индексы для секций

проверяем работу с новой таблицей

удаляем старую
