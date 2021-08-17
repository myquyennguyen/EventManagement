create database eventmanagement;
use eventmanagement;
drop database eventmanagement;
create table role(
	role_id int not null auto_increment primary key,
    role_name varchar(20)
);
create table user(
	user_id int not null auto_increment  primary key,
    username varchar(20) not null unique,
    password varchar(100) not null,
    role_id int,
    enable int default 1,
	fullname varchar(50),
    address varchar(200),
    phonenumber varchar(12),
    foreign key(role_id) references role(role_id)
);
create table event(
	event_id int not null auto_increment primary key,
    event_name varchar(200) not null,
    startdate date,
    starttime varchar(10),
    enddate date,
    endtime varchar(10),
    venuename varchar(200),
    fee bigint,
	description varchar(5000),
    tickets int,
    sold int,
    status varchar(20),
    header varchar(300),
    advanceddetails varchar(500),
    map varchar(500)
);

create table register_event(
	id int not null auto_increment primary key,
    user_id int,
    event_id int,
    count_tickets int,
    count_money int,
    foreign key(user_id) references user(user_id),
    foreign key(event_id) references event(event_id)
);
alter table register_event add column date date;

select * from user;
alter table event add column map varchar(500);
drop table event;
select * from event;
insert into event(event_name, startdate, starttime, enddate, endtime, venuename, header, description, fee, tickets, sold, status) value('Workshop lộ trình tự học IELTS từ cơ bản đến nâng cao', '2021-4-17', '15:00', '2021-4-17', '16:30', 'VICTORIA ENGLISH - 228 Trần Hưng Đạo, Q. Sơn Trà, TP. Đà Nẵng.', 'Chương trình tư vấn và hỗ trợ học tập IELTS của Victoria English dành cho sinh viên Đà Nẵng', 'Chương trình tư vấn và hỗ trợ học tập IELTS của Victoria English dành cho sinh viên Đà Nẵng :<br>-Hướng dẫn xây dựng cách tự học tiếng Anh hiệu quả<br>-Hướng dẫn xây dựng nền móng tiếng Anh cơ bản<br>-Tư vấn lộ trình cá nhân hóa cho việc học IELTS<br>-Hỗ trợ tài liệu học IELTS', 100000, 50, 0, 'Published' );
delete from event where event_id=11;
delete from user where username='user3';




alter table event add column(tickets int);
alter table event add column(sold int);
alter table event add column(status varchar(20));
alter table event add column(header varchar(100));
alter table event add column(advanceddetails varchar(100));
update event set tickets = 20 where event_id=2;
update event set sold = 0 where event_id=2;
update event set tickets = 20 where event_id=3;
update event set sold = 10 where event_id=3;
update event set status = 'Published' where event_id=2;
update event set status = 'Draft' where event_id=3;
update user set password='$2a$10$cYLM.qoXpeAzcZhJ3oXRLu9Slkb61LHyWW5qJ4QKvHEMhaxZ5qCPi' where user_id=3;
drop table event;
insert into role(role_name) value('ROLE_ADMIN');
insert into role(role_name) value('ROLE_MEMBER');
update role set role_name='ROLE_MEMBER' where role_id=2;
select * from role;
select * from user;
delete from user where user_id=10;
update user set password = '$2a$10$cYLM.qoXpeAzcZhJ3oXRLu9Slkb61LHyWW5qJ4QKvHEMhaxZ5qCPi' where user_id = 1; 
insert into user(username, fullname, password, role_id) value('admin','', '$2a$10$cYLM.qoXpeAzcZhJ3oXRLu9Slkb61LHyWW5qJ4QKvHEMhaxZ5qCPi',1);
insert into user(username, fullname, password, role_id, address, phonenumber) value('user1', 'Nguyễn Ngọc Minh', '$2a$10$cYLM.qoXpeAzcZhJ3oXRLu9Slkb61LHyWW5qJ4QKvHEMhaxZ5qCPi', 2, '21B đường 3/2,phường Xuân Khánh, quận Ninh Kiều, Cần Thơ', '0099877864');
insert into user(username, fullname, password, role_id, address, phonenumber) value('user2', 'Trần Thanh Nhã', '$2a$10$cYLM.qoXpeAzcZhJ3oXRLu9Slkb61LHyWW5qJ4QKvHEMhaxZ5qCPi', 2, 'Xã Mỹ Hạnh Đông, TX.Cai Lậy, Tiền Giang', '0327551900');

insert into event(event_name, startdate, starttime, enddate, endtime, venuename, description, fee, user_id) value('Picnic', '2021-3-2', '7:30 AM', '2021-3-2', '11:30 AM', 'Cong vien', 'da ngoai o cong vien', 300000, 3 );
insert into event(event_name, startdate, starttime, enddate, endtime, venuename, description, fee, user_id) value('Du lich', '2021-3-2', '7:30 AM', '2021-3-2', '11:30 AM', 'Cong vien', 'da ngoai o cong vien', 300000, 3 );
insert into event(event_name, startdate, starttime, enddate, endtime, venuename, description, fee, user_id, tickets, sold, status) value('Du lich', '2021-3-2', '7:30 AM', '2021-3-2', '11:30 AM', 'Cong vien', 'da ngoai o cong vien', 300000, 3, 30, 5, 'Published');
insert into event(event_name, startdate, starttime, enddate, endtime, venuename, description, fee, user_id, tickets, sold, status) value('Tam bien', '2021-7-2', '7:30 AM', '2021-7-2', '11:30 AM', 'Cong vien', 'da ngoai o cong vien', 300000, 3, 30, 5, 'Published');
