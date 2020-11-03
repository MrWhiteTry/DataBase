CREATE DATABASE `db_Malbin` CHARACTER SET utf8 COLLATE utf8_general_ci;
SHOW DATABASES;
USE `db_Malbin`;

-- Создаём таблицу Специальность
CREATE TABLE IF NOT EXISTS 
	`spec`(
		id_spec  VARCHAR(5) primary key,
		name_spec  VARCHAR(50)
		);

DESC spec;

INSERT INTO spec (id_spec,name_spec)
	VALUE 
		('pos','Програмирование общих систем'),
		('ilz','Исскувство логических задач'),
		('com','Компьютерные системы')
		;
-- Создаём таблицу "Группы"
CREATE TABLE IF NOT EXISTS
	`groups`(
		`id_group`  SMALLINT UNSIGNED PRIMARY KEY,
		id_spec  VARCHAR(5),
		constraint fk_id_spec foreign key (id_spec)
		references spec (id_spec) on delete cascade on update cascade
	);
	
DESC groups;

INSERT INTO `groups` (`id_group`, `id_spec`) 
	VALUE
	(105,'pos'),
	(103,'ilz'),
	(203,'ilz'),
	(258,'com')
	;

-- Создаём таблицу студенты
CREATE TABLE IF NOT EXISTS 
	`students`(
		id_student SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		s_name  VARCHAR(20),
		f_name  VARCHAR(20),
		patron  VARCHAR(20),
		b_day  DATE,
		data_post  DATE,
		fone_number  VARCHAR(12),
		id_group  SMALLINT UNSIGNED,
		constraint fk1_id_groups foreign key (`id_group`)
		references `groups` (`id_group`) on delete cascade on update cascade
	);
	
DESC students;

INSERT INTO `students` (s_name,f_name,patron,b_day,`data_post`,fone_number,`id_group`)
	VALUE 
		 ('Петров','Семён','Денисов','1982-12-03','2002-08-25','89823651525',105),
		 ('Нарил','Устин','Александрович','1973-11-02','1993-09-30','89945641213',105),
		 ('Кулаков','Бронислав','Иванович','1981-10-03','2007-08-21','89854561217',203),
		 ('Романов','Ян','Дмитриевич','1984-12-12','2005-09-10','89546578456',105),
		 ('Кобзар','Донат','Борисович','1981-03-01','2000-10-10','89548451565',258),
		 ('Абрамова','Алиса','Алексеевич','1985-01-14','2001-10-13','84754651545',103),
		 ('Федотова','Зинаида','Сергеевна','1990-03-11','2018-11-14','83534156515',103),
		 ('Кузнецова','Наталья','Валерьевна','1973-01-11','1998-12-14','8475156512',258),
		 ('Мирна','Ядвига','Александровна','1979-03-15','1999-04-19','84451453212',105)
		 ;

-- Создаём таблицу паспорта домашний адрес
CREATE TABLE IF NOT EXISTS 
	`pas_adres`	(
		`id_adres` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		`id_student`  SMALLINT UNSIGNED,
		`pas_number`  INTEGER,
		`serrias`  INTEGER,
		`pas_date`  DATE,
		`town`  VARCHAR(20),
		`street`  VARCHAR(20),
		`home_number`  INTEGER,
		`kv_number`  INTEGER,
		constraint `fk1_id_student` foreign key (`id_student`)
		references `students` (`id_student`) on delete cascade on update cascade
	);

DESC pas_adres;

INSERT INTO `pas_adres` 
	(pas_number,serrias,`pas_date`,town,street,home_number,kv_number)
VALUE
	(654145,1231,'2000-09-11','Екатеринбург','Сомойлова',35,59),
	(648545,4651,'1984-08-10','Тюмень','Ленина',195,24),
	(613120,6515,'1994-08-17','Екатеринбург','Кузнецова',51,9),
	(452168,6485,'2016-07-06','Тагил','трамвайная',43,85),
	(168232,4468,'2012-04-21','Пермь','Декабристов',3,78),
	(174854,1564,'2011-01-24','Екатеринбург','пр.Космонавтов',138,68),
	(154621,4584,'2010-01-08','Челябинск','Соклова',56,35),
	(161548,1561,'2011-03-16','Челябинск','Ленина',25,45),
	(151612,1652,'2009-08-17','Екатеринбург','Пушкина',54,42)
	;

-- Создаём таблицу родители
CREATE TABLE IF NOT EXISTS
	`parents` (
		id_parrants  SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		fname  VARCHAR(20),
		sname  VARCHAR(20),
		patrony  VARCHAR(20),
		b_day  DATE,
		telefone  VARCHAR(11),
		id_student  SMALLINT UNSIGNED,
		constraint fk2_id_student foreign key (id_student)
		references students (id_student) on delete cascade on update cascade
	);

DESC parents;

INSERT INTO parents (fname, sname, patrony, b_day, telefone, id_student)
	VALUE 
		('Денис','Петров','Анатолиевич','1932.01.30','89465161531',1),
		('Дарья','Петрова','Артёмовна','1952.07.12','85461234613',1),
		('Александр','Устин','Борисович','1941.04.26','84613165631',2),
		('Инна','Устина','Брониславовна','1952.06.12','86554616031',2),
		('Иван','Кулаков','Богданович','1953.04.11','89456135431',3),
		('Мария','Кулакова','Александровна','1953.04.15','84616513521',3),
		('Дмитрий','Романов','Фёдорович','1953.09.30','81621654513',4),
		('Ксения','Романова','Ярославовна','1951.11.18','89616211321',4),
		('Борис','Кобзар','Дмитриевич','1950.12.28','89126161538',5),
		('Юлия','Кобзар','Виталиевна','1949.06.04','86165113215',5),
		('Алексей','Абрамов','Викторович','1941.01.14','89121643133',6),
		('Нина','Абрамова','Даниловна','1940.04.18','85161313128',6),
		('Сергей','Федотова','Васильевич','1938.07.17','85161343127',7),
		('Анастасия','Федотова','Дмитриевна','1935.11.15','89513151311',7),
		('Валерий','Кузнецова','Юхимович','1946.12.14','89132465131',8),
		('Екатерина','Кузнецова','Евгеньевна','1943.09.13','87913431321',8),
		('Александр','Мирна','Петрович','1943.07.03','89513524661',9),
		('Татьяна','Мирна','Евгеньевна','1953.09.04','89163546313',9)
		;

-- Создаём таблицу Предметов
CREATE TABLE IF NOT EXISTS
	`predmet`(
		id_predmet  VARCHAR(3) primary key,
		name_predmet  VARCHAR(40) NULL
	);

DESC predmet;

INSERT INTO predmet (id_predmet,name_predmet)
	VALUE
		('MTA','Математический анлиз'),
		('ARH','Архитектура'),
		('RUS','Русский язык'),
		('MPR','Модульное програмирование');

-- Создаём таблицу экзамен
CREATE TABLE IF NOT EXISTS 
	`exam`(
		exam_id  SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		id_group  SMALLINT UNSIGNED,
		id_predmet  VARCHAR(3),
		form_ex VARCHAR(15),
		semestr VARCHAR(2),
		constraint `fk2_id_groups` foreign key (`id_group`)
		references `groups` (`id_group`) on delete cascade on update cascade,
		constraint `fk1_id_predmet` foreign key (`id_predmet`)
		references `predmet` (`id_predmet`) on delete cascade on update cascade
	);
DESC exam;
INSERT INTO exam (id_group,id_predmet,form_ex,semestr)
	VALUE
		(105,'MTA','экзамен',1),
		(105,'ARH','зачет',2),
		(105,'MPR','зачет',2),
		(105,'MPR','зачет',3),
		(105,'RUS','экзамен',1),
		(103,'MTA','экзамен',1),
		(103,'ARH','зачет',2),
		(103,'MPR','зачет',2),
		(103,'MPR','зачет',3),
		(103,'RUS','экзамен',1),
		(203,'MTA','экзамен',1),
		(203,'ARH','зачет',2),
		(203,'MPR','зачет',2),
		(203,'MPR','зачет',3),
		(203,'RUS','экзамен',1),
		(258,'MTA','экзамен',1),
		(258,'ARH','зачет',2),
		(258,'MPR','зачет',2),
		(258,'MPR','зачет',3),
		(258,'RUS','экзамен',1)
		;

-- Создаём таблицу студенческий балл
CREATE TABLE IF NOT EXISTS 
	`ball_stud`(
		id_student  SMALLINT UNSIGNED,
		exam_id  SMALLINT UNSIGNED,
		ball  INTEGER,
		PRIMARY KEY (id_student,exam_id),
		constraint fk3_id_student foreign key (id_student)
		references students (id_student) on delete cascade on update cascade,
		constraint fk1_exam_id foreign key (exam_id)
		references exam (exam_id) on delete cascade on update cascade
		);

DESC ball_stud;

INSERT INTO ball_stud (id_student,exam_id,ball)
	VALUE 
		(1,1,1),
		(1,2,5),
		(1,3,1),
		(1,4,1),
		(1,5,3),
		(2,6,1),
		(2,7,5),
		(2,8,3),
		(2,9,5),
		(2,10,4),
		(3,11,2),
		(3,12,3),
		(4,13,5),
		(4,14,5),
		(4,15,4),
		(4,16,5),
		(5,17,1),
		(5,18,1),
		(5,19,5),
		(6,20,1),
		(6,1,3),
		(6,2,5),
		(6,3,3),
		(7,4,5),
		(7,5,4),
		(7,6,2),
		(7,7,3),
		(8,8,5),
		(8,9,4),
		(8,10,4),
		(9,11,5),
		(9,12,1),
		(9,13,4),
		(9,14,5),
		(9,15,1)
		;

-- 1) Вывести списки студентов по каждой группе.
SELECT * FROM students ORDER BY id_group;

-- 2) Найти среднее количество студентов в группах.
SELECT AVG(sort) AS Sr_Colich_Student
	FROM
		(SELECT COUNT(id_group) AS sort
		FROM students 
		GROUP BY id_group) AS sorti
	;

-- 3) Вывести список иногородних студентов.

SELECT students.id_student, s_name, f_name, town
from students, pas_adres WHERE NOT town = 'Екатеринбург'
	AND pas_adres.id_adres=students.id_student;

-- 4) Вывести список всех студентов, имеющих более двух задолженностей.

SELECT DISTINCT s_name, f_name
FROM students WHERE students.id_student IN
	(SELECT (id_student)
	FROM ball_stud WHERE ball=1
	GROUP BY id_student
	HAVING COUNT(*)>2)
	;

-- 5) Вывести список всех студентов, не имеющих троек.

SELECT DISTINCT s.s_name, s.f_name
FROM students s, ball_stud
WHERE NOT s.id_student IN
	(SELECT DISTINCT id_student 
	FROM ball_stud 
	WHERE ball=3)
	;

-- 6) Вывести всех студентов, успеваемость которых меньше средней  текущей успеваемости.
SELECT DISTINCT s.s_name, s.f_name, tom.Sredny_Ball
FROM students s,
	(SELECT d.id_student, AVG(d.ball) Sredny_Ball
	FROM ball_stud d
	GROUP BY d.id_student
	HAVING AVG(d.ball) < 
		(SELECT AVG(b.ball) 
		FROM ball_stud b )
	) AS tom
WHERE s.id_student=tom.id_student
;

-- 7) Вывести средний балл  каждого студента.

SELECT DISTINCT s_name, f_name, Sredny_Ball
FROM students,
	(SELECT AVG(ball) AS Sredny_Ball,id_student 
	FROM ball_stud GROUP BY ball_stud.id_student) AS tail
WHERE students.id_student=tail.id_student
;
-- 8) Вывести список студентов, у которых день рождение в текущем месяце, упорядоченный по дням.
SELECT s.s_name, s.f_name, b_day
FROM students s WHERE MONTH(CURRENT_DATE) = MONTH(b_day)
ORDER BY DAY(b_day)
    ;
-- 9) Вывести 5 студентов с самым низким средним баллом.
SELECT DISTINCT s.s_name, s.f_name, tail.Sredny_Ball
FROM students s,
	(SELECT AVG(ball) AS Sredny_Ball,b.id_student 
	FROM ball_stud b GROUP BY b.id_student ORDER BY Sredny_Ball limit 5) AS tail
WHERE s.id_student=tail.id_student
;

-- 10) Вывести студентов, имеющих самый высокий и самый низкий средний балл.
-- 10_1) Вывести студентов, имеющих самый высокий средний балл.
SELECT DISTINCT s.s_name, s.f_name, tail.Max_sredny_ball
FROM students s,
	(SELECT AVG(ball) AS Max_sredny_ball,b.id_student 
	FROM ball_stud b GROUP BY b.id_student ORDER BY Max_sredny_ball DESC limit 1) AS tail
WHERE s.id_student=tail.id_student
;
-- 10_2) Вывести студентов, имеющих самый низкий средний балл.
SELECT DISTINCT s.s_name, s.f_name, tail.Min_sredny_ball
FROM students s,
	(SELECT AVG(ball) AS Min_sredny_ball,b.id_student 
	FROM ball_stud b GROUP BY b.id_student ORDER BY Min_sredny_ball limit 1) AS tail
WHERE s.id_student=tail.id_student
;
