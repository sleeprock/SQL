## Тестовое задание

прилагаются 2 файла:
infocity.sql - основные запросы
files_insert.sql - заполнение таблицы files

``` sql

-- Создаем таблицу work_types
drop table if exists work_types;
CREATE TABLE IF NOT EXISTS work_types (
   id int primary key not null,
   title varchar(256) not null
);

--Создаем таблицу stickers
drop table if exists stickers;
CREATE TABLE IF NOT EXISTS stickers (
   id int primary key not null,
   title varchar(128) not null
);

-- Создаем таблицу tasks
drop table if exists tasks;
CREATE TABLE IF NOT EXISTS tasks (
   id serial PRIMARY KEY,
   title varchar(256),
   work_type_id integer not null,
   date_created date not null
);

--Создаем таблицу files
drop table if exists files;
CREATE TABLE IF NOT EXISTS files (
   id serial primary key not null,
   task_id int not null,
   sticker_id int
);

--Заполняем таблицу work_types
insert into work_types (id, title) values (100004027, 'Снегопад. Содержание УЗ (1 день)');
insert into work_types (id, title) values (100004028, 'Снегопад. Содержание УЗ (2 день)');
insert into work_types (id, title) values (100004029, 'Снегопад. Содержание УЗ (3 день)');
insert into work_types (id, title) values (100003926, 'Промывка ТПУ и ПЗ');

--Заполняем таблицу stickers
insert into stickers (id, title) values (1, 'ДО');
insert into stickers (id, title) values (2, 'ПОСЛЕ');
insert into stickers (id, title) values (3, 'Посев газона');
insert into stickers (id, title) values (4, 'Ракурс');
insert into stickers (id, title) values (5, 'Инструкция');

--Заполняем таблицу tasks случайными данными,
--(не понял должен ли быть у task свой title или он такой же как work_types title)
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-01-01');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-01-02');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-01-03');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-01-04');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-01-05');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-01-06');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-01-07');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-01-08');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-01-09');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-01-10');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-01-11');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-01-12');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-01-13');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-01-14');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-01-15');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-01-16');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-01-17');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-01-18');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-01-19');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-01-20');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-01-21');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-01-22');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-01-23');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-01-24');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-01-25');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-01-26');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-01-27');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-01-28');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-01-29');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-01-30');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-01-31');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-02-01');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-02-02');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-02-03');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-02-04');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-02-05');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-02-06');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-02-07');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-02-08');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-02-09');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-02-10');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-02-11');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-02-12');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-02-13');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-02-14');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-02-15');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-02-16');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-02-17');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-02-18');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-02-19');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-02-20');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-02-21');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-02-22');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-02-23');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-02-24');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-02-25');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-02-26');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-02-27');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-02-28');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-03-01');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-03-02');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-03-03');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-03-04');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-03-05');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-03-06');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-03-07');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-03-08');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-03-09');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-03-10');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-03-11');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-03-12');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-03-13');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-03-14');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-03-15');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-03-16');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-03-17');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-03-18');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-03-19');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-03-20');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-03-21');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-03-22');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-03-23');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-03-24');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-03-25');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-03-26');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-03-27');
insert into tasks (work_type_id, title, date_created) values (100004029, 'Снегопад. Содержание УЗ (3 день)', '2022-03-28');
insert into tasks (work_type_id, title, date_created) values (100003926, 'Промывка ТПУ и ПЗ', '2022-03-29');
insert into tasks (work_type_id, title, date_created) values (100004027, 'Снегопад. Содержание УЗ (1 день)', '2022-03-30');
insert into tasks (work_type_id, title, date_created) values (100004028, 'Снегопад. Содержание УЗ (2 день)', '2022-03-31');

/*
Заполняем таблицу files
python скриптом сгенерировал такие строки для вставки,
на каждый task_id есть от 9 до 12 случайных значений sticker_id, но иногда случайным образом стикеры отсутствуют:

i = 23
while i < 114:
    icnt = random.randrange(9, 13);
    for s in range(1, icnt):
        r = random.randrange(0, 10);
        ids = random.randrange(1, 6);
        if r == 0:
            ids = 'NULL'
        print('insert into files (task_id, sticker_id) values (',i,', ',ids,');', sep='')
    i += 1

получились такие строки(не вставляю сюда все):
insert into files (task_id, sticker_id) values (23, 1);
insert into files (task_id, sticker_id) values (23, 2);
insert into files (task_id, sticker_id) values (23, NULL);
insert into files (task_id, sticker_id) values (23, 4);
insert into files (task_id, sticker_id) values (23, 5);
insert into files (task_id, sticker_id) values (24, 1);
insert into files (task_id, sticker_id) values (24, 2);

полный спискок в файле files_insert.sql
*/

--select * from files f;

select * from tasks t 
inner join files f on t.id = f.task_id
inner join stickers s on f.sticker_id = s.id
where f.sticker_id is not null --is not null не считается в count, в принципе это условие можно не добавлять
;

with joined as (
--делаем запрос выводящий нужные столбцы из таблиц
select t.id, t.title, t.work_type_id, t.date_created,
       f.sticker_id, s.title as stick_title
  from tasks t 
  inner join files f 
  on t.id = f.task_id
  inner join stickers s
  on f.sticker_id = s.id
  where f.sticker_id is not null
  and t.title ='Снегопад. Содержание УЗ (1 день)'
  and t.date_created between '2022-02-01' and '2022-02-07'
),
--считаем кол-во ракурсов для каждого task
rakurs_cnt as (
select
d.id as task_id, d.title, count(d.stick_title) as rakurs_cnt
from joined d
where d.stick_title = 'Ракурс'
group by d.id, d.title
),
--считаем кол-во фото, кроме ('Ракурс', 'Инструкция')
photo_cnt as(
select
d.id as task_id, d.title, count(d.stick_title) as photo_cnt
from joined d
where d.stick_title not in ('Ракурс', 'Инструкция')
group by d.id, d.title
)
--объединение промежуточных запросов для получения итоговой таблицы
select
r.task_id, r.title, r.rakurs_cnt, p.photo_cnt
from rakurs_cnt r
inner join photo_cnt p
on r.task_id = p.task_id
;
'''
