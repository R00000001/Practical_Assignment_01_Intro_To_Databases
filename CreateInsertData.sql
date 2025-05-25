create database ass01; -- створюю БД
use ass01; -- юзаю БД

-- створюю таблиці
create table dog_color (
    dog_color_id int auto_increment primary key,
    fur_color varchar(50)
);

create table dog_eye_color (
    dog_eye_color_id int auto_increment primary key,
    eye_color varchar(50)
);

create table owner (
    owner_id int auto_increment primary key,
    owner_name varchar(100)
);

create table country (
    dog_country_id int auto_increment primary key,
    country_code varchar(10)
);

create table dog (
    dog_id int auto_increment primary key,
    dog_name varchar(100),
    dog_fur_color_id int,
    dog_eye_color_id int,
    dog_age int,
    owner_id int,
    dog_country_id int,
    foreign key (dog_fur_color_id) references dog_color(dog_color_id),
    foreign key (dog_eye_color_id) references dog_eye_color(dog_eye_color_id),
    foreign key (owner_id) references owner(owner_id),
    foreign key (dog_country_id) references country(dog_country_id)
);

-- заповнюю таблиці рекордами
insert into dog_color (fur_color) values
('black'), ('white'), ('brown'), ('golden'), ('gray');

insert into dog_eye_color (eye_color) values
('brown'), ('blue'), ('hazel'), ('green'), ('amber');

insert into owner (owner_name) values
('alice'), ('bob'), ('clara'), ('dan'), ('ella'),
('frank'), ('gina'), ('harry'), ('ivy'), ('jack');

insert into country (country_code) values
('us'), ('ca'), ('uk'), ('au'), ('de');

insert into dog (dog_name, dog_fur_color_id, dog_eye_color_id, dog_age, owner_id, dog_country_id) values
('buddy', 1, 2, 4, 1, 1),
('max', 3, 1, 5, 2, 1),
('bella', 2, 3, 1, 3, 1),

('luna', 1, 5, 3, 4, 2),
('charlie', 4, 2, 1, 5, 2),
('lucy', 5, 4, 2, 6, 2),

('milo', 3, 1, 3, 7, 3),
('daisy', 2, 2, 2, 8, 3),
('bailey', 1, 3, 1, 9, 3),

('rocky', 4, 4, 5, 10, 4),
('zoe', 2, 5, 4, 1, 4),
('coco', 3, 1, 1, 2, 4),

('ruby', 1, 3, 6, 3, 5),
('sadie', 2, 2, 1, 4, 5),
('toby', 5, 5, 1, 5, 5),

('oscar', 3, 1, 4, 6, 5),
('chloe', 1, 2, 2, 7, 5),
('jack', 4, 4, 5, 8, 5),
('nala', 5, 5, 1, 9, 5),
('bear', 2, 3, 3, 10, 5);
